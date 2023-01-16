/*
 * Description : 
 * @Author : 
 * */

public class AccountTriggerHandler 
{
    //This method create Contacts based on metadata record phone values
    public static void onAfterInsert(List<Account> newList)
    {
        List<AccContactMetadata__mdt> mdtnewList = new  List<AccContactMetadata__mdt>();
        List<String> accPhoneList = new List<String>();
        List<Contact> conList = new List<Contact>();
        Map<String,AccContactMetadata__mdt> metadataByPhoneMap=new Map<String,AccContactMetadata__mdt>(); //map name metadataByPhoneMap
        //Integer count=0;
        for(Account acc:newList)
        {
            accPhoneList.add(acc.Phone);
            //count=(Integer)acc.Number_of_Contacts__c;
        }
        
        //System.debug(metaList);
        //iterating over metaList and adding values to the Map
        for(AccContactMetadata__mdt mdt:[SELECT Name__c, Phone__c, Email__c FROM AccContactMetadata__mdt
                                         Where Phone__c IN : accPhoneList])	
        {
            metadataByPhoneMap.put(mdt.Phone__c,mdt);
        }
        
        for(Account acc:newList)
        {
            if(acc.Number_of_Contacts__c != null && metadataByPhoneMap.ContainsKey(acc.Phone) && acc.Number_of_Contacts__c <= 3)//checking whether the acc.Phone is present in map(Key) or not
            {
                for(Integer i=0;i<acc.Number_of_Contacts__c;i++)
                {
                    Contact con=new Contact();
                    con.LastName=metadataByPhoneMap.get(acc.Phone).Name__c;
                    con.Email=metadataByPhoneMap.get(acc.Phone).Email__c;
                    con.Phone=metadataByPhoneMap.get(acc.Phone).Phone__c;
                    con.AccountId=acc.Id;
                    conList.add(con);                   
                }
                //system.debug('---->'+conList);
            }
            if(acc.Number_of_Contacts__c>3)//It will through error if Number_of_Contacts__c > 3
            {
                acc.addError('Can not create contact as Number_of_Contacts__c is greater than 3' );
            }
        }
        
        INSERT conList;  
    }
}
//proper intentation
//change method name. use a generic method like onAfterInsert
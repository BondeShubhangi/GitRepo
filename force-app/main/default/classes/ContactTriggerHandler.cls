//This is a Handler class for ContactTrigger
public class ContactTriggerHandler {
    //This method is for After Insert And Update Event
    public static void onAfterInsertUpdate(List<Contact> newList,List<Contact> oldList)
    {
        Set<ID> accIds=new Set<ID>();
        if(newList != NULL)
        {
            for(Contact c:newList)
            {
                accIds.add(c.AccountId);
                
            }
        }
        if(oldList != NULL)
        {
            for(Contact c:oldList)
            {
                accIds.add(c.AccountId);
            }
        }
        List<Account> accList=[SELECT Id, Number_of_Contacts__c,(SELECT Id from Contacts) FROM Account
                               WHERE Id IN:accIds];
        if(!accList.isEmpty())
        {
            for(Account acc:accList)
            {
                acc.Number_of_Contacts__c=acc.Contacts.Size();
            }
            update accList;
        }
        
    }
    //This Method is for After Delete Event
    public static void onAfterDelete(List<Contact> oldList)
    {
        Set<ID> accIds=new Set<ID>();
        if(oldList != NULL)
        {
            for(Contact c:oldList)
            {
                accIds.add(c.AccountId);
            }
        }
        List<Account> accList=[SELECT Id, Number_of_Contacts__c,(SELECT Id from Contacts) FROM Account
                               WHERE Id IN:accIds];
        if(!accList.isEmpty())
        {
            for(Account acc:accList)
            {
                acc.Number_of_Contacts__c=acc.Contacts.Size();
            }
            update accList;
        }
        
    }
    /*public static void onAfterUpdate(List<Contact> newList,List<Contact> oldList)
    {
		onAfterInsertUpdate(newList);  
        onAfterUpdateDelete(oldList);
        
    }*/
    
}
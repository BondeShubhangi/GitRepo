/* Description :  Whenever create an Oppertunity with 
* 					StageName ='Closed Won' && Type ='New Customer' && CloseDate = Date.today() && RecortType = 'New Customer'
* 					then new Task will be created with Subject as Metadata Subject value and send Notification Mail to contact owner
* 					And if record is updated with StageName ='Closed Lost' the associted Task will be deleted and send Notification Mail to contact owner
* @Author : Shubhangi Bonde 
* */
public class OppertrunityTriggerHandler 
{
    //This method create Task based on metadata record Subject value and send Notification Mail to contact owner
    public static void onAfterInsert(List<Opportunity> newOppList)
    {
        List<Task> taskList = new List<Task>(); 
        List<OppertunityMetadata__mdt> mdtnewList = new  List<OppertunityMetadata__mdt>();
        Map<String,OppertunityMetadata__mdt> metadataNextStepMap=new Map<String,OppertunityMetadata__mdt>();
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        List<String> oppNextStepList = new List<String>();//for adding opportunity NextStep value for getting data from custom metadata
        //Getting Opportunity RecordType Id 
        //Id devRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('New Customer').getRecordTypeId();
        Id recordTypeId = [Select Id from RecordType where Name LIKE 'New Customer'].Id;
        Contact con = [SELECT Id, LastName, Email FROM Contact Where LastName = 'Test Contact' LIMIT 1];
        for(Opportunity opp : newOppList)
        {
            oppNextStepList.add(opp.NextStep);
        }
        for(OppertunityMetadata__mdt mdt:[SELECT Id, MasterLabel, Subject__c FROM OppertunityMetadata__mdt
                                          Where MasterLabel IN : oppNextStepList])	
        {
            metadataNextStepMap.put(mdt.MasterLabel.toLowercase(),mdt);
        }
        for(Opportunity opp : newOppList)
        {
            String str = (opp.NextStep).toLowerCase();
            if(opp.RecordTypeId == recordTypeId && opp.StageName == 'Closed Won' && opp.Type =='New Customer' && metadataNextStepMap.ContainsKey(str) && opp.CloseDate == Date.today())
            {
                if(OppTaskCustomSetting__c.getInstance(UserInfo.getProfileId()).Task__c == true)
                {                
                    Task t = new Task();
                    t.WhatId = opp.Id;
                    t.Subject = metadataNextStepMap.get(str).Subject__c;
                    t.Status = 'In Progress';
                    t.ActivityDate = System.today() + 10;
                    t.WhoId = con.Id;
                    taskList.add(t); 
                }
             }
        }
        if(taskList.Size() > 0)
        {
            insert taskList;
            //sending Notification Email
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setTargetObjectId(con.Id);//The ID of the contact,user to which the email will be sent. 
            mail.setSubject('Task Created');//The email subject line. 
            mail.setplaintextbody('Hello!!!New Task is Created and Assigned to you');//The text version of the email
            emailList.add(mail);
            if(!emailList.isEmpty())
            {
            Messaging.sendEmail(emailList);
            }
        }
        
    }
    //This method will delete Task if StageName ='Closed Lost'  and send Notification Mail to contact owner
    public static void onAfterUpdate(List<Opportunity> newOppList , Map<Id,Opportunity> oppOldMap)	
    {
        
        List<Id> oppIdList =new List<Id>();
        List<Task> taskListDelete=new List<Task>();
        List<String> taskEmail = new List<String>();
        
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        for(Opportunity opp : newOppList)
        {
            if(opp.StageName == 'Closed Won')//if field is updated to Closed Won again Task be created
            {
                OppertrunityTriggerHandler.onAfterInsert(newOppList);
            }
            else if(opp.StageName == 'Closed Lost' && oppOldMap.get(opp.Id).StageName == 'Closed Won')  
            {
                oppIdList.add(opp.Id);
            }
        }
        
        List<Task> taskObjList =[SELECT WhatId, WhoId ,Id FROM Task where WhatId IN:oppIdList];
        for(Task tsk:taskObjList)
        {
            taskListDelete.add(tsk);
            taskEmail.add(tsk.WhoId);
        }
        
        if(taskListDelete.size()>0)
        {
            delete  taskListDelete;
            
            for(String str : taskEmail)//iterating over taskEmail List to send Notification Email
            {
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setTargetObjectId(str);
                mail.setSubject('Task Deleted');
                mail.setplaintextbody('Hello!!!Your Task is Deleted which is assigned to you');
                emailList.add(mail);
                if(!emailList.isEmpty())
                {
                Messaging.sendEmail(emailList);
                }
			}


        }
    }
}
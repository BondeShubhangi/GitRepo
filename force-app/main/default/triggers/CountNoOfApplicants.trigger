trigger CountNoOfApplicants on Job_Application__c (After insert,After update,After Delete,After Undelete)
{
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert||Trigger.isUpdate||Trigger.isDelete||Trigger.isUndelete)
        {
            CountApplicantsHandler.CountApplications(Trigger.new,Trigger.old);
        }
    }
      
}
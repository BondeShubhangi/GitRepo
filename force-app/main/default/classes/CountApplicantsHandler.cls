public class CountApplicantsHandler 
{
    public static void CountApplications(List<Job_Application__c> newlist,List<Job_Application__c> oldlist)
    {
        Set<Id> jobIds=new Set<Id>();
        if(newlist !=null)
        {
            for(Job_Application__c c:newlist)
            {
                if(c.Job__r.id!=null)
                {
                    jobIds.add(c.Job__r.id);
                }
            }
        }
         if(oldlist!=null)
        {
            for(Job_Application__c c:oldlist)
            {
                if(c.Job__r.id!=null)
                {
                    jobIds.add(c.Job__r.id);
                }
            }
        }
        List<Job__c> joblist=[SELECT Id, Number_of_Applicants__c,(SELECT Id from Job_Applications__r)FROM Job__c where Id IN:jobIds];
        if(!joblist.isEmpty())
        {
            for(Job__c j:joblist)
            {
                j.Number_of_Applicants__c=j.Job_Applications__r.Size();
            }
        }
        update joblist;
    }

}
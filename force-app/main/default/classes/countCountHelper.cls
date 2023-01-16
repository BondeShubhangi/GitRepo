public class countCountHelper 
{
    /*public static void CountCon(List<Contact> newlist,List<Contact> oldlist)
    {
        Set<Id> accIds=new Set<Id>();
        if(newlist !=null)
        {
            for(contact c:newlist)
            {
                if(c.accountId!=null)
                {
                    accIds.add(c.accountId);
                }
            }
        }
        if(oldlist!=null)
        {
            for(contact c:oldlist)
            {
                if(c.accountId!=null)
                {
                    accIds.add(c.accountId);
                }
            }
        }
        
        List<Account> acclist=[SELECT Id,Number_of_contacts_Associated__c,(select Id from contacts)from Account where Id IN:accIds];
        if(!acclist.isEmpty())
        {
            for(Account acc:acclist)
            {
                acc.Number_of_contacts_Associated__c=acc.contacts.size();
            }
        }
        update acclist;
        
    }*/
}
trigger AddRelatedRecords on Account (After insert,After update) 
{
    List<Opportunity> oppList = new List<Opportunity>();
   //Map<Id,Account> accWithOpp=new Map<Id,Account>([SELECT Id,(SELECT Id from Oppertunities)From Account
     //                                               Where Id IN:Trigger.new]);
    Map<Id,Account> accWithOpp = new Map<Id,Account>([SELECT Id,(SELECT Id FROM Opportunities)
                                                         FROM Account WHERE Id IN :Trigger.new]);
     for(Account acc:Trigger.new)
     {
        System.Debug('Size of accWithOpp List : '+accWithOpp.get(acc.Id).Opportunities.Size());
        if(accWithOpp.get(acc.Id).Opportunities.Size()==0)
        {
            oppList.add(new Opportunity(Name=acc.Name+' Oppertunity',
                                        StageName='Prospecting',
                                        CloseDate=System.today(),
                                        AccountId=acc.Id));
        }
        
     }
     if(oppList.Size()>0)
     {
        insert oppList;
     }

}
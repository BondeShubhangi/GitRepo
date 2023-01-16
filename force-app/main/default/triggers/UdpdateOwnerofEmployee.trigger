trigger UdpdateOwnerofEmployee on Consultant__c (before insert) {
   // User u=[SELECT Id, Type__c, Salary__c FROM Consultant__c where Type__='Employee' and Salary__c>10000]
   Group obj=[Select Id from Group where type='Queue' and Name='Manager Queue'];
    for(Consultant__c c:Trigger.new)
    {
        if(c.Type__c =='Employee' &&  c.Salary__c >10000)
        {
            c.OwnerId=obj.Id;
        }
    }
}
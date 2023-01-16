trigger UpdateOwnerofEmployee on Consultant__c (before insert) {
    Group obj=[Select Id from Group where type='Queue' and Name='Manager Queue'];
    for(Consultant__c c:trigger.new)
    {
        if(c.Type__c=='Employee' && c.Salary__c >10000)
        {
            c.OwnerID=obj.id;
        }
    }

}
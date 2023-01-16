trigger CreateChildLeaveRequestOnConsooltant on Consultant__c (after insert,after update,before insert,before update) 
{
    if(trigger.isAfter &&  trigger.isInsert)
    {
        List<Leave_Request__c> l1=new List<Leave_Request__c>();
        for(Consultant__c c1:trigger.new)
        {
            if(c1.Type__c=='Contractor' && c1.Salary__c >100000)
            {
                Leave_Request__c r1=new Leave_Request__c();
                r1.Name='Document check';
                r1.Start_Date__c=date.Today();
                r1.End_Date__c=date.Today()+2;
                r1.Consultant__c=c1.id;
                //insert(r1);
                l1.add(r1);            
            }
        }
        insert(l1);
    }
    if(trigger.isBefore && trigger.isDelete)
    {
        for(consultant__c c:trigger.old)
        {
            if(c.Type__c=='Employee' && c.Status__c=='Approved')
            {
                c.addError('You can not delete this record,please contact to your system Admin');
            }
        }
    }
    if((trigger.isBefore && trigger.isInsert)||(trigger.isBefore && trigger.isUpdate))
    {
        for(Consultant__c con:trigger.new)
        {
            if(con.Type__c =='Employee')
            {
                con.Name='Mr. '+con.Name;
            }
            else if(con.Type__c =='Vender')
            {
                con.Name='Dr. '+con.Name;
            }
        }
    }
}
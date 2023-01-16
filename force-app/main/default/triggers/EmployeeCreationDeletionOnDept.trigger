trigger EmployeeCreationDeletionOnDept on Department__c (After insert,before delete) 
{
  if(trigger.isAfter && trigger.isInsert)
  {
    List<Employee__c> l1=new List<Employee__c>();
    for(Department__c d1:trigger.new)
    {
        if(d1.type__c=='Finance')
        {
            Employee__c e1=new Employee__c();
            e1.Name='Account Manager';
            e1.Joining_Date__c=date.today()+10;
            e1.Department__c=d1.Id;
            l1.add(e1);
        }
    }
    insert(l1);
  }
  if(trigger.isBefore && trigger.isDelete)
  {
        for( Department__c  c1:trigger.old)
    	{
            if(c1.Type__c=='Finance')
            {
                c1.addError('You cannot delte this record.plz contact to System Admin.');
            }
    	}
  }
}
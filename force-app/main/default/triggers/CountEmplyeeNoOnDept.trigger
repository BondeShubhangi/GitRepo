trigger CountEmplyeeNoOnDept on Employee__c (before insert)
{
    list<Department__c> addcount=new list<Department__c>();
    list<id> deptid=new list<id>();
    if(trigger.isInsert)
    {
        for(Employee__c e1:trigger.new)	
        {
            deptid.add(e1.Department__r.id);
        }
    }
    list<Department__c> d1=[select id,Count_of_Employee__c,(Select id from Employees__r)from Department__c where id in:deptid];
   for(Department__c d:d1)
   {
       d.Count_of_Employee__c=d.Employees__r.size();
       addcount.add(d);
   }
   update addcount;

}
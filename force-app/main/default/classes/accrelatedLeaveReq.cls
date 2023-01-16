public class accrelatedLeaveReq {
    public static void CreateCon(List<Consultant__c> conlist)
    {
        List<Leave_Request__c> l1=new List<Leave_Request__c>();
        for(Consultant__c c:conlist)
        {
            if(c.Number_of_leave_Request__c > 0)
            {
                for(Integer i=1;i<=c.Number_of_leave_Request__c;i++)
                {
                    Leave_Request__c r1=new Leave_Request__c();
                    r1.Name=c.Name+i;
                    r1.Start_Date__c=date.Today();
                    r1.End_Date__c=date.Today()+2;
                    r1.Consultant__c=c.id;
                    l1.add(r1); 
                }
            }
        }
        insert l1;
        
    }
    
}
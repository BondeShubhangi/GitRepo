trigger MaintenanceDueTrigger on Maintenance__c (before insert,before Update) {
    List<Member__c> memb = new List<Member__c>();
    List<Id> MemberIdList = new List<Id>();
    for(Maintenance__c main : trigger.new)
    {
        MemberIdList.add(main.Member__c);
        for(Member__c m :[SELECT Id, Maintenance_Amount_Due__c FROM Member__c Where Id IN :MemberIdList])
        {
            if(main.Amount_Paid__c==true)
            {
                m.Maintenance_Amount_Due__c ='Amt Paid';
                memb.add(m);
            }
            else
            {
                m.Maintenance_Amount_Due__c ='Amt Unpaid';
                memb.add(m);
            }
        }
            
    }
    upsert memb;

}
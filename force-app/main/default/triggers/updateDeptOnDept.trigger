trigger updateDeptOnDept on Department__c (before insert,before update) {
    for( Department__c  c1:trigger.new )
    {
        if(c1.Type__c=='Finance')
        {
            //c1.addError('You cannot delte this record.plz contact to System Admin.');
            c1.Type__c='Logistics';
        }
    }

}
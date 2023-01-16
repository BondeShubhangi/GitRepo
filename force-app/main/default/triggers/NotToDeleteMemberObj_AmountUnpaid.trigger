trigger NotToDeleteMemberObj_AmountUnpaid on Member__c (before delete) {
    for(Member__c m:trigger.old)
    {
        if(m.Maintenance_Amount_Due__c=='Amt Unpaid')
        {
            trigger.oldmap.get(m.Id).addError('Cannot delete Member Record because Maintenace Amount is Pending...');
        }
    }

}
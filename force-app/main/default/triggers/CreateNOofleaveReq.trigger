trigger CreateNOofleaveReq on Consultant__c (After insert,After Update) {
    if(trigger.isAfter && trigger.isInsert || trigger.isUpdate)
    {
        accrelatedLeaveReq.Createcon(Trigger.new);
    }
}
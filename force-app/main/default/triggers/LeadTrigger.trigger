trigger LeadTrigger on  Lead (before insert) {
    for(Lead l:Trigger.new)
    {
        l.NumberofLocations__c=10;
        l.Rating='Hot';
    }

}
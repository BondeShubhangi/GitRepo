/*REQUIRMENT:
When new Lead record created,if LeadSource='Web' Update Industry='Banking'*/

trigger UpdateIndustryOnInsertLead on Lead (before insert) {
    for(Lead l1:trigger.new)
    {
        if(l1.LeadSource=='Web')
        {
            l1.Industry='Banking';
        }
    }

}
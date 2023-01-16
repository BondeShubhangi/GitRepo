trigger OppertrunityTrigger on Opportunity (Before Update,After Insert,After Update) 
{
    if(Trigger.isAfter && Trigger.isInsert)
    {
		OppertrunityTriggerHandler.onAfterInsert(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isUpdate)
    {
		OppertrunityTriggerHandler.onAfterUpdate(Trigger.new,Trigger.oldMap);
    } 
}
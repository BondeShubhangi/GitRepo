trigger AccountTrigger on Account (After insert)
{
    
    if(Trigger.isAfter && Trigger.isInsert)
    {
        //method call for creating Contact based on metadata record phone values
        AccountTriggerHandler.onAfterInsert(Trigger.new);//onAfterInsert
    }
}
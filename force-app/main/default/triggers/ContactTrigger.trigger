trigger ContactTrigger on Contact (After insert,After Update,After Delete) {
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert || Trigger.isUpdate)
        {
            ContactTriggerHandler.onAfterInsertUpdate(Trigger.new,Trigger.old);
        }
        if(Trigger.isDelete)
        {
            ContactTriggerHandler.onAfterDelete(Trigger.old);
        }
    }

    
    
    /*if(Trigger.isAfter && Trigger.isInsert)
	{
		ContactTriggerHandler.onAfterInsert(Trigger.new);
	}
	if(Trigger.isAfter && Trigger.isUpdate)
	{
		ContactTriggerHandler.onAfterUpdate(Trigger.new,Trigger.old);
	}

	if(Trigger.isAfter && Trigger.isDelete)
	{
		ContactTriggerHandler.onAfterDelete(Trigger.old);
	}*/
    
}
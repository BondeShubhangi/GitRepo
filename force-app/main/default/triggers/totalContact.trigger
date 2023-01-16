trigger totalContact on Contact (After insert,After update,After Delete,After Undelete) 
{
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert||Trigger.isUpdate||Trigger.isDelete||Trigger.isUndelete)
        {
            countCountHelper.CountCon(Trigger.new, Trigger.old);
        }
    }

}
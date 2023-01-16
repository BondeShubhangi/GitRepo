trigger caseChangeType on Case (before insert,before update) {
   // TriggerOnCases toc=new TriggerOnCases();
    if(Trigger.isInsert && Trigger.isBefore ||Trigger.isUpdate && Trigger.isBefore)
    {
        TriggerOnCases.changeType(Trigger.new);
    }

}
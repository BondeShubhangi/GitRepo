trigger UdpdateConsultant on Consultant__c (before update) {
    for(integer i=0;i<Trigger.new.size();i++)
    {
        if((Trigger.old[i].Type__c=='Employee' && trigger.new[i].Type__c!='Employee') 
           &&(Trigger.old[i].Status__c=='Approved' && trigger.new[i].Status__c!='Approved'))
        {
                  Trigger.new[i].addError('you can not update ');
        }
    }
    
}
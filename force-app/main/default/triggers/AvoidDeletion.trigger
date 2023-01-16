trigger AvoidDeletion on Consultant__c (before delete) {
    
            for(consultant__c c:trigger.old)
        {
            if(c.Type__c=='Employee' && c.Status__c=='Approved')
            {
                c.addError('You can not delete this record,please contact to your system Admin');
            }
        }

    
}
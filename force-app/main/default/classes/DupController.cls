public with sharing class DupController {

    public DupController() {

    }

public Consultant__c c;
    public DupController(ApexPages.StandardController controller) {
        this.c=(Consultant__c)controller.getRecord();
        c.ownerid=UserInfo.getUserId();
    }
  
    public PageReference DuplicateRecords()
    {
        upsert c;
        PageReference pnext=new PageReference('/apex/ConOutput?id='+c.id);
        pNext.setRedirect(true);
        return pNext;    
    
    }

}
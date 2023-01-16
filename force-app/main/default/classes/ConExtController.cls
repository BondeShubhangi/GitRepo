public with sharing class ConExtController {
    public Consultant__c con;

    public ConExtController(ApexPages.StandardController controller) {
        this.con=(Consultant__c)controller.getRecord();
        con.ownerId=UserInfo.getUserId();

    }
    public PageReference Save()
    {
        upsert con;
        PageReference pNext=new PageReference('/apex/ConOutputExt?id='+con.id);
        pNext.setRedirect(true);
        return pNext;
    }
    public PageReference SaveAndNew()
    {
        upsert con;
        PageReference pNext=new PageReference('https://d5j000002x8ipeac-dev-ed--c.visualforce.com/apex/ConsultantInputExt');
        pNext.setRedirect(true);
        return pNext;
    }

}
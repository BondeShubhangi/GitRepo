public with sharing class accExtController {
    
    public Account acc;
    public accExtController(ApexPages.StandardController controller) {
        this.acc=(Account)controller.getRecord();
        acc.ownerid=UserInfo.getUserId();
    }
    //Logic for Save Button step 1.Record is save 2.nevigate to next Page
    public PageReference Save()
    {
        upsert acc;
        PageReference pnext=new PageReference('/apex/accOutputExt?id='+acc.id);
        pNext.setRedirect(true);
        return pNext;    
    
    }
    //Logic for SaveAndNew Button step 2.record is saved 2.nevigate to the current page with blank fields
    public PageReference SaveAndNew()
    {
        upsert acc;
        PageReference pnext=new PageReference('/apex/accInputExt');
        pNext.setRedirect(true);
        return pNext;    
    
    }
}
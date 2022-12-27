public with sharing class outputcontroller {
    public Member__c mem{get; set;}

    public outputcontroller(ApexPages.StandardController controller) 
    {
        this.mem=(Member__c)controller.getRecord();

    }
    public PageReference Clonee()
    {
        upsert mem;
        PageReference pNext=new PageReference('/apex/MemberInputPage?id='+mem.id);
        pNext.setRedirect(true);
        return pNext;
    }
    public pageReference Editt(){
        upsert mem;
        PageReference pageN =new pageReference('/apex/MemberInputPage?id='+mem.id);
        pageN.setRedirect(true);
        return pageN;
       }


}
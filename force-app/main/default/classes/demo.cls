public with sharing class demo {
    public Boolean showOwner{get; set;}
    public Boolean showTenant{get; set;}
    public Member__c mem{get; set;}

    public demo(ApexPages.StandardController controller) {
        showOwner=false;
        ID memID=ApexPages.currentPage().getParameters().get('id');
        if(memID!=Null)
        {
            mem=[SELECT Id, OwnerId,  Name, Flat_Number__c, Name__c, Gender__c, Family_Count__c, Phone__c, Email_ID__c, Aadhaar_Number__c,
             PAN_Number__c, Flat_Type__c, Parking__c, Type__c, Maintenance_Amount_Due__c, Permanent_Address__c, Office_Address__c, Reference_Name__c,
              Reference_Phone__c, Registration_No__c, Police_Number_Verification__c, Family_Status__c, Tenure_From__c, Tenure_To__c, Rent_Per_Month__c,
               Deposited_Amount__c, Total_Rent__c FROM Member__c where id=:memID];
        }
        else
        {
            mem=new Member__c();
            mem.ownerId=UserInfo.getUserId();
            
        }

    }
    public PageReference showSection()
    {
         if(mem.Type__c == 'Owner'){
            showOwner = true ;
            showTenant= false;
        }
        else if(mem.Type__c == 'Tenant'){
            showTenant= true;
            showOwner = false;
        }
        
        else{
            showOwner = false;
            showTenant= false;
        }
        return null;
    }
     public PageReference Save()
    {
        upsert mem;
        pageReference pNext=new PageReference('/apex/MemberOutputPage?id='+mem.id);
        pNext.setRedirect(true);
        return pNext;
    }
   
    public pageReference SaveAndNew(){
        upsert mem;
        PageReference pageN =new pageReference('/apex/MemberInputPage');
        pageN.setRedirect(true);
        return pageN;
       }
     public pageReference Clonee(){
        upsert mem;
        PageReference pageN =new pageReference('/apex/MemberInputPage?id='+mem.id);
        pageN.setRedirect(true);
        return pageN;
       }
     public pageReference Cancel(){
       
        PageReference pageN =new pageReference('/a00/o');
        pageN.setRedirect(true);
        return pageN;
 
    }

}
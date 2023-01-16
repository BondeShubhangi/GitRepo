public with sharing class AccCustomController {

    public String getAccount() {
        return null;
    }



        public Account acc{get;set;}
        public AccCustomController()
        {
            acc=new Account();
            acc.OwnerId=UserInfo.getUserId();
        }
        
    
}
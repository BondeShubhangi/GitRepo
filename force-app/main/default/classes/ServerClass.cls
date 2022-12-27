public class ServerClass {
    @AuraEnabled
    public static void CreateAcc(string cname,string ccity,string phone)
    {
        Account acc=new Account();
        acc.Name=cname;
        acc.BillingCity=ccity;
        acc.Phone=phone;
        
        insert acc;
        
    }
}
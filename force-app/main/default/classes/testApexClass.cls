public class testApexClass {
    public static void createAcc()
    {
        Account acc=new Account();
        acc.Name='ApexClassAccount1';
        acc.rating='Hot';
        insert acc;
        System.debug('Account Created'+acc.Name);
    }

}
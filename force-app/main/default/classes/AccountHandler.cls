public class AccountHandler {
    public static Account insertNewAccount(String AccName)
    {
        try {
            Account acct = new Account(Name=AccName);
            insert acct;
            return acct;
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' +
                         e.getMessage());
            return null;
        }
        
    }
    
}
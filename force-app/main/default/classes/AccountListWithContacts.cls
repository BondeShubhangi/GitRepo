public class AccountListWithContacts 
{
    public static void displayAccountList()
    {
        List<Account> acc=[Select Id,Name from Account];
        for(Account a:acc){
            List<Opportunity> opplist=[SELECT Id FROM Opportunity Where AccountId=:a.id and StageName='Closed Won'];
            List<Contact> con=[Select LastName from contact where AccountId=:a.id];
            
            if(con.size()>200 && opplist.size()>=20){
                System.debug('AccountName '+''+a.Name);
                //System.debug('AccountName '+''+a.Name+' RelatedContacts '+''+c.LastName);
            }
            
        }
        
    }
}
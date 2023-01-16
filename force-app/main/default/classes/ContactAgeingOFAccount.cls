public class ContactAgeingOFAccount {
    public static void returnAverage(Id accId)
    {
        List<Contact> conlist=[Select Id from Contact where AccountId =:accId];
        for(Contact c:conlist)
        {
            
        }
    }

}
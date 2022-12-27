public class CheckForAccountBiilingPostalCode {
    public static void CheckValidation(List<Account> acclist)
    {
        for(Account acc:acclist)
        {
            if(acc.BillingCountry=='USA')
            {
                if(!acc.BillingPostalCode.isNumeric() && acc.BillingPostalCode.length()!=5)
                {
                    acc.addError('Pease Enter Valid Zipcode(00000)');
                }
            }
        }
        
    }

}
trigger AccountBillingPostalCodeValidation on Account (before insert,before update) {
    if(Trigger.isBefore && Trigger.isInsert || Trigger.isUpdate)
    {
        for(Account a:Trigger.new)
        {
            if(a.BillingCountry=='USA') 
            {
                system.debug('Into it');
                if(!(a.BillingPostalCode.isNumeric()) ){
                    a.adderror('Pincode must be numeric only and 5');
                }
               if(a.BillingPostalCode.length()!= 5){
                    a.adderror('Pincode must be 5 digits for USA');
                }
            }
            if(a.BillingCountry=='India')
            {
                system.debug('Into it');
                if(!(a.BillingPostalCode.isNumeric())){
                    a.adderror('Pincode must be numeric only');
                }
                if(a.BillingPostalCode.length()!= 6){
                    a.adderror('Pincode must be 6 digits for India');
                }
            }
            if(!(a.BillingPostalCode.isNumeric())) //other than USA and India all other country zipcode must be numeric
            {
                a.adderror('Pincode must be numeric only');
            }
        }    
        
    }
}
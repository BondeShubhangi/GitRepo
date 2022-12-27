/*When the new consulytant is created,if type=Employee add a prefix 'Mr' before the name
else if type=Vendor,add a prefix 'DR' before the name
*/

trigger AppendPrefix on Consultant__c (before insert,before Update) {
    for(Consultant__c con:trigger.new)
    {
        if(con.Type__c =='Employee')
        {
            con.Name='Mr. '+con.Name;
        }
        else if(con.Type__c =='Vender')
        {
            con.Name='Dr. '+con.Name;
        }
    }
}
trigger UpdateContactField on Account (After insert,After Update) 
{
    List < Account > accList=[SELECT id,Industry,(SELECT id,Industry__c FROM contacts) FROM Account  WHERE id IN:trigger.new];
    
    List < contact > conList = new List < contact >();
    
    for(Account acc: accList)
    {
        if(acc.Industry != null && acc.contacts.size() > 0 )
        {
            for(contact con : acc.contacts)
            {
                con.Industry__c = acc.Industry;
                conList.add(con);
            }
        }
    }
    
    update conList;
    
}
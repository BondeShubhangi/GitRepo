trigger avoidcreationOnConsultant on Consultant__c (before insert)
{
    List<String> newmail=new List<String>();
     for(Consultant__c c1:trigger.new)
    {
       newmail.add(c1.Email__c);
    }
    List<Contact> cmail=[select id,Email from Contact where LeadSource='Partner'];
    List<string> oldmail=new List<string>();
    for(Contact c:cmail)
    {
         oldmail.add(c.Email);
    }
    for(Consultant__c c1:trigger.new)
    {
        if(oldmail.contains(c1.Email__c))
        {
            c1.addError('You cannot create a Consultant record of a Partner. Please contact your system administrator');
        }
    }
   
}
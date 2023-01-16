trigger UpdateOwwerofWebCases on Case (before insert) {
    User u=[SELECT Id, Name FROM User where name='Premium User'];
    for(Case c : Trigger.new)
    {
        if(c.Origin == 'Web')
        {
            //User u=[SELECT Id, Name FROM User where name='Premium User'];
            c.ownerID=u.id;
        }
    }

}
trigger CreateChildContact on Account (after insert) 
{
    //for every record of account which is going into the database,execute the following logic
    List<Contact> conList=new List<Contact>();
      for(Account acc : trigger.new)
      {
          if(acc.Rating == 'Warm')
          {
              //
              Contact c=new Contact();
              c.lastName = acc.name;
              c.AccountId=acc.id;//id value will be null BEFORE INSERT EVENT,so use AFTER INSERT
              conList.add(c);
              //insert c;//Insert is a DML Event
              
          }
      }
    insert(conList);
}
//Governer Limit:you cannot fire more than 150 DML events ina single transaction using an apex code.
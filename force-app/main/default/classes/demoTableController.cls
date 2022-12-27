public with sharing class demoTableController {
    public List<Account> accList{get;set;}
    public demoTableController()
    {
        accList=[select id ,name,phone,rating from Account];
    }
}
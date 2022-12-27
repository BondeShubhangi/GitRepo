public with sharing class DisplayController {
    public List<Opportunity> OppList{get;set;}
    public DisplayController()
    
    {
            OppList=[SELECT Id, Name, ExpectedRevenue, LeadSource, CloseDate FROM Opportunity  ORDER BY ExpectedRevenue ASC];
    }
}
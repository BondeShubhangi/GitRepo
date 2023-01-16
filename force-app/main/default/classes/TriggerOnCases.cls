public class TriggerOnCases {
    public Static void changeType(List<case> cs)
    {
        List<case> clist=new List<case>();
        for(case cs1:cs)
        {
            //Case cs=new Case();
            if(cs1.Status=='new')
            {
                case caseAdd=new case();
                caseAdd.Type='Mechanical';
                 clist.add(caseAdd);
            }
           
        }
        insert clist;
        
    }
    
}
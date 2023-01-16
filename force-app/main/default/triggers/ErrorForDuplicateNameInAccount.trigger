trigger ErrorForDuplicateNameInAccount on Account (After insert) {
    set<String> acName=new Set<String>();
    for(Account acc:trigger.new)
    {
        acName.add(acc.Name);
    }
    List<Account> duplicateAccount=new List<Account>();
    duplicateAccount=[SELECT Id, Name FROM Account Where Name IN :acName];
    if(duplicateAccount.size()>0)
    {
        for(Account a : trigger.new )
        {
            a.addError('you cannot insert account with this Account Name');
        }
       /*for(Account temp :isAccount)
        {
            Account objAccount = Trigger.newMap.get(temp.id);
            objAccount.addError('Error Found- Duplicate Account');      
        }*/
        //.addError('you cannot insert account with this Account Name');
        
        
    }

}
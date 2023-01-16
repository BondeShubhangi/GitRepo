/*REQUIREMENT:
 * When Account record is create and update ,if rating='Warm'then Update Industry='Education'
*/

trigger UpdateIndustryonInsertAccount on Account (before insert,before update) {
	for(Account acc :trigger.new)
    {
        if(acc.Rating=='Warm')
        {
            acc.Industry='Education';
        }
    }
}
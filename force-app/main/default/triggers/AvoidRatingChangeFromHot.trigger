trigger AvoidRatingChangeFromHot on Account (before update) {
    for(integer i=0;i<trigger.new.size();i++)
    {
        if(trigger.old[i].Rating=='Hot' && trigger.new[i].Rating !='Hot')
        {
            trigger.new[i].addError('You Cannot change the Rating From Hot.plz Contact to your System Admin');
        }
    }
}
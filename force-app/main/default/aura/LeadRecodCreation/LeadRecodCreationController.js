({
	onSuccess : function(component, event, helper) {
		var params=event.getParams(); //will get the event parameters
        var recordId=params.response.id ;//get the record id of craeted record
        alert('Record Id : '+ recordId);
	}
})
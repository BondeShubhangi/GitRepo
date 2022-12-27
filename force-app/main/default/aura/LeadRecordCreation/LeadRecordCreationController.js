({
	onSuccess : function(component, event, helper) {
		var params = event.getParams();
        var recordId = params.response.id;
        alert('Record Id : '+recordId);
	}
})
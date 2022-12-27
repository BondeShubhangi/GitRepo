({
	superCompCall : function(component, event, helper) {
		var message=event.getParam("message");
        component.set("v.eventmsg",message	+' to PLS');
	}
})
({
	EventTwo : function(component, event, helper) {
		var message=event.getParams("message");
	component.set("v.MessageEvent" ,message +' PLS team');
    
    }
})
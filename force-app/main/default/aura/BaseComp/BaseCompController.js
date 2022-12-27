({
	childEvent : function(component, event, helper) {
        var cmpEvent = component.getEvent("samplecmpEvent");
        cmpEvent.setParam({"message":"Hello Guys,Its Shubhangi!!Welcome"});
		cmpEvent.fire();
	}
})
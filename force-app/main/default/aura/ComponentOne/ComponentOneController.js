({
    EventOne : function(component, event, helper) {
        var appEvent = $A.get("e.c:SampleApplicationEvent");
        appEvent.setParams({"message" : "Hi EveryOne!!Welcome"});
        appEvent.fire();  
    }
})
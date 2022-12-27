({
    clickMe : function(component, event, helper) {
        var cname=component.find("cname").get("v.value"); 
        var ccity=component.find("ccity").get("v.value"); 
        var phone=component.find("phone").get("v.value"); 
        alert(cname+ccity+phone);
        var action = component.get("c.CreateAcc");
        action.setParams({ cname : cname , ccity:ccity,phone:phone })
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                alert("Apex call successful");
                alert("From server: " + response.getReturnValue());
                
            }
            else if (state === "INCOMPLETE") {
                alert("Apex call Unsuccessfil");
            }
                else if (state === "ERROR") {
                    
                }
        });
        $A.enqueueAction(action);
    }
})
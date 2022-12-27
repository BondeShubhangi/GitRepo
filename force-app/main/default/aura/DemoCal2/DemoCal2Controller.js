({
    Add : function(component, event, helper) {
        var n1=component.get('v.num1');
        var n2=component.get('v.num2');
        //alert(n1+n2);//alert(parseInt(n1)+parseInt(n2));
        component.set('v.output',parseInt(n1)+parseInt(n2));
    },
    Sub : function(component, event, helper) {
        var n1=component.get('v.num1');
        var n2=component.get('v.num2');
        // alert(parseInt(n1)-parseInt(n2));
        component.set('v.output',parseInt(n1)-parseInt(n2));
    },
    Mult : function(component, event, helper) {
        var n1=component.get('v.num1');
        var n2=component.get('v.num2');
        // alert(n1*n2);//alert(parseInt(n1)*parseInt(n2));
        component.set('v.output',parseInt(n1)*parseInt(n2));
    },
    Div : function(component, event, helper) {
        var n1=parseInt(component.get('v.num1'));
        var n2=parseInt(component.get('v.num2'));
        //alert(n1/n2);//alert(parseInt(n1)/parseInt(n2));
        component.set('v.output',n1/n2);
    }
})
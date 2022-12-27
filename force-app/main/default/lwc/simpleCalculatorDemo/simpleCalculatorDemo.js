import { LightningElement,track } from 'lwc';

export default class SimpleCalculatorDemo extends LightningElement {
    @track no1;
    @track no2;
    @track result;
    handlechange1(event)
    {
        //alert("first number handle");
        this.no1=event.target.value;
    }
    handlechange2(event)
    {
        //alert("Second number handle");
        this.no2=event.target.value;
    }
    doAdd()
    {
       // alert("Add handle called");
        this.result=parseInt(this.no1)+parseInt(this.no2);
    }
    doSub()
    {
       // alert("Add handle called");
        this.result=parseInt(this.no1)-parseInt(this.no2);
    }
    doDiv()
    {
       // alert("Add handle called");
        this.result=parseInt(this.no1)/parseInt(this.no2);
    }
    doMult()
    {
       // alert("Add handle called");
        this.result=parseInt(this.no1)*parseInt(this.no2);
    }
}
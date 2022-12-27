import CallDurationInSeconds from '@salesforce/schema/Task.CallDurationInSeconds';
import { LightningElement } from 'lwc';

export default class Demo2 extends LightningElement {
    showText=false;
        display={
        text : 'lightning web Component Demo2',
        action : 'clickAction'

    };
    click()
    {
        showText=true;
         console.log('function called');

    }
}
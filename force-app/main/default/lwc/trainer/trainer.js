import { api, LightningElement, track } from 'lwc';

export default class Trainer extends LightningElement {
    @api location;

    @track
    person={
        fname : 'Shubhangi',
        designation : 'Student'
    };
    UpdateDeatils()
    {
        /*this.person={
            fname : 'Ameya',
            designation : 'Employee'
        };*/
        console.log('Function Called') 
        this.person.designation = 'Manager';
        
     
    }


}
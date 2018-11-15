import { Component } from '@angular/core';
import { IonicPage, NavController } from 'ionic-angular';

@IonicPage()
@Component({
  selector: 'page-home',
  template: `
  <ion-stepper #stepper (selectIndexChange)="selectChange($event)">
     <ion-step label="Step1"
               description="Step1 description">
       <h2>Step1 Content</h2>
       <p>Step1 Content</p>
       <button ion-button small ionicStepperNext>Next</button>
     </ion-step>
     <ion-step label="Step2 - Step2 - Step2"
               description="Step1 description">
       <h2>Step2 Content</h2>
       <p>Step2 Content</p>
       <button ion-button color="light" small ionicStepperPrevious>Previous</button>
     </ion-step>
   </ion-stepper>
 `
})
export class ContentPage {

  constructor(public navCtrl: NavController) { }
  selectChange(e) {
    console.log(e);
  }
}

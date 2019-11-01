import { Component } from '@angular/core';

/**
 * Generated class for the HomeEntrepreneurComponent component.
 *
 * See https://angular.io/api/core/Component for more info on Angular
 * Components.
 */
@Component({
  selector: 'home-entrepreneur',
  templateUrl: 'home-entrepreneur.html'
})
export class HomeEntrepreneurComponent {

  text: string = '0';
  courses:number = 2

  constructor() {
    console.log('Hello HomeEntrepreneurComponent Component');
    this.text = 'Hello World';
  }

}

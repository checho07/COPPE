import { Component } from '@angular/core';

/**
 * Generated class for the HomeAdviserComponent component.
 *
 * See https://angular.io/api/core/Component for more info on Angular
 * Components.
 */
@Component({
  selector: 'home-adviser',
  templateUrl: 'home-adviser.html'
})
export class HomeAdviserComponent {

  text: string;

  constructor() {
    console.log('Hello HomeAdviserComponent Component');
    this.text = 'Hello World';
  }

}

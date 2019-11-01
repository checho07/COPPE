import { Component } from '@angular/core';

/**
 * Generated class for the CoursesComponent component.
 *
 * See https://angular.io/api/core/Component for more info on Angular
 * Components.
 */
@Component({
  selector: 'courses',
  templateUrl: 'courses.html'
})
export class CoursesComponent {

  text: string;

  constructor() {
    console.log('Hello CoursesComponent Component');
    this.text = 'Hello World';
  }

}

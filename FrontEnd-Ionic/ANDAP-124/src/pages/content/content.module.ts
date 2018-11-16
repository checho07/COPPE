
import { NgModule } from '@angular/core';
import { TranslateModule } from '@ngx-translate/core';
import { IonicPageModule } from 'ionic-angular';
import { IonicStepperModule } from 'ionic-stepper';



import { ContentPage } from './content';

@NgModule({
  declarations: [
    ContentPage,
  ],
  imports: [
    IonicStepperModule,
    IonicPageModule.forChild(ContentPage),
    TranslateModule.forChild()
  ],
  exports: [
    ContentPage
  ]
})
export class ContentPageModule { }

import { UserProvider } from './../../providers/user/user';

import { NgModule } from '@angular/core';
import { TranslateModule } from '@ngx-translate/core';
import { IonicPageModule } from 'ionic-angular';
import { IonicStepperModule } from 'ionic-stepper';
import { LottieAnimationViewModule } from 'ng-lottie';
import { ContentPage } from './content';

@NgModule({
  declarations: [
    ContentPage,
  ],
  imports: [
    IonicStepperModule,
    IonicPageModule.forChild(ContentPage),
    TranslateModule.forChild(),
    LottieAnimationViewModule.forRoot()
  ],
  exports: [
    ContentPage
  ],
  providers:[
    UserProvider
  ]
})
export class ContentPageModule { }

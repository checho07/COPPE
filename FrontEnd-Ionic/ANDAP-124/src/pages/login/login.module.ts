import { UserProvider } from './../../providers/user/user';
import { FingerprintAIO } from '@ionic-native/fingerprint-aio';
import { Keyboard } from '@ionic-native/keyboard';
import { NgModule } from '@angular/core';
import { TranslateModule } from '@ngx-translate/core';
import { IonicPageModule } from 'ionic-angular';

import { LoginPage } from './login';

@NgModule({
  declarations: [
    LoginPage,
  ],
  imports: [
    IonicPageModule.forChild(LoginPage),
    TranslateModule.forChild()
  ],
  exports: [
    LoginPage
  ],
  providers:[
    Keyboard,
    FingerprintAIO,
    UserProvider
  ]
})
export class LoginPageModule { }

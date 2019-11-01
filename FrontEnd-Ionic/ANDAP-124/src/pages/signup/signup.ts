import { MainPage } from './../index';
import { Component } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { IonicPage, NavController, ToastController, NavParams } from 'ionic-angular';



@IonicPage()
@Component({
  selector: 'page-signup',
  templateUrl: 'signup.html'
})
export class SignupPage {

  userType:string;
  who:number;
  // The account fields for the login form.
  // If you're using the username field with or without email, make
  // sure to add it to the type
  account: { name: string, email: string, password: string } = {
    name: 'Test Human',
    email: 'test@example.com',
    password: 'test'
  };

  // Our translated text strings
  private signupErrorString: string;

  constructor(public navCtrl: NavController,
    public toastCtrl: ToastController,
    public translateService: TranslateService,
    private navParams: NavParams) {

      this.who = navParams.get('who');
    this.translateService.get('SIGNUP_ERROR').subscribe((value) => {
      this.signupErrorString = value;
    })
  }

  ionViewDidLoad(){
    
    switch (this.who) {
      case 1:
      this.translateService.get('ENTREPRENEUR').subscribe((value) => {

       this.userType = value;
     })
        break;
        case 2:
        this.translateService.get('TUTOR').subscribe((value) => {
         this.userType = value;
       })
          break;
          case 3:
          this.translateService.get('ADVISER').subscribe((value) => {
           this.userType = value;
         })
            break;
    
      default:
        break;
    }
   
}



  login(){
    this.navCtrl.push('LoginPage',{who:this.who});
  }
  profiles(){
    this.navCtrl.setRoot('ProfilesPage');
  }
}
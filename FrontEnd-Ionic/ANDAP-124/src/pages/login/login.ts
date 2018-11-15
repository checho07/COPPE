
import { Component } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { IonicPage, NavController, ToastController, NavParams } from 'ionic-angular';
import { Events } from 'ionic-angular';
import { User } from '../../providers';
import { MainPage } from '../';

@IonicPage()
@Component({
  selector: 'page-login',
  templateUrl: 'login.html'
})
export class LoginPage {
  // The account fields for the login form.
  // If you're using the username field with or without email, make
  // sure to add it to the type
  userType:string;
  who:number;
  account: { email: string, password: string } = {
    email: '',
    password: 'test'
  };

  // Our translated text strings
  private loginErrorString: string;

  constructor(public navCtrl: NavController,
    public user: User,
    public toastCtrl: ToastController,
    public translateService: TranslateService,
    public events: Events,
    private navParams: NavParams) {
     
      this.who = navParams.get('who');
    this.translateService.get('LOGIN_ERROR').subscribe((value) => {
      this.loginErrorString = value;
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

  // Attempt to login in through our User service
  doLogin() {
    this.user.login(this.account).subscribe((resp) => {
      this.navCtrl.push(MainPage);
    }, (err) => {
      this.navCtrl.push(MainPage);
      // Unable to log in
      let toast = this.toastCtrl.create({
        message: this.loginErrorString,
        duration: 3000,
        position: 'top'
      });
      toast.present();
    });
  }
  signUp(){
    this.navCtrl.push('SignupPage',{who:this.who});
  }
  profiles(){
    this.navCtrl.setRoot('ProfilesPage');
  }
}

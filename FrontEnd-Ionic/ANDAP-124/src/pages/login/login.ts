import { user } from './login';

import { Component } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { IonicPage, NavController, ToastController, NavParams, LoadingController } from 'ionic-angular';
import { Events } from 'ionic-angular';
import { User } from '../../providers';
import { MainPage } from '../';
import { AngularFireAuth } from 'angularfire2/auth';
import {Validators, FormBuilder, FormGroup } from '@angular/forms';
import { NativeStorage } from '@ionic-native/native-storage';

export interface user {
  name?: string,
  email: string;
  password: string;
  role?:number  
}
@IonicPage()
@Component({
  selector: 'page-login',
  templateUrl: 'login.html'
})
export class LoginPage {
  user = {} as user;

  // The account fields for the login form.
  // If you're using the username field with or without email, make
  // sure to add it to the type
  userType:string;
  who:number;
  
  public  loginForm: FormGroup;

  // Our translated text strings
  private loginErrorString: string;

  constructor(public navCtrl: NavController, 
    public toastCtrl: ToastController,
    public translateService: TranslateService,
    public events: Events,
    private afAuth: AngularFireAuth,
    private formBuilder:FormBuilder,    
    private loadingCtrl: LoadingController,
    private navParams: NavParams,
    private nativeStorage: NativeStorage) {
     
      this.who = navParams.get('who');
    this.translateService.get('LOGIN_ERROR').subscribe((value) => {
      this.loginErrorString = value;
    });

    let emailPattern = "^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$";


    this.loginForm = this.formBuilder.group({
      email:["",[Validators.required, Validators.pattern(emailPattern)]],
      password:["",Validators.required],
    });
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
    let loading = this.loadingCtrl.create({
      content: 'Espera...'
    });



    this.user = this.loginForm.value;

		if (!this.user.email) {
			return;
		}

		let credentials = {
			email: this.user.email,
			password: this.user.password
    };
    try {
       loading.present(); 

       this.afAuth.auth.signInWithEmailAndPassword(credentials.email,credentials.password).then((data)=>{

        console.log(data)
        this.nativeStorage.setItem('Fuid',data.user.uid).then(()=>{
          
          this.navCtrl.setRoot('ListMasterPage',{who:this.who});

          loading.dismiss();
  
          console.log(data);
        }, err => alert(JSON.stringify(err)))

        
       },
      err=>{
        loading.dismiss();
        console.log(typeof(err));

        switch (err.code){
          case "auth/wrong-password":
          this.presentToast("Contraseña Incorrecta");
          break;
          
          case "auth/user-not-found":
          this.presentToast("Usuario no encontrado");
          break;

          case "auth/user-disabled":
          this.presentToast("Usuario se encuentra inactivo");
          break;

        };
      });

    } catch (error) {
      loading.dismiss();
      console.log(error);
    }
    // this.user.login(this.account).subscribe((resp) => {
    //   this.navCtrl.push(MainPage);
    // }, (err) => {
    //   this.navCtrl.push(MainPage);
    //   // Unable to log in
    //   let toast = this.toastCtrl.create({
    //     message: this.loginErrorString,
    //     duration: 3000,
    //     position: 'top'
    //   });
    //   toast.present();
    // });
  }
  signUp(){
    this.navCtrl.push('SignupPage',{who:this.who});
  }
  profiles(){
    this.navCtrl.setRoot('ProfilesPage');
  }
  presentToast(msj : string){
    let toast = this.toastCtrl.create({
      message: msj,
      duration: 3000,
      position: 'bottom'
    });
    toast.present(); 
  }
}

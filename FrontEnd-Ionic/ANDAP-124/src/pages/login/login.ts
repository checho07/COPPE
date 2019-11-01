import { UserProvider } from './../../providers/user/user';
import { FingerprintAIO } from '@ionic-native/fingerprint-aio';
import { Keyboard } from '@ionic-native/keyboard';
import { user } from './login';
import { Component } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { IonicPage, NavController, ToastController, NavParams, LoadingController, AlertController } from 'ionic-angular';
import { Events } from 'ionic-angular';
import { MainPage } from '../';
import {Validators, FormBuilder, FormGroup } from '@angular/forms';
import { NativeStorage } from '@ionic-native/native-storage';
import { AlertInputOptions } from 'ionic-angular/umd/components/alert/alert-options';

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
  avatarimage:any;
  signform:any;
  flashCardFlipped: boolean = false;
  loginForm:FormGroup;
  singUpForm:FormGroup;
  passwordType: string = 'password';
  passwordIcon: string = 'eye-off';

  // Our translated text strings
  private loginErrorString: string;

  constructor(public navCtrl: NavController, 
    public toastCtrl: ToastController,
    public translateService: TranslateService,
    public events: Events,  
    private formBuilder:FormBuilder,    
    private loadingCtrl: LoadingController,
    private navParams: NavParams,
    private keyboard: Keyboard,
    private faio:FingerprintAIO,
    private alertCtrl: AlertController,
    private userProvider:UserProvider,
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
    this.singUpForm = this.formBuilder.group({
      email:["",[Validators.required, Validators.pattern(emailPattern)]],
      password: ['', Validators.required],
      password2: ['', Validators.required]
    },{validator:this.checkPasswords});
  };

  checkPasswords(group: FormGroup) { 
    let pass = group.controls.password.value;
    let confirmPass = group.controls.password2.value;
  
      return pass === confirmPass ? true : { notSame: true }     
    }

  changeAvatar()
  {
    if(this.signform == 'login')
    {
      this.avatarimage = 'assets/img/LOGO1.png';
    }

    if(this.signform == 'signup')
    {
      this.avatarimage = 'assets/img/coppeText.png';
    }
  };

  hideShowPassword() {
    this.passwordType = this.passwordType === 'text' ? 'password' : 'text';
    this.passwordIcon = this.passwordIcon === 'eye-off' ? 'eye' : 'eye-off';
  };

  
  ionViewDidLoad(){

    
    // this.checkTouchID();

    this.keyboard.setResizeMode('native');
    console.log('ionViewDidLoad Login2Page');
    this.avatarimage = 'assets/img/LOGO1.png';
    this.signform = "login"
   // this.flashCardFlipped = false;
 //   this.changeAvatar();
    
      switch (this.who) {
        case 0:
        this.translateService.get('ENTREPRENEUR').subscribe((value) => {

         this.userType = value;
       })
          break;
          case 1:
          this.translateService.get('TUTOR').subscribe((value) => {
           this.userType = value;
         })
            break;
            case 2:
            this.translateService.get('ADVISER').subscribe((value) => {
             this.userType = value;
           })
              break;
      
        default:
          break;
      }
     
  };
  // Attempt to login in through our User service
  doLogin() {  
    if(!this.loginForm.valid){

      this.checkTouchID();

    }else{

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
         
         this.userProvider.login(credentials).then( result =>{
           loading.dismiss();          
            sessionStorage.setItem('who',this.who.toString())
            this.navCtrl.setRoot('HomePage',{who:this.who})             
           
         }).catch(err=>{
           loading.dismiss();
           this.presentToast(err)
         })
        } catch (error) {
          this.presentToast(error)
        loading.dismiss();
      }      
    }
    };  
  
   
  signUp(){
    let loading = this.loadingCtrl.create({ 
      content: 'Espera...'
    });
    loading.present();
    this.userProvider.signup(this.singUpForm.value).then(succes =>{
      sessionStorage.setItem('Fuid',succes.user.uid);
      loading.dismiss();
      this.presentToast('¡Bienvenido!');      
      this.singUpForm.reset();
      sessionStorage.setItem('who',this.who.toString())
      this.navCtrl.setRoot('ContentPage',{who:this.who})
    }).catch(err=>{
      loading.dismiss();
      this.presentToast(err);
    })
  }
  profiles(){
    this.navCtrl.setRoot('ProfilesPage',this.who);
  }
  presentToast(msj : string){
    let toast = this.toastCtrl.create({
      message: msj,
      duration: 3000,
      position: 'bottom'
    });
    toast.present(); 
  };

  checkTouchID(){

    this.faio.isAvailable().then(result=>{       
      
      this.faio.show({
        clientId: 'Fingerprint-Demo',
        clientSecret: 'password', //Only necessary for Android
        disableBackup:true,  //Only for Android(optional)
        localizedFallbackTitle: 'Use Pin', //Only for iOS
        localizedReason: 'Please authenticate' //Only for iOS
      })
      .then((result: any) => alert(JSON.stringify(result)))
      .catch((error: any) => console.log(error));
      }).catch()
  };
  recoverPass(){
    let alertInputOptions:AlertInputOptions = {
      type:"email",
      name:'recoverEmail',
      placeholder:'correo@dominio.com',
      checked:true
    };

    this.alertCtrl.create({
      title:"Recupera tu contraseña",
      message:"Ingresa tu correo para recuperar la contraseña",
      inputs:[alertInputOptions],
      buttons:[
        {
          text:'Cancelar',
          role:'cancel'
        },
        {
          text:'Enviar',
          handler: email =>{
           this.userProvider.forgotPassword(email.recoverEmail)
          }
        }
      ]
    }).present();
  };
  
}

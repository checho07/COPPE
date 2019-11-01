import { AngularFireAuth } from 'angularfire2/auth';
import 'rxjs/add/operator/toPromise';
import { Injectable } from '@angular/core';
import { Api } from '../api/api';
import { NativeStorage } from '@ionic-native/native-storage';
import * as firebase from "firebase";
import { AlertController } from 'ionic-angular';
import { AngularFirestore } from 'angularfire2/firestore';

/**
 * Most apps have the concept of a User. This is a simple provider
 * with stubs for login/signup/etc.
 *
 * This User provider makes calls to our API at the `login` and `signup` endpoints.
 *
 * By default, it expects `login` and `signup` to return a JSON object of the shape:
 *
 * ```json
 * {
 *   status: 'success',
 *   user: {
 *     // User fields your app needs, like "id", "name", "email", etc.
 *   }
 * }Ø
 * ```
 *
 * If the `status` field is not `success`, then an error is detected and returned.
 */
@Injectable()
export class UserProvider {
  _user: any;

  constructor(public api: Api, 
              private afAuth: AngularFireAuth, 
              private alertCtrl:AlertController,
              private db:AngularFirestore,
              private nativeStorage: NativeStorage) { }


  login(credentials: any) {

    return new Promise((resolve,reject)=>{

      this.afAuth.auth.signInWithEmailAndPassword(credentials.email,credentials.password).then((data)=>{  
         
        sessionStorage.setItem('Fuid',data.user.uid);
        
        resolve(data);
       },
      err=>{
        switch (err.code){
          case "auth/wrong-password":
           reject( "Contraseña Incorrecta");
          break;
          
          case "auth/user-not-found":
              reject( "Usuario no encontrado");
          break;
  
          case "auth/user-disabled":
              reject( "Usuario se encuentra inactivo");
          break;
        };
      });
    })

   
  }

  /**
   * Send a POST request to our signup endpoint with the data
   * the user entered on the form.
   */
  signup(accountInfo: any) {
    
    return this.afAuth.auth.createUserWithEmailAndPassword(accountInfo.email,accountInfo.password)    
  };

  /**
   * Send a EMAIL with instructions to recover the password
   * @param email 
   */
  forgotPassword(email) {
    return firebase
      .app()
      .auth()
      .sendPasswordResetEmail(email)
      .then(s => {
        let alert = this.alertCtrl.create({
          title: "Contraseña restablecida",
          subTitle: "Revisa el correo para cambiar tu contraseña.",
          buttons: ["Entendido"]
        });
        alert.present();
      })
      .catch(error => {
        let errorTxt = '';
        switch (error.code) {
          case 'auth/invalid-email':
            errorTxt = 'El correo no tiene el formato correcto.'
            break;
          case 'auth/user-not-found':
            errorTxt = 'Este usuario no existe en nuestros registros.'
            break;
          default:
            break;
        }      
        let alert = this.alertCtrl.create({
          title: "Error",
          subTitle: errorTxt,          
          buttons :[
            {
              text: 'Cerrar',
              role: 'cancel',
              cssClass:'btnalert-cancel',
              handler: data => {
                console.log('Cancel clicked');
              }
            },
            {
              text: 'Ok',  
              cssClass: 'btnalert-ok',
              handler: data =>{            
              }
             }
          ]
        });
        alert.present();
      });
  };

  saveProject(projectform,urlDrive){
    let Fuid = sessionStorage.getItem('Fuid');
    let url = urlDrive;
    return this.db.collection('projects').add({Fuid,url,...projectform})

  }

  

  /**
   * Log the user out, which forgets the session
   */
  logout() {
    this._user = null;
  }

  /**
   * Process a login/signup response to store user data
   */
  _loggedIn(resp) {
    this._user = resp.user;
  }
}

import { HttpClient } from '@angular/common/http';

import { Component } from '@angular/core';
import { IonicPage, NavController } from 'ionic-angular';
import { Events } from 'ionic-angular';


/**
 * The Welcome Page is a splash page that quickly describes the app,
 * and then directs the user to create an account or log in.
 * If you'd like to immediately put the user onto a login/signup page,
 * we recommend not using the Welcome page.
*/
@IonicPage()
@Component({
  selector: 'page-profiles',
  templateUrl: 'profiles.html'
})
export class ProfilesPage {

  slidesInfo = [];
  slideBgClass= 'slide1BG';

  constructor(public navCtrl: NavController, public events: Events, private http:HttpClient) {  


   };

   ionViewDidLoad(){
    this.http.get('assets/helper.json').subscribe(res => {
      this.slidesInfo = res['slides'];
      console.log(this.slidesInfo)
      },
      (err) => {
        alert('failed loading json data');
      });
   };  

 
  welcome(who:number){
    this.events.publish('profile:selected', who);
    this.navCtrl.push('LoginPage',{who:who});
   
  };

  onSlideChangeStart(ev){
    console.log(ev)
    switch (ev.realIndex) {
      case 0:
        this.slideBgClass = 'slide1BG'
     break;
      case 1:
           this.slideBgClass = 'slide2BG'
        break;
      case 2:
          this.slideBgClass = 'slide3BG'
       break;
    
      default:
        break;
    }
   }
}

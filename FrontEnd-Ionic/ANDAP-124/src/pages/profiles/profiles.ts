
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

  constructor(public navCtrl: NavController, public events: Events) { }

 
  welcome(who:number){
    this.events.publish('profile:selected', who);
    this.navCtrl.push('WelcomePage',{who:who});
   
  }
}

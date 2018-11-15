import { Component } from '@angular/core';
import { IonicPage, NavController } from 'ionic-angular';
import {Validators, FormBuilder, FormGroup } from '@angular/forms';

@IonicPage()
  @Component({
    selector: 'page-content',
    templateUrl: 'content.html'
  })
export class ContentPage {

   public  projectForm: FormGroup;

  dataItems:object[];
  constructor(public navCtrl: NavController,
              private formBuilder:FormBuilder,) {

                this.projectForm = this.formBuilder.group({
                  name:["",[Validators.required]],
                  progress:["",Validators.required],
                  participants:["",Validators.required],
                  creationDate:["",Validators.required],
                  area:["",Validators.required]
                });

    this.dataItems=[
      {title:'PROJECT_NAME',ngmodel:'name',name:'email', type:'text'},
      {title:'#_TEAM',ngmodel:'participants',name:'participants', type:'number'},
      {title:'CREATE_DATE',ngmodel:'creationDate',name:'creationDate', type:'date'},
      {title:'AREA',ngmodel:'area',name:'area', type:'text'}
    ];

   }
  selectChange(e) {
    console.log(e);
  }
}

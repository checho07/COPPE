import { Component } from '@angular/core';
import { IonicPage, NavController } from 'ionic-angular';
import {Validators, FormBuilder, FormGroup } from '@angular/forms';
import { FileChooser } from '@ionic-native/file-chooser';

@IonicPage()
  @Component({
    selector: 'page-content',
    templateUrl: 'content.html'
  })
export class ContentPage {

   public  projectForm: FormGroup;

  dataItems:object[];
  files:object[];

  constructor(public navCtrl: NavController,
              private formBuilder:FormBuilder,
              private fileChooser: FileChooser) {

                this.projectForm = this.formBuilder.group({
                  name:["",[Validators.required]],
                  progress:["",Validators.required],
                  participants:["",Validators.required],
                  creationDate:["",Validators.required],
                  area:["",Validators.required]
                });

    this.dataItems=[
      {title:'PROJECT_NAME',ngmodel:'name',name:'email', type:'text',icon:"bulb"},
      {title:'#_TEAM',ngmodel:'participants',name:'participants', type:'number',icon:"people"},
      {title:'CREATE_DATE',ngmodel:'creationDate',name:'creationDate', type:'date',icon:"calendar"},
      {title:'AREA',ngmodel:'area',name:'area', type:'text',icon:"list-box"}
    ];

    this.files=[
      {image:'assets/img/thb1.jpg',title:'Descripcion ',description:"descripcion detallada. "},
      {image:'assets/img/thb2.jpg',title:'Casos de uso ',description:"interaccion. "},
      {image:'assets/img/thb3.jpg',title:'Diagramas ',description:"flujo,UML. "},
      {image:'assets/img/thb4.jpg',title:'Otro ',description:"otro doc de soporte"}
    ]
   };
  selectChange(e) {
    console.log(e);
  }
  openFile(){
    this.fileChooser.open()
    .then(uri =>{
      alert(uri); console.log(uri)
    } )
    .catch(e => {
      console.log(e)
      alert(e)
    });
  }
}

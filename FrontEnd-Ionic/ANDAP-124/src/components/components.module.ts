import { IonicModule } from 'ionic-angular';
import { NgModule } from '@angular/core';
import { HomeTutorComponent } from './home-tutor/home-tutor';
import { HomeAdviserComponent } from './home-adviser/home-adviser';
import { HomeEntrepreneurComponent } from './home-entrepreneur/home-entrepreneur';
import { NewsComponent } from './news/news';
import { CoursesComponent } from './courses/courses';
import { SettingsComponent } from './settings/settings';
import { NgCircleProgressModule, CircleProgressOptions } from 'ng-circle-progress';
@NgModule({
	declarations: [HomeTutorComponent,
    HomeAdviserComponent,
    HomeEntrepreneurComponent,
    NewsComponent,
    CoursesComponent,
    SettingsComponent],
	imports: [IonicModule,NgCircleProgressModule,],
	exports: [HomeTutorComponent,
    HomeAdviserComponent,
    HomeEntrepreneurComponent,
    NewsComponent,
    CoursesComponent,
    SettingsComponent],
    providers:[CircleProgressOptions]
})
export class ComponentsModule {}

import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'hsp-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }

  onClick() {
    console.log('Click on button');
  }

}

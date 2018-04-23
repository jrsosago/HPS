import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { HspService } from '../../services/hsp.service';

@Component({
  selector: 'hsp-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  user;
  pass;

  constructor(
    private http: Http,
    private hspService: HspService
  ) { }

  ngOnInit() {
  }

  tryLogin() {
    this.hspService.getAccount(this.user, this.pass).subscribe(response => {
      const account = response;
      console.log(account);
    });
  }
}

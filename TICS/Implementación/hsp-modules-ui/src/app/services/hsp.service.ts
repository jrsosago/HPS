import { Injectable } from '@angular/core';
import { Http, RequestOptions, RequestOptionsArgs } from '@angular/http';
import { Subject } from 'rxjs/Rx';

@Injectable()
export class HspService {

  private hspUrl = 'http://localhost:8080/manager';

  constructor(
    private http: Http
  ) { }

  public getAccount (user: string, pass: string) {
    const observable = new Subject<any>();
    this.http.get(`${this.hspUrl}/get?user=` + user + '&pass=' + pass).subscribe(
      (response: any) => {
        const data = response.json();
        observable.next(data);
      }
    );
    return observable;
  }

}

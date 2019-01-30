import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class ItemService {
  private baseUrl = "http://localhost:3000/api/items/"
  constructor(private http:HttpClient) { }

  getItem(id:number): Observable<any>{
    return this.http.get(this.baseUrl+id);
  }
  
}

import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RepService {

  private baseUrl = "http://localhost:3000/api/reps/"
  constructor(private http:HttpClient) { }

  getOneRep(id:number) : Observable<any>{
    return this.http.get(this.baseUrl+id); 
  }
}

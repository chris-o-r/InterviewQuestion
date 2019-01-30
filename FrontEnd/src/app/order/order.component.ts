import { Component, OnInit } from '@angular/core';
import { OrderService } from '../order.service';
import { ItemService } from '../item.service'; 
import { RepService } from '../rep.service'; 

@Component({
  selector: 'app-order',
  templateUrl: './order.component.html',
  styleUrls: ['./order.component.scss']
})
export class OrderComponent implements OnInit {
  orders; 
  
  constructor(private OrderService : OrderService,
    private ItemService : ItemService, 
    private RepService : RepService) { }

  ngOnInit() {
    this.getOrders();
  }

  getOrders(){
    this.OrderService.getAllOrders().subscribe(data => {
      let length = data.length; 
      if (length > 0 ){
        this.orders = []
        for (let i=0; i<length; i++){
          let element = data[i]; 
          this.getItemDetails(element)
          this.getRepDetails(element)
          this.orders.push(element)
        }        
      }
    }); 
  }


  getItemDetails(order : any){
    let itemId = order.item_id
    this.ItemService.getItem(itemId).subscribe(data => {
      this.orders.forEach(element => {
        if (element.item_id == order.item_id){
          element.total_price = data.item_cost * element.num_items
          element.item_name = data.item_name
        }
      }); 
    }); 
  }

  getRepDetails(order : any){
    //Making the request for the data 
    this.RepService.getOneRep(order.rep_id).subscribe(data => {
      //Finding the relevant element in order data structure
      this.orders.forEach(element => {
        if (element.rep_id == order.rep_id){
          element.rep_name = data.rep_name; 
        }
      });
    }); 
 

  }
}

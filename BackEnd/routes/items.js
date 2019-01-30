const express = require('express');
const router = express();
const mysql = require('mysql');
const connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  database : 'order_db'
});

connection.connect();

//Get all items 
router.get("/", (req, res) => {
    connection.query("SELECT * FROM items;", (err, rows, fields) => {
        if (err){
            return res.status(500).send("Internal Server Error");
        }
        else{
            res.send(rows)
        }
      
      });
}); 
//Get One Item  
router.get("/:id", (req, res) => {
    connection.query("SELECT * FROM items WHERE item_id = '"+req.params.id+"';", (err, rows, fields) =>{
        if (err)
            return res.status(500).send("Internal Server Error")
        if (rows.length == 0)
            return res.status(404).send("No Rows With The Given ID Found")
        res.send(rows[0])
    }); 
});




module.exports = router;
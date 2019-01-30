const express = require('express');
const router = express();
const mysql = require('mysql');
const connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  database : 'order_db'
});

connection.connect()

//Get All Orders 
router.get("/", (req, res) => {   
    connection.query("SELECT * FROM orders;", (err, rows, fields) => {
        if (err){
            return res.status(500).send("Internal Server Error");
        }
        else{
            res.send(rows)
        }
      
      });
});

router.get('/:id', (req, res) => {
    connection.query("SELECT * FROM orders WHERE order_id = '"+req.params.id+"';", (err, rows, fields) =>{
        if (err){
            throw err
        }else{
            if (rows.length == 0)
                return res.status(404).send("No Order With The Given ID Was Found") 
            res.send(rows[0])
        }
    });
  });

//connection.end();

module.exports = router; 
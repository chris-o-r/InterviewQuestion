const express = require('express')
const app = express()
const port = 3000

const orders = require("./routes/orders")
const items = require("./routes/items")
const customers = require("./routes/customers")
const reps = require("./routes/reps"); 

app.use("/api/orders", orders)
app.use("/api/items", items)
app.use("/api/customers", customers)
app.use("/api/reps/", reps)

app.listen(port, () => console.log(`Example app listening on port ${port}!`))
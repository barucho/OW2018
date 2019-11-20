# MySQl Doc Store Demo 
# MySQl Doc Store 


### enable x protocol 5.7 <   

```bash
mysqlsh -u root -h localhost --classic --dba enableXProtocol
```

### in the log

```
2017-10-15T18:52:51.558629Z 0 [Note] Plugin mysqlx reported: 'X Plugin listens on TCP (bind-address:'::', port:33060)'
2017-10-15T18:52:51.558653Z 0 [Note] Plugin mysqlx reported: 'X Plugin listens on UNIX socket (/var/run/mysqld/mysqlx.sock)'
2017-10-15T18:52:51.558680Z 0 [Note] Plugin mysqlx reported: 'Server starts handling incoming connections'
```

## quick tutorial 

```js
session.createSchema('items')
\use items
db.getName()
db.createCollection("items_table")
db.items_table.add({"name":"washing machine","price":10000,"color":"white"}) 
db.items_table.add({"name":"refrigerator","price":30000,"color":"steel grey"}) 
db.items_table.add({"name":"samsung tv","price":40000,"color":"black"}) 
db.items_table.add({"name":"MacBook","price":90000,"color":"ivory"})

db.items.find()
db.items.find("price>25000")
````

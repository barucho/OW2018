# option file 


## show variables 
```sql
show variables;
select * from information_schema.variables_info; 
```

## set variables (not PERSISTED < 8+ ) 

### global 
```sql
set @@global.option=value;
```


```sql
SET @@GLOBAL.max_connections = 1000;
SET GLOBAL max_connections = 1000;
```
### session 

```sql
SET SESSION sql_mode = 'TRADITIONAL';
SET @@SESSION.sql_mode = 'TRADITIONAL';
SET @@sql_mode = 'TRADITIONAL';
```


## PERSISTED from MySQl 8+ 
```sql
SET PERSIST option=value;
SET @@persist.option=value;
```

```sql
SELECT * FROM performance_schema.variables_info ;
```


**Type of variable_source:** 

* COMPILED – Compiled on mysql source (default values)
* GLOBAL – Part of global file
* SERVER – Part of global $MYSQL_HOME/my.cnf file
* EXPLICIT – Part of –defaults-file option file
* EXTRA – Part of defaults-extra-file option file
* USER – Part of ~/.my.cnf
* LOGIN – Part of login path option file
* COMMAND_LINE – Command line options
* PERSISTED – part of persistent mysqld-auto.cnf file
* DYNAMIC – variables set dynamically after server start



```sql
select * from performance_schema.variables_info where variable_source like 'DYNAMIC';
```

## load persisted default on 
```
persisted-globals-load=OFF
```
## list all changed PERSISTED 
```sql
SELECT VI.VARIABLE_NAME, GV.VARIABLE_VALUE,VI.MIN_VALUE,VI.MAX_VALUE 
FROM performance_schema.variables_info AS VI
INNER JOIN performance_schema.global_variables AS GV
USING(VARIABLE_NAME)
WHERE VI.VARIABLE_SOURCE = 'PERSISTED'
ORDER BY VARIABLE_NAME;

```
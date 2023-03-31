CREATE TABLE a1 (
	id INT PRIMARY KEY ,
	`name` VARCHAR(32) NOT NULL DEFAULT '')

SELECT * FROM a2	
-- **1.primary key不能重复而且不能为null。**
INSERT INTO a1 VALUES(2,'jack')
-- 
-- **2.一张表最多只能有一个主键,但可以是复合主键**
CREATE TABLE a2 (
	id INT  ,
	`name` VARCHAR(32) NOT NULL DEFAULT '',
	PRIMARY KEY (id,`name`))
	
SHOW INDEXES FROM a2	
INSERT INTO a2 VALUES(2,'jack')
-- 
-- **3.主键的指定方式 有两种**
-- 
-- **4.直接在字段名后指定: 字段名 primakry key**
-- 
-- **5.在表定义最后写 primary key(列名);**
-- 
-- **6.使用desc 表名，可以看到primary key的情况**
DESC a2


CREATE TABLE a3 (
	id INT UNIQUE,
	`name` VARCHAR(32))

-- unqiue使用细节
-- 1. 如果没有指定 not null , 则 unique 字段可以有多个null
INSERT INTO a3 VALUES(1,'jack')
INSERT INTO a3 VALUES(2,'jack')
INSERT INTO a3 VALUES(NULL,'jack')
SELECT * FROM a3
-- 如果一个列(字段)， 是 unique not null 使用效果类似 primary key


-- 主表
CREATE TABLE a4 (
	id INT PRIMARY KEY,
	`name` VARCHAR(32) NOT NULL DEFAULT '')

-- 从表	
CREATE TABLE a5 (
	id INT PRIMARY KEY,
	`name` VARCHAR(32) NOT NULL DEFAULT '' ,
	class_id INT ,
	FOREIGN KEY (class_id) REFERENCES a4(id))
	
SELECT * FROM a4
SELECT * FROM a5

INSERT INTO a4
	VALUES(100, 'java'), (200, 'web');
INSERT INTO a5 
	VALUES(1, 'php',100);
	


-- 现有一个商店的数据库shop db，记录客户及其购物情况，由下面三个表组成:
-- 1 建表，在定义中要求声明 [进行合理设计]：
-- (1)每个表的主外键；
-- (2)客户的姓名不能为空值；
-- (3)电邮不能够重复;
-- (4)客户的性别[男|女] check 枚举..
-- (5)单价unitprice 在 1.0 - 9999.99 之间 check

-- 商品goods (商品号goods id，商品名goods name，单价unitprice，商品类别category，供应商provider);
CREATE TABLE goods (
	goods_id INT PRIMARY KEY ,
	goods_name VARCHAR(32) NOT NULL DEFAULT '',
	unitprice DOUBLE CHECK (unitprice >=1.0 AND unitprice <= 9999.99),
	category VARCHAR(32) NOT NULL DEFAULT '',
	provider VARCHAR(32) NOT NULL DEFAULT '' );
	
-- 客户customer (客户号customer id,姓名name,住址address,电邮email性别sex,身份证card ld);	
CREATE TABLE customer (
	customer_id INT PRIMARY KEY ,
	`name` VARCHAR(32) NOT NULL DEFAULT '',
	address VARCHAR(32) NOT NULL DEFAULT '',
	email VARCHAR(32) NOT NULL DEFAULT '',
	sex ENUM ('男','女') NOT NULL ,
	card_id CHAR(18))

-- 购买purchase (购买订单号order id，客户号customer id,商品号goods id,购买数量nums);
CREATE TABLE purchase (
	order_id INT PRIMARY KEY,
	customer_id INT ,
	goods_id INT,
	nums INT ,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (goods_id) REFERENCES goods(goods_id));
	
DESC goods;
DESC customer;
DESC purchase;	
	


-- 1.一般来说自增长是和primary key 配合使用的
-- 
-- 2.自增长也可以单独使用[但是需要配合一个unique
-- 
-- 3.自增长修饰的字段为整数型的(虽然小数也可以但是非常非常少这样使用)
-- 
-- 4.自增长默认从 1开始，你也可以通过如下命令修改altertabie 表名 auto increment = 新的开始值
-- 
-- 5.如果你添加数据时，给自增长字段(列)指定的有值，则以指定的值为准，如果指定了自增长一般来说，就按照自增长的规则来添加数据

CREATE TABLE a6 (
	id INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(32) NOT NULL DEFAULT '')
	
INSERT INTO a6 VALUES(1,'jack')	
SELECT * FROM a6
INSERT INTO a6 (`name`)
	VALUES('jack')	

		
ALTER TABLE a6 AUTO_INCREMENT = 100
INSERT INTO a6 VALUES(NULL,'jack')





CREATE TABLE a7 (
	id INT ,
	`name` VARCHAR(32))
	
SHOW INDEXES FROM a7	

CREATE UNIQUE INDEX index_id ON a7 (id)
ALTER TABLE a7 ADD INDEX index_name  (`name`)
DROP INDEX index_id ON a7

ALTER TABLE a7 ADD PRIMARY KEY (id)

ALTER TABLE a7 DROP PRIMARY KEY



-- 创建一张订单表order (id号，商品名,订购人，数量).要求id号为主键，
-- 请使用2种方式来创建主键.(提示:为练习方便，可以是order1，order2 )

-- 第一种方式
CREATE TABLE order1 (
	id INT PRIMARY KEY,
	shop_name VARCHAR(32) NOT NULL DEFAULT '',
	`name` VARCHAR(32) NOT NULL DEFAULT '',
	nums INT )

-- 第二种方式
CREATE TABLE order2 (
	id INT ,
	shop_name VARCHAR(32) NOT NULL DEFAULT '',
	`name` VARCHAR(32) NOT NULL DEFAULT '',
	nums INT )
ALTER TABLE order2 ADD PRIMARY KEY (id)	
SHOW INDEX FROM order1
SHOW INDEXES FROM order2


-- 创建一张特价菜谱表menu (id号，菜谱名,厨师，点餐人身份证，价格).要求id号为主键，
-- 点餐人身份证是unique 请使用两种方式来创建unique.(提示: 为练习方便，可以是menu1，menu2
-- 第一种方式
CREATE TABLE menu (
	id INT PRIMARY KEY ,
	menu_name VARCHAR(32) NOT NULL DEFAULT '',
	cook VARCHAR(32) NOT NULL DEFAULT '',
	card_id CHAR(18) UNIQUE ,
	price DOUBLE)

-- 第二种方式
CREATE TABLE menu1 (
	id INT  ,
	menu_name VARCHAR(32) NOT NULL DEFAULT '',
	cook VARCHAR(32) NOT NULL DEFAULT '',
	card_id CHAR(18)  ,
	price DOUBLE)
	
ALTER TABLE menu1 ADD PRIMARY KEY (id)	
CREATE UNIQUE INDEX card_name_id ON menu1 (card_id) 

SHOW INDEXES FROM menu1


-- 创建一张运动员表sportman (id号，名字，特长).要求id号为主键名字为普通索引，
--  请使用2种方式来创建索引(提示: 为练习方便，可以是不同表名 sportman1，sportman2
-- 第一种方式
CREATE TABLE sportman (
	id INT PRIMARY KEY,
	`name` VARCHAR(32) NOT NULL DEFAULT '',
	speciality VARCHAR(32) NOT NULL DEFAULT '')

CREATE INDEX name_id ON sportman (`name`)
SHOW INDEXES FROM sportman
DROP INDEX name_id ON sportman
ALTER TABLE sportman ADD  INDEX name_id (`name`)



	

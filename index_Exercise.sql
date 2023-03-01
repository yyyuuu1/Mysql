-- 创建一张订单表order (id号，商品名,订购人，数量).要求id号为主键，
-- 请使用2种方式来创建主键.(提示:为练习方便，可以是order1，order2 )

-- 第一种方式
CREATE TABLE `order` 
	(id INT PRIMARY KEY ,
	shop_name VARCHAR(32) NOT NULL DEFAULT '',
	order_name VARCHAR(32) NOT NULL DEFAULT '',
	shop_nums INT );
	
SHOW INDEXES  FROM `order`

-- 第二种方式
CREATE TABLE order1
	(id INT ,
	shop_name VARCHAR(32) NOT NULL DEFAULT '',
	order_name VARCHAR(32) NOT NULL DEFAULT '',
	shop_nums INT );
	
ALTER TABLE order1 ADD PRIMARY KEY (id)	

SHOW INDEXES FROM order1



-- 创建一张特价菜谱表menu (id号，菜谱名,厨师，点餐人身份证，价格).要求id号为主键，
-- 点餐人身份证是unique 请使用两种方式来创建unique.(提示: 为练习方便，可以是menu1，menu2
-- 第一种方式
CREATE TABLE menu
	(id INT PRIMARY KEY ,
	menu_name VARCHAR(32) NOT NULL DEFAULT '' ,
	cook VARCHAR(32) NOT NULL DEFAULT '' ,
	card_id CHAR(18) UNIQUE ,
	price DOUBLE);
	
SHOW INDEXES FROM menu	

-- 第二种方式
CREATE TABLE menu1
	(id INT PRIMARY KEY ,
	menu_name VARCHAR(32) NOT NULL DEFAULT '' ,
	cook VARCHAR(32) NOT NULL DEFAULT '' ,
	card_id CHAR(18) ,
	price DOUBLE);

ALTER TABLE menu1 ADD  UNIQUE (card_id)

SHOW INDEXES FROM menu	

-- 第三种方式
CREATE TABLE menu2
	(id INT PRIMARY KEY ,
	menu_name VARCHAR(32) NOT NULL DEFAULT '' ,
	cook VARCHAR(32) NOT NULL DEFAULT '' ,
	card_id CHAR(18) ,
	price DOUBLE);

CREATE UNIQUE INDEX card_id_ ON menu2 (card_id)


-- 创建一张运动员表sportman (id号，名字，特长).要求id号为主键名字为普通索引，
--  请使用2种方式来创建索引(提示: 为练习方便，可以是不同表名 sportman1，sportman2
-- 第一种方式
CREATE TABLE sportman
	(id INT PRIMARY KEY ,
	`name` VARCHAR(32) NOT NULL DEFAULT '' ,
	speciality VARCHAR(32) NOT NULL DEFAULT '')
	
CREATE INDEX `name` ON sportman (`name`)
SHOW INDEXES FROM sportman


-- 第二种方式
CREATE TABLE sportman1
	(id INT  ,
	`name` VARCHAR(32) NOT NULL DEFAULT '' ,
	speciality VARCHAR(32) NOT NULL DEFAULT '')
	
ALTER TABLE sportman1 ADD INDEX name_ (`name`)
ALTER TABLE sportman1 ADD PRIMARY KEY (id)
SHOW INDEXES FROM sportman1
	


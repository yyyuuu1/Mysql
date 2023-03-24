-- 现有一个商店的数据库shop db，记录客户及其购物情况，由下面三个表组成:
-- 1 建表，在定义中要求声明 [进行合理设计]：
-- (1)每个表的主外键；
-- (2)客户的姓名不能为空值；
-- (3)电邮不能够重复;
-- (4)客户的性别[男|女] check 枚举..
-- (5)单价unitprice 在 1.0 - 9999.99 之间 check
CREATE DATABASE shop_db;

-- 商品goods (商品号goods id，商品名goods name，单价unitprice，商品类别category，供应商provider);
CREATE TABLE goods(
	goods_id INT PRIMARY KEY ,
	goods_name VARCHAR(64) NOT NULL DEFAULT '' ,
	unitprice DECIMAL(10,2) NOT NULL DEFAULT 0 
		CHECK (unitprice >=1.0 AND unitprice <= 9999.99 ) ,
	category INT NOT NULL DEFAULT 1,
	provider VARCHAR(64) NOT NULL DEFAULT '');

-- 客户customer (客户号customer id,姓名name,住址address,电邮email性别sex,身份证card ld);	
CREATE TABLE customer
		(customer_id INT PRIMARY KEY , -- 程序员自己决定
		`name` VARCHAR(32) NOT NULL DEFAULT '',
		address VARCHAR(32) NOT NULL DEFAULT '' ,
		email VARCHAR(32)UNIQUE NOT NULL,
		sex ENUM('男','女') NOT NULL , -- 这里使用的是枚举类型，是 生效的
		card_id CHAR(18));

-- 购买purchase (购买订单号order id，客户号customer id,商品号goods id,购买数量nums);
CREATE TABLE purchase(
	order_id INT UNSIGNED PRIMARY KEY, -- unsigned 表示无符号数
	customer_id INT NOT NULL DEFAULT 0, -- 外键约束在后
	goods_id INT NOT NULL DEFAULT 0 , -- 外键约束在后
	nums INT NOT NULL DEFAULT 0,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (goods_id) REFERENCES goods(goods_id));
	
DESC goods;
DESC customer;
DESC purchase;
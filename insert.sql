#练习insert 语句
-- 创建一张商品表goods (id  int , goods_name varchar(10), price double );
-- 添加2条记录
CREATE TABLE `goods` (id INT , goods_name VARCHAR(10) , price DOUBLE);
-- 添加数据
INSERT INTO `goods`(id , goods_name , price)
	VALUES(1,'华为手机',1000);
	
INSERT INTO `goods`(id , goods_name , price)
	VALUES(2,'苹果手机',2000);
	
SELECT * FROM goods

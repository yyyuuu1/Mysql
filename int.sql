#演示整型的是一个
#使用tinyint 来演示范围 有符号 -128 ~ 127  如果没有符号 0-255
#说明： 表的字符集，校验规则, 存储引擎，老师使用默认
#1. 如果没有指定 unsinged , 则TINYINT就是有符号
#2. 如果指定 unsinged , 则TINYINT就是无符号 0-255
CREATE TABLE t3(
		id TINYINT);#表示创建了一个表名为t3 字段名叫做id 类型为TINYINT

CREATE TABLE t4 (
	id TINYINT UNSIGNED);
	
INSERT INTO t3 VALUES(127); #这是非常简单的添加语句
SELECT * FROM t3 ; #因为t3这个表使用的类型是tinyint 因此只能添加-128~127之间 的数据

INSERT INTO t4 VALUES(255);
SELECT * FROM t4;#简单的查询语句表示对t4这张表，进行查询
#演示字符串类型使用char varchar
#注释的快捷键 shift+ctrl+c , 注销注释 shift+ctrl+r
-- CHAR(size)
-- 固定长度字符串 最大255 字符 
-- VARCHAR(size)    0~65535字节
-- 可变长度字符串 最大65532字节  【utf8编码最大21844字符 1-3个字节用于记录大小】
-- 如果表的编码是 utf8 varchar(size) size = (65535-3) / 3 = 21844
-- 如果表的编码是 gbk varchar(size) size = (65535-3) / 2 = 32766
CREATE TABLE t09 (
	`name` CHAR(255));#表示创建一个表名为t09的表 字段名是name 类型是char 最大支持255个字符

CREATE TABLE t10 (`name` VARCHAR(32766)) CHARSET gbk;
#VARCHAR是可变的字符串长度最大可以支持65535个字节，但是实际情况下要根据编码来判断 因为varchar会留下
#1到3个字节左右记录大小，并且根据不同的编码实际大小会有不同

DROP TABLE t10;



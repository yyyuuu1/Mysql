#演示数据库的操作
#创建一个名称为hsp_db01的数据库。[图形化和指令 演示]

#使用指令创建数据库
CREATE DATABASE hsp_db01
#删除数据库指令
DROP DATABASE hsp_db01
#创建一个使用utf8字符集的hsp_db02数据库
CREATE DATABASE hsp_db02 CHARACTER SET utf8
#创建一个使用utf8字符集，并带对校验规则的hsp_db03数据库
CREATE DATABASE hsp_db03 CHARACTER SET utf8 COLLATE utf8_bin
#校对规则 utf8_bin 区分大小写 默认utf8_general-ci 不区分大小写

#下面是一条查询的sql,select 查询 * 表示所有字段 FORM 从哪个表查询 WHERE 表示从哪个字段 NAME ='tom'查询的名字是tom
SELECT * FROM t1 WHERE NAME ='tom'
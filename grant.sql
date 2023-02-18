-- 1.创建一个用户(你的名字，拼音)，密码 123，并且只可以从本地登录，不让远程登录mysql
CREATE USER 'jack'@'localhost' IDENTIFIED BY '123'
-- 2.创建库和表 testdb下的 news 表，要求使用root 用户创建
-- 创建数据库
CREATE DATABASE testdb
-- 创建表
CREATE TABLE news (
	id INT,
	`name` VARCHAR(32))

-- 插入一些数据做测试
INSERT INTO news VALUES(1,'tom');

-- 3.给用户分配查看news表和添加数据的权限
#基本语法：grant 权限列表 on 库.对象名 to "用户名’@’登录位置‘ identified by密码’]
#   注意
-- identified by可以省略，也可以写出
-- (1)如果用户存在，就是修改该用户的密码
-- (2)如果该用户不存在，就是创建该用户!

GRANT SELECT,INSERT ON testdb.news TO 'jack'@'localhost'

-- 4.测试看看用户是否只有这几个权限

-- 5.修改密码为 abc，要求: 使用root 用户完成
#基本语法 ： set password for用户名@登录位置=password(密码)
SET PASSWORD FOR 'jack'@'localhost' = PASSWORD('aaa')

-- 6.重新登录
-- 7.使用 root 用户删除你的用户
# 基本语法 ： drop user “用户名’ @’允许登录位置’
DROP USER 'jack'@'localhost'

-- 8.演示 回收权限
# 基本语法 ： revoke 权限列表 on 库对象名 from用户名"@"登录位置;
REVOKE SELECT,INSERT ON testdb.news FROM  'jack'@'localhost'

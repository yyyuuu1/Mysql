-- 说明 用户管理的细节
-- 在创建用户的时候，如果不指定Host, 则为% , %表示表示所有IP都有连接权限 
-- create user  xxx;

CREATE USER jack

SELECT `host`, `user` FROM mysql.user

-- 你也可以这样指定 
-- create user  'xxx'@'192.168.1.%'  表示 xxx用户在 192.168.1.*的ip可以登录mysql

CREATE USER 'smith'@'192.168.1.%'

-- 在删除用户的时候，如果 host 不是 %, 需要明确指定  '用户'@'host值'

DROP USER jack -- 默认就是 DROP USER 'jack'@'%'

#在删除smith时需要写清楚 具体的ip 如果只写一个% 那么系统会认为删除的是'smith'@'%'这个人，但是这个人并不存在
DROP USER 'smith'@'192.168.1.%'


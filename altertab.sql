-- 员工表emp的上增加一个image列，varchar类型(要求在resume后面)
#这句话表示，在emp这个表中增加一列 列名为image 类型是varchar 不允许为空值，默认给一个空串 增加在resume后
ALTER TABLE emp ADD image VARCHAR(32) NOT NULL DEFAULT ' ' AFTER RESUME;
DESC emp
-- 修改iob列，使其长度为60。
ALTER TABLE emp MODIFY job VARCHAR(60) NOT NULL DEFAULT ' ';
-- 删除sex列。
ALTER TABLE emp DROP sex ;
-- 表名改为employee。
RENAME TABLE emp TO employee
DESC employee
-- 修改表的字符集为utf8
ALTER TABLE employee CHARACTER SET utf8
-- 列名name修改为user name
#修改employee这张表的name列名修改成uesr_name 不允许为空 默认值为空
ALTER TABLE employee CHANGE `name` `user_name` VARCHAR(64) NOT NULL DEFAULT ' ';
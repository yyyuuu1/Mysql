#演示字符串类型的使用细节
#char(4) 和 varchar(4) 这个4表示的是字符，而不是字节, 不区分字符是汉字还是字母
CREATE TABLE t11(
	`name` CHAR(4));
INSERT INTO t11 VALUES('明天你好');

SELECT * FROM t11;

CREATE TABLE t12(
	`name` VARCHAR(4));
INSERT INTO t12 VALUES('明天你好');#注意我们在上面指定了只能使用4个字符不是字节，而且不区分字母和汉字多一个字母也不行

INSERT INTO t12 VALUES('ab北京');
SELECT * FROM t12;

#如果varchar 不够用，可以考试使用mediumtext 或者longtext, 
#如果想简单点，可以使用直接使用text
CREATE TABLE t13( content TEXT, content2 MEDIUMTEXT , content3 LONGTEXT);
INSERT INTO t13 VALUES('明天你好啊', '明天你好啊100', '明天你好啊1000~~');
SELECT * FROM t13;
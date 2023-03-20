-- 1，查询姓名为赵云的学生成绩
SELECT * FROM student WHERE `name`='赵云'
-- 2查询英语成绩大于90分的同学
SELECT * FROM student WHERE english>90
-- 3查询总分大于200分的所有同学
SELECT * FROM student WHERE (chinese + english + math) > 200

-- 使用where子句，课堂练习[5min]:
-- 查询math大于60 并且(and) id大于4的学生成绩
SELECT * FROM student WHERE math > 60 AND id > 4
-- 查询英语成绩大于语文成绩的同学
SELECT * FROM student WHERE english > chinese 
-- 查询总分大于200分 并且 数学成绩小于语文成绩,的姓赵的学生.
#赵% 表示 名字以赵开头的就可以
SELECT * FROM student WHERE (chinese + english + math) > 200 AND math < chinese AND `name` LIKE '赵%'

-- 1，查询英语分数在 80 - 90之间的同学
SELECT * FROM student WHERE english BETWEEN 80 AND 90
-- 2查询数学分数为89,90,91的同学
select * from student where math in(89,90,91)
-- 3查询所有姓李的学生成绩。
select * from student where `name` like '李%'
-- 4.查询数学分>80，语文分>80的同学。
select * from student where math > 80 and chinese > 80



-- 1。查询语文分数在 70- 80之间的同学
SELECT * FROM student WHERE chinese between 70 and 80
-- 2.查询总分为189,190,191的同学。
SELECT * FROM student WHERE (chinese + english +math) in(189,190,191)
-- 3.查询所有姓李 或者 姓宋 的学生成绩
select * from student where `name` like '李%' or `name` LIKE '宋%'
-- 4.查询数学比语文多30分的同学
select * from student where math - english >30

update  student 
	set math=1000  
	where `name`='张飞'

select * from student 
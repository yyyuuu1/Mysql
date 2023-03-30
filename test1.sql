-- 使用where子句
-- ?如何查找1992.1.1后入职的员工
SELECT * FROM emp
SELECT * FROM emp WHERE hiredate > '1992-01-01'
-- 如何使用like操作符
-- %: 表示0到多个字符_: 表示单个字符?
-- 如何显示首字符为S的员工姓名和工资?
SELECT ename , sal FROM emp WHERE ename LIKE 's%'
-- 如何显示第三个字符为大写O的所有员工的姓名和工资如何显示没有上级的雇员的情况
SELECT ename,sal FROM emp WHERE ename LIKE '__O%' 



-- ?如何按照工资的从低到高的顺序，显示雇员的信息
SELECT * FROM emp ORDER BY sal 
-- ?按照部门号升序而雇员的工资降序排列，显示雇员信息
SELECT * FROM emp ORDER BY deptno , sal DESC



#按雇员的id号降序取出，每页显示5条记录。请分别显示 第3页，第5页 对应的sql语句
select empno from emp order by empno desc limit 15,5


select * from emp

-- (1)显示每种岗位的雇员总数、平均工资
select job ,count(*),avg(sal) from emp group by job
-- (3)显示雇员总数，以及获得补助的雇员数。
select count(*) , count(if(comm is null , 1 ,null)) from emp
-- 显示管理者的总人数(4
select * from emp where job='MANAGER'
-- (5)显示雇员工资的最大差额

select max(sal)-min(sal) from emp 


#应用案例: 请统计各个部门的平均工资，并且是大于1000的并且按照平均工资从高到纸排序，取出前两行记录.
select deptno ,avg(sal) as avg_sal from emp  
	group by deptno
	having avg_sal > 1000
	order by avg_sal desc
	limit 0,2
	
-- 
-- ?显示雇员名,雇员工资及所在部门的名字	
select ename,sal,emp.deptno from emp,dept where emp.deptno = dept.deptno
-- ?如何显示部门号为10的部门名、员工名和工资?
select emp.deptno , dname,ename,sal from emp , dept where emp.deptno=10 and emp.deptno=dept.deptno
-- 显示各个员工的姓名，工资，及其工资的级别	
select * from salgrade
select ename,sal,grade from emp , salgrade where sal between losal and hisal

select * from dept
select * from emp

#学员练习: 显示雇员名,雇员工资及所在部门的名字,并按部门排序[降序排].
select ename,sal,dname from emp , dept  
		where emp.deptno=dept.deptno
		order by dname desc
		
		
#显示公司员工和他的上级的名字		
select * from emp
select worker.ename,boss.mgr from emp worker , emp boss 
	where worker.mgr=boss.empno
	
	
#请思考:如何显示与SMITH同一部门的所有员工
select * from emp	

select deptno from emp where ename='SMITH' 
select * from emp where deptno=(SELECT deptno FROM emp WHERE ename='SMITH' )


#课堂练习:如何查询和部门10的工作相同的雇员的名字、岗位、工资、部门号,但是不含10自己的.
select distinct job from emp where deptno=10

select ename,job,sal,deptno from emp where job in (SELECT distinct job FROM emp WHERE deptno=10) and deptno != 10

#请思考:显示工资比部门30的所有员工的工资高的员工的姓名、工资和部门号
select sal from emp where deptno=30
select ename,sal,deptno from emp where sal> all (SELECT sal FROM emp WHERE deptno=30)



#请思考如何查询与Allen的部门和岗位完全相同的所有雇员(并且不含Allen本人

select deptnp , job from emp where ename='ALLEN'

select * from emp  where (deptno,job) =(SELECT deptno , job FROM emp WHERE ename='ALLEN')

#请查询 和宋江数学，英语，语文成绩 完全相同的学生

select math,english,chinese from student where `name`='宋江'

select * from student where (math,english,chinese)=(SELECT math,english,chinese FROM student WHERE `name`='宋江') and 	`name`!='宋江'


#查找每个部门工资高于本部门平均工资的人的资料这里要用到数据查询的小技巧，把一个子查询当作一个临时表使用
select deptno,avg(sal) as avg_sal from emp group by deptno

select *  from emp ,(SELECT deptno,AVG(sal) AS avg_sal FROM emp GROUP BY deptno) tmp
	where emp.sal > tmp.avg_sal and emp.deptno = tmp.deptno


#查找每个部门工资最高的人的详细资料
select deptno , max(sal) as max_sal from emp group by deptno

select * from emp , (SELECT deptno , MAX(sal) AS max_sal FROM emp GROUP BY deptno) tmp
	where emp.deptno = tmp.deptno and emp.sal = tmp.max_sal
	
	
#查询每个部门的信息(包括: 部门名,编号,地址)和人员数量,我们一起完

select * from dept
select	count(*) , deptno from emp group by deptno
select dname , dept.deptno,loc  from dept , (SELECT	COUNT(*) , deptno FROM emp GROUP BY deptno) tmp
	where dept.deptno=tmp.deptno 



-- 列出部门名称和这些部门的员工信息(名字和工作)，
-- 同时列出那些没有员工的部门名。5min
-- 使用左外连接实现   注意我们是要列出那些没有部门的员工名，因此要把dept表写在左边

select dname,ename,job from dept left join emp on emp.deptno=dept.deptno

select dname,ename,job from emp right join dept on emp.deptno=dept.deptno
	
	
	
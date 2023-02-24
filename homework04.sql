SELECT * FROM emp 
SELECT * FROM dept
-- (1).列出至少有一个员工的所有部门
/*
	先查出各个部门有多少人
	使用 having 子句过滤
*/
SELECT COUNT(*),deptno FROM emp GROUP BY deptno HAVING COUNT(*) > 0

-- (2).列出薪金比“SMITH”多的所有员工
/*
	先查出 smith 的 sal => 作为子查询
	然后其他员工 sal 大于 smith 即可
*/
SELECT sal FROM emp WHERE ename = 'SMITH'
SELECT * FROM emp WHERE sal > (SELECT sal FROM emp WHERE ename = 'SMITH')

-- (3).列出受雇日期晚于其直接上级的所有员工
/*
	先把 emp 表 当做两张表 worker , leader
	条件 1. worker.hiredate > leader.hiredate
	     2. worker.mgr = leader.empno
*/
SELECT worker.ename AS '员工名' , worker.hiredate AS '员工入职时间' ,
	leader.ename AS '上级名' , leader.hiredate AS '上级入职时间' 
	FROM emp worker , emp leader
	WHERE worker.hiredate > leader.hiredate
	AND worker.mgr = leader.empno

-- (4).列出部门名称和这些部门的员工信息，同时列出那些没有员工的部门
/*
	这里因为需要显示所有部门，因此考虑使用外连接，(左外连接)
	如果使用右连接 只需要交换两张表的位置即可
	如果没有印象了，去看看老师讲的外连接.
*/
SELECT dname,emp.*
	FROM dept LEFT JOIN emp ON emp.deptno = dept.deptno
	
-- (5).列出所有“CLERK” (办事员》的姓名及其部门名称
SELECT * FROM emp,dept WHERE emp.deptno=dept.deptno AND job='CLERK'

-- (6).列出最低薪金大于1500的各种工作。
/*
	查询各个部门的最低工资
	使用having 子句进行过滤
*/
SELECT MIN(sal) AS min_sal , job 
	FROM emp
	GROUP BY job
	HAVING min_sal > 1500
	
-- (7).列出在部门“SALES” (销售部) 工作的员工的姓名。
SELECT ename 
	FROM emp,dept 
	WHERE emp.deptno=dept.deptno AND dname='SALES'

-- (8).列出薪金高于公司平均薪金的所有员工
/*
	先查询公司的平均工资
	在把得到的结果当作子查询
*/
SELECT AVG(sal) FROM emp 
SELECT * FROM emp 
	WHERE sal > (SELECT AVG(sal) FROM emp)
	
	
-- (9)列出与“SCOTT”从事相同工作的所有员工
SELECT job FROM emp WHERE ename = 'SCOTT'
SELECT * FROM emp WHERE job = (SELECT job FROM emp WHERE ename = 'SCOTT')

-- (10)列出薪金高于在部门30工作的所有员工的薪金的员工姓名和薪金。
# 先查询30号部门的最高工资
SELECT MAX(sal) FROM emp WHERE deptno = 30
SELECT ename,sal 
	FROM emp
	WHERE sal > (SELECT MAX(sal) FROM emp WHERE deptno = 30)
	
-- (11)列出在每个部门工作的员工数量、平均工资和平均服务期限
SELECT COUNT(*) AS "部门员工数量" , deptno , AVG(sal+IFNULL(comm,0)) AS "平均工资" ,
	FORMAT(AVG(DATEDIFF(NOW(),hiredate)/365),2) AS "平均工作天数 (年)"
	FROM emp
	GROUP BY deptno

-- (12) 列出所有员工的姓名、部门名称和工资
SELECT * FROM emp
SELECT emp.ename, dept.dname ,(sal+IFNULL(comm,0)) AS '工资' 
	FROM emp,dept 
	WHERE emp.deptno = dept.deptno

-- (13)列出所有部门的详细信息和部门人数。
-- 1. 先得到各个部门人数 , 把下面的结果看成临时表 和 dept表联合查询
SELECT COUNT(*) , deptno FROM emp
	GROUP BY deptno
	
SELECT dept.*
	FROM dept ,(SELECT COUNT(*) , deptno FROM emp
		GROUP BY deptno) tmp
		WHERE tmp.deptno = dept.deptno

-- (14).列出各种工作的最低工资
SELECT job , MIN(sal+IFNULL(comm,0)) FROM emp GROUP BY job

-- (15)列出MANAGER (经理)的最低薪金
SELECT MIN(sal) ,job FROM emp WHERE job = 'MANAGER'

-- (16)列出所有员工的年工资,按年薪从低到高排序。		
SELECT ename,(sal+IFNULL(comm,0)*12) AS '年工资'
	FROM emp 
	ORDER BY (sal+IFNULL(comm,0)*12) 
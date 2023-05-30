use fib;

-- 创建存储过程`sp_fibonacci(in m int)`，向表fibonacci插入斐波拉契数列的前m项，及其对应的斐波拉契数。fibonacci表初始值为一张空表。请保证你的存储过程可以多次运行而不出错。

drop procedure if exists sp_fibonacci;
delimiter $$
create procedure sp_fibonacci(in m int)
begin
######## 请补充代码完成存储过程体########
DECLARE i int DEFAULT 2;
DECLARE a int DEFAULT 1;
DECLARE b int DEFAULT 0;
DECLARE tmp int;

if m>=1 then INSERT into fibonacci values(0,0);
end if;
if m>=2 then INSERT into fibonacci values(1,1);
end if;

WHILE i<m do 
    set tmp = a;
    set a = a + b;
    set b = tmp;
    insert into fibonacci values(i,a);
    set i = i+1;
end WHILE;

end $$

delimiter ;

 

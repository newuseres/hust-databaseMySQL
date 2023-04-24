-- 17 查询2022年2月购买基金的高峰期。至少连续三个交易日，所有投资者购买基金的总金额超过100万(含)，则称这段连续交易日为投资者购买基金的高峰期。只有交易日才能购买基金,但不能保证每个交易日都有投资者购买基金。2022年春节假期之后的第1个交易日为2月7日,周六和周日是非交易日，其余均为交易日。请列出高峰时段的日期和当日基金的总购买金额，按日期顺序排序。总购买金额命名为total_amount。
--    请用一条SQL语句实现该查询：


SELECT A.pro_purchase_time  as pro_purchase_time,A.total_amount as total_amount
FROM (
        SELECT pro_purchase_time, sum(f_amount * pro_quantity) as total_amount ,DATE_ADD(pro_purchase_time,INTERVAL IF(dayofweek(pro_purchase_time)=6,3,1)day) as nextday
        FROM property JOIN fund on f_id = pro_pif_id
        WHERE pro_purchase_time BETWEEN '2022-02-07' and '2022-02-28'  
        GROUP BY pro_purchase_time
        HAVING sum(f_amount * pro_quantity) >= 1000000
) as A
JOIN (
        SELECT pro_purchase_time, sum(f_amount * pro_quantity) as total_amount,DATE_ADD(pro_purchase_time,INTERVAL IF(dayofweek(pro_purchase_time)=6,3,1)day) as nextday
        FROM property JOIN fund on f_id = pro_pif_id
        WHERE pro_purchase_time BETWEEN '2022-02-07' and '2022-02-28'  
        GROUP BY pro_purchase_time
        HAVING sum(f_amount * pro_quantity) >= 1000000  
) as B
JOIN (
        SELECT pro_purchase_time, sum(f_amount * pro_quantity) as total_amount
        FROM property JOIN fund on f_id = pro_pif_id
        WHERE pro_purchase_time BETWEEN '2022-02-07' and '2022-02-28'  
        GROUP BY pro_purchase_time
        HAVING sum(f_amount * pro_quantity) >= 1000000  
) as C
WHERE A.nextday = B.pro_purchase_time and B.nextday = C.pro_purchase_time
UNION
SELECT B.pro_purchase_time  as pro_purchase_time,B.total_amount as total_amount
FROM (
        SELECT pro_purchase_time, sum(f_amount * pro_quantity) as total_amount ,DATE_ADD(pro_purchase_time,INTERVAL IF(dayofweek(pro_purchase_time)=6,3,1)day) as nextday
        FROM property JOIN fund on f_id = pro_pif_id
        WHERE pro_purchase_time BETWEEN '2022-02-07' and '2022-02-28'  
        GROUP BY pro_purchase_time
        HAVING sum(f_amount * pro_quantity) >= 1000000
) as A
JOIN (
        SELECT pro_purchase_time, sum(f_amount * pro_quantity) as total_amount,DATE_ADD(pro_purchase_time,INTERVAL IF(dayofweek(pro_purchase_time)=6,3,1)day) as nextday
        FROM property JOIN fund on f_id = pro_pif_id
        WHERE pro_purchase_time BETWEEN '2022-02-07' and '2022-02-28'  
        GROUP BY pro_purchase_time
        HAVING sum(f_amount * pro_quantity) >= 1000000  
) as B
JOIN (
        SELECT pro_purchase_time, sum(f_amount * pro_quantity) as total_amount
        FROM property JOIN fund on f_id = pro_pif_id
        WHERE pro_purchase_time BETWEEN '2022-02-07' and '2022-02-28'  
        GROUP BY pro_purchase_time
        HAVING sum(f_amount * pro_quantity) >= 1000000  
) as C
WHERE A.nextday = B.pro_purchase_time and B.nextday = C.pro_purchase_time
UNION
SELECT C.pro_purchase_time  as pro_purchase_time,C.total_amount as total_amount
FROM (
        SELECT pro_purchase_time, sum(f_amount * pro_quantity) as total_amount ,DATE_ADD(pro_purchase_time,INTERVAL IF(dayofweek(pro_purchase_time)=6,3,1)day) as nextday
        FROM property JOIN fund on f_id = pro_pif_id
        WHERE pro_purchase_time BETWEEN '2022-02-07' and '2022-02-28'  
        GROUP BY pro_purchase_time
        HAVING sum(f_amount * pro_quantity) >= 1000000
) as A
JOIN (
        SELECT pro_purchase_time, sum(f_amount * pro_quantity) as total_amount,DATE_ADD(pro_purchase_time,INTERVAL IF(dayofweek(pro_purchase_time)=6,3,1)day) as nextday
        FROM property JOIN fund on f_id = pro_pif_id
        WHERE pro_purchase_time BETWEEN '2022-02-07' and '2022-02-28'  
        GROUP BY pro_purchase_time
        HAVING sum(f_amount * pro_quantity) >= 1000000  
) as B
JOIN (
        SELECT pro_purchase_time, sum(f_amount * pro_quantity) as total_amount
        FROM property JOIN fund on f_id = pro_pif_id
        WHERE pro_purchase_time BETWEEN '2022-02-07' and '2022-02-28'  
        GROUP BY pro_purchase_time
        HAVING sum(f_amount * pro_quantity) >= 1000000  
) as C
WHERE A.nextday = B.pro_purchase_time and B.nextday = C.pro_purchase_time



/*  end  of  your code  */
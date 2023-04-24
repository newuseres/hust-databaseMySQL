-- 19) 以日历表格式列出2022年2月每周每日基金购买总金额，输出格式如下：
-- week_of_trading Monday Tuesday Wednesday Thursday Friday
--               1
--               2    
--               3
--               4
--   请用一条SQL语句实现该查询：


SELECT wk-5 as week_of_trading,mon.tot as Monday,tue.tot as Tuesday,wed.tot as Wednesday,thu.tot as Thursday,fri.tot as Friday
FROM  (
    SELECT  sum(pro_quantity*f_amount) as tot,week( pro_purchase_time) as wk
    FROM property JOIN fund on pro_pif_id = f_id 
    WHERE pro_type = 3 and weekday(pro_purchase_time) = 0 and pro_purchase_time BETWEEN '2022-02-07' and '2022-02-28'
    GROUP BY pro_purchase_time
) as mon 
LEFT JOIN
(
    SELECT sum(pro_quantity*f_amount) as tot,week( pro_purchase_time) wk
    FROM property JOIN fund on pro_pif_id = f_id 
    WHERE pro_type = 3 and weekday(pro_purchase_time) = 1 and pro_purchase_time BETWEEN '2022-02-07' and '2022-02-28'
    GROUP BY pro_purchase_time
) as tue USING(wk)
LEFT JOIN 
(
    SELECT sum(pro_quantity*f_amount) as tot,week( pro_purchase_time) wk
    FROM property JOIN fund on pro_pif_id = f_id 
    WHERE pro_type = 3 and weekday(pro_purchase_time) = 2 and pro_purchase_time BETWEEN '2022-02-07' and '2022-02-28'
    GROUP BY pro_purchase_time
) as wed USING(wk)
LEFT JOIN 
(
    SELECT sum(pro_quantity*f_amount) as tot,week( pro_purchase_time) wk
    FROM property JOIN fund on pro_pif_id = f_id 
    WHERE pro_type = 3 and weekday(pro_purchase_time) = 3 and pro_purchase_time BETWEEN '2022-02-07' and '2022-02-28'
    GROUP BY pro_purchase_time
) as thu USING(wk)
LEFT JOIN 
(
    SELECT sum(pro_quantity*f_amount) as tot,week( pro_purchase_time) wk
    FROM property JOIN fund on pro_pif_id = f_id 
    WHERE pro_type = 3 and weekday(pro_purchase_time) = 4 and pro_purchase_time BETWEEN '2022-02-07' and '2022-02-28'
    GROUP BY pro_purchase_time
) as fri USING(wk);

/*  end  of  your code  */

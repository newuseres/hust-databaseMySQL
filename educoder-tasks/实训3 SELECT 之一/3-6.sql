-- 6) 查询资产表中所有资产记录里商品收益的众数和它出现的次数。
--    请用一条SQL语句实现该查询：


SELECT pro_income,count(*) as presence 
FROM property
GROUP BY pro_income
HAVING count(*) >= ALL(SELECT count(*) from property GROUP BY pro_income);



/*  end  of  your code  */
   -- 3) 查询购买了所有畅销理财产品的客户
--   请用一条SQL语句实现该查询：


SELECT DISTINCT A.pro_c_id  as pro_c_id
from property as A
WHERE NOT EXISTS(
    SELECT *
    from(
        SELECT pro_pif_id
        from property 
        WHERE pro_type = 1
        GROUP BY pro_pif_id 
        HAVING COUNT(pro_c_id) > 2
    ) as B 
    WHERE NOT EXISTS(
        SELECT *
        from property as C
        WHERE A.pro_c_id = C.pro_c_id and B.pro_pif_id = C.pro_pif_id and C.pro_type = 1
    )
)
ORDER BY A.pro_c_id;




/*  end  of  your code 
请用一条SQL语句完成以下查询任务：
  若定义持有人数超过2的理财产品称为畅销理财产品。
  查询购买了所有畅销理财产品的客户编号(pro_c_id)。
 注意结果输出要求：按照客户编号的升序排列，且去除重复结果。
 

--畅销
SELECT pro_pif_id
from property 
WHERE pro_type = 1
GROUP BY pro_pif_id 
HAVING COUNT(pro_c_id) > 2

  */
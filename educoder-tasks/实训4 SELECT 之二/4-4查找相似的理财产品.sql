    -- 4) 	查找相似的理财产品
--   请用一条SQL语句实现该查询：

SELECT D.pro_pif_id as pro_pif_id,count(*) as cc,dense_rank() over(order by count(E.pro_c_id)  DESC) as prank
FROM ( 
    SELECT B.pro_pif_id as pro_pif_id
    FROM property as B
    WHERE EXISTS(
        SELECT *
        FROM (    
            SELECT pro_c_id,dense_rank() over(order by sum(pro_quantity) DESC) as rk 
            FROM property
            WHERE pro_type = 1 and pro_pif_id = 14
            GROUP BY pro_c_id
        ) as  A
        WHERE A.rk <= 3 and A.pro_c_id = B.pro_c_id
    ) and B.pro_type = 1 and B.pro_pif_id != 14
) as D
JOIN (
    SELECT *
    FROM property
    WHERE pro_type = 1 and pro_pif_id != 14
) as E 
USING (pro_pif_id)
GROUP BY D.pro_pif_id
ORDER BY D.pro_pif_id;

--所有的产品和排名
--所有可能相似的理财产品
--和所有买过14号产品的用户交，看交出多少 count 作为排名
--这道题太奇怪了，这里面的用户不是值得买过14号的用户。。。。而是与所有用户交 fuck
/*  end  of  your code
请用一条SQL语句完成以下查询任务：
  在某些推荐方法中，需要查找某款理财产品相似的其他理财产品，不妨设其定义为：对于某款理财产品A，可找到持有A数量最多的“3”个（
  包括所有持有相同数量的客户，因此如有3个并列第一、1个第二、一个第三，则排列结果是1,1,1,2,3）客户，
  然后对于这“3”个客户持有的所有理财产品（不包含产品A自身），每款产品被全体客户持有总人数被认为是和产品A的相似度，
  若有相似度相同的理财产品，则为了便于后续处理的确定性，则这些相似度相同的理财产品间按照产品编号的升序排列。按照和产品A的相似度，
  最多的“3”款（同上理，前3名允许并列的情况，例如排列结果是1,2,2,2,3）理财产品，就是产品A的相似的理财产品。
请查找产品14的相似理财产品编号（不包含14自身）（pro_pif_id）、该编号的理财产品的客购买客户总人数（cc）以及该理财产品对于14 
号理财产品的相似度排名值（prank）。
注意结果输出要求：按照相似度值降序排列，相同相似度的理财产品之间则按照产品编号的升序排列。  */
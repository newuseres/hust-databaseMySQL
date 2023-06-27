-- 15) 查询资产表中客户编号，客户基金投资总收益,基金投资总收益的排名(从高到低排名)。
--     总收益相同时名次亦相同(即并列名次)。总收益命名为total_revenue, 名次命名为rank。
--     第一条SQL语句实现全局名次不连续的排名，
--     第二条SQL语句实现全局名次连续的排名。

-- (1) 基金总收益排名(名次不连续)

SELECT D.pro_c_id as pro_c_id,D.total_revenue as total_revenue,C.rk as 'rank'
FROM (
    SELECT A.total_revenue as total_revenue ,COUNT(B.total_revenue)+1 as rk
    from (
        SELECT DISTINCT sum( pro_income ) as total_revenue
        FROM property
        WHERE pro_type = 3 
        GROUP BY pro_c_id
    ) as A 
    LEFT JOIN (
        SELECT sum(  pro_income ) as total_revenue 
        FROM property
        WHERE pro_type = 3 
        GROUP BY pro_c_id    
    ) as B on A.total_revenue < B.total_revenue 
    GROUP BY A.total_revenue /*总收益左右表连接之后，按照左表为码，则右表的个数+1就是排名*/
)
 as C 
JOIN (
    SELECT sum(  pro_income ) as total_revenue , pro_c_id
    FROM property
    WHERE pro_type = 3 
    GROUP BY pro_c_id    
) as D /*与资产表连接之后就知道每一个对应基金投资总收益排名了 */
on C.total_revenue = D.total_revenue
ORDER BY C.rk ASC,pro_c_id;

-- (2) 基金总收益排名(名次连续)
SELECT D.pro_c_id as pro_c_id,D.total_revenue as total_revenue,C.rk as 'rank'
FROM (
    SELECT A.total_revenue as total_revenue ,COUNT(B.total_revenue)+1 as rk
    from (
        SELECT DISTINCT sum( pro_income ) as total_revenue
        FROM property
        WHERE pro_type = 3 
        GROUP BY pro_c_id
    ) as A 
    LEFT JOIN (
        SELECT DISTINCT  sum(  pro_income ) as total_revenue 
        FROM property
        WHERE pro_type = 3 
        GROUP BY pro_c_id    
    ) as B on A.total_revenue < B.total_revenue 
    GROUP BY A.total_revenue
)
 as C 
JOIN (
    SELECT sum(  pro_income ) as total_revenue , pro_c_id
    FROM property
    WHERE pro_type = 3 
    GROUP BY pro_c_id
) as D 
on C.total_revenue = D.total_revenue
ORDER BY C.rk ASC,pro_c_id;



/*  end  of  your code  */
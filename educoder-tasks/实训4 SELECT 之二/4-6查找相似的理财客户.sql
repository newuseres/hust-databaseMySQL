 -- 6) 查找相似的理财客户
--   请用一条SQL语句实现该查询：


SELECT * FROM(
    SELECT * ,rank() over(partition by pac order by common desc,pbc ) as crank
    from(
        SELECT DISTINCT A.pro_c_id as pac,C.pro_c_id as pbc,count(C.pro_c_id) as common
        FROM property as A 
        JOIN (
            SELECT DISTINCT B.pro_c_id as pro_c_id, B.pro_pif_id as pro_pif_id
            FROM property as B 
            WHERE  B.pro_type=1
        )  as C on A.pro_c_id != C.pro_c_id and A.pro_pif_id = C.pro_pif_id
        where A.pro_type = 1 
        group by A.pro_c_id , C.pro_c_id
    ) as tmp1
) as tmp2
where crank<3;


/*  end  of  your code 
请用一条SQL语句完成以下查询任务：
   在某些推荐方法中，需要查找某位客户在理财行为上相似的其他客户，不妨设其定义为：对于A客户，
   其购买的理财产品集合为{P}，另所有买过{P}中至少一款产品的其他客户集合为{B}，
   则{B}中每位用户购买的{P}中产品的数量为他与A客户的相似度值。将{B}中客户按照相似度值降序排列，
   得到A客户的相同相似度值则按照客户编号升序排列，这样取前两位客户即为A客户的相似理财客户列表。
  查询每位客户(列名：pac)的相似度排名值小于3的相似客户(列名：pbc)列表，
  以及该每位客户和他的每位相似客户的共同持有的理财产品数(列名：common)、相似度排名值(列名：crank)。
  注意结果输出要求：要求结果先按照左边客户编号(pac)升序排列，同一个客户的相似客户则按照客户相似度排名值（crank）顺序排列。
 */
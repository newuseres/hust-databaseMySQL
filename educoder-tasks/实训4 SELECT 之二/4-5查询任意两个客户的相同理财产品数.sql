-- 5) 查询任意两个客户的相同理财产品数
--   请用一条SQL语句实现该查询：





SELECT A.pro_c_id as pro_c_id,B.pro_c_id as pro_c_id,COUNT(*) as total_count
FROM property as A JOIN property as B on A.pro_c_id != B.pro_c_id
WHERE A.pro_type = 1 and B.pro_type = 1 and A.pro_pif_id = B.pro_pif_id
GROUP BY A.pro_c_id,B.pro_c_id
HAVING COUNT(*) >= 2
ORDER BY A.pro_c_id;

--A理财  X B 理财

/*  end  of  your code
请用一条SQL语句完成以下查询任务：
  查询任意两个客户之间持有的相同理财产品种数，并且结果仅保留相同理财产品数至少2种的用户对。
  注意结果输出要求：第一列和第二列输出客户编号(pro_c_id,pro_c_id)，第三列输出他们持有的相同理财产品数(total_count)，按照第一列的客户编号的升序排列。

  */
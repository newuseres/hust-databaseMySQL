-- 3) 查询既买了保险又买了基金的客户的名称、邮箱和电话。结果依c_id排序
-- 请用一条SQL语句实现该查询：

SELECT c_name,c_mail,c_phone
from client
WHERE c_id IN (
    SELECT pro_c_id
    from property PR
    WHERE EXISTS(SELECT 1 from property WHERE pro_c_id=PR.pro_c_id and pro_type=3) and EXISTS(SELECT 1 from property WHERE pro_c_id=PR.pro_c_id and pro_type=2)
)
order by c_id ASC;


/*  end  of  your code  */
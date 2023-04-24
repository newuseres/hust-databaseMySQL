-- 9) 查询购买了货币型(f_type='货币型')基金的用户的名称、电话号、邮箱。
--   请用一条SQL语句实现该查询：




SELECT c_name,c_phone,c_mail
FROM client
WHERE EXISTS(
    SELECT 1 
    FROM property,fund
    WHERE pro_c_id=c_id and pro_type = 3 and pro_pif_id = f_id and f_type = '货币型'
) ORDER by c_id;


/*  end  of  your code  */
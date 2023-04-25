use finance1;
-- 请用一条SQL语句删除client表中没有银行卡的客户信息：

DELETE FROM client
WHERE c_id not in (
    SELECT b_c_id
    FROM bank_card
) 


/* the end of your code */ 
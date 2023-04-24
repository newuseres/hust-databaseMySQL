 -- 18) 查询至少有一张信用卡余额超过5000元的客户编号，以及该客户持有的信用卡总余额，总余额命名为credit_card_amount。
--    请用一条SQL语句实现该查询：



SELECT b_c_id,sum(b_balance) as credit_card_amount
FROM bank_card
WHERE b_c_id in (
    SELECT b_c_id
    FROM bank_card 
    WHERE b_type = "信用卡" and b_balance >5000
)
and b_type = "信用卡"
GROUP BY b_c_id
ORDER by b_c_id;


/*  end  of  your code  */


 
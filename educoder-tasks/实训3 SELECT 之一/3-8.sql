SELECT c_name,c_id_card,c_phone
FROM client
WHERE c_id IN (
    SELECT b_c_id
    FROM (
        SELECT b_c_id
        from bank_card
        WHERE b_type = "信用卡"
    ) yo
    GROUP BY b_c_id
    HAVING COUNT(*)>=2
)ORDER by c_id;
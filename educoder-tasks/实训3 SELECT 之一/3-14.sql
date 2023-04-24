SELECT i_id,i_amount
FROM insurance
WHERE i_amount IN(
    SELECT C.i_amount as i_amount
    FROM (
        SELECT A.i_amount as i_amount 
        FROM (
            SELECT DISTINCT i_amount
            FROM insurance
        ) as A JOIN (
            SELECT DISTINCT i_amount
            FROM insurance
        ) as B on A.i_amount <= B.i_amount
    ) as C
    GROUP BY C.i_amount
    HAVING COUNT(*) = 4
);

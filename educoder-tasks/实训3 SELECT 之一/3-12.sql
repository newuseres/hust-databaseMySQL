SELECT c_name,c_id_card,IFNULL(sum(tot),0) as total_amount
from( 
    (
    SELECT c_id,c_name,c_id_card,sum( pro_quantity*p_amount )as tot
    from  client JOIN property on c_id = pro_c_id
        JOIN finances_product on p_id = pro_pif_id
    WHERE pro_type = 1
    GROUP BY c_id
    ) 
    UNION
    (
    SELECT c_id,c_name,c_id_card, sum( pro_quantity*i_amount )   as tot
    from  client LEFT JOIN property on c_id = pro_c_id
        JOIN insurance on i_id = pro_pif_id
    WHERE pro_type = 2
    GROUP BY c_id
    )
    UNION
    (
    SELECT c_id,c_name,c_id_card,sum( pro_quantity*f_amount )  as tot
    from  client JOIN property on c_id = pro_c_id
        JOIN fund on f_id = pro_pif_id
    WHERE pro_type = 3
    GROUP BY c_id
    )
    UNION(
        SELECT c_id,c_name,c_id_card,sum(0) as tot
        from client
         GROUP BY c_id
    )
      )AS A
GROUP BY c_id,c_name,c_id_card
ORDER BY total_amount DESC;

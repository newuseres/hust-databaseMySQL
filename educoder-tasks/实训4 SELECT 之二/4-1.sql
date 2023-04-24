SELECT YEAR(pro_income) as pyear,rank() over(PARTITION BY YEAR(pro_income) ORDER by p_amount DESC ) as rk
from property
WHERE pro_purchase_time BETWEEN '2010-1-1' and '2011-12-31';



select  yo.year as pyear,yo.rk as rk , yo.p_id as p_id,yo.sumamount as sumamount
from(
SELECT YEAR(pro_purchase_time ) as year,p_id,sum(pro_quantity * p_amount ) as sumamount,rank() over(PARTITION BY YEAR(pro_purchase_time) ORDER by sum(pro_quantity * p_amount ) ) as rk
from property JOIN finances_product on p_id = pro_pif_id and pro_type = 1
WHERE pro_purchase_time BETWEEN '2010-1-1' and '2011-12-31'
GROUP BY YEAR(pro_purchase_time),p_id
) as yo
WHERE rk <= 3;
/*
  查询2010年和2011年这两年每年销售总额前3名（如果有并列排名，则后续排名号跳过之前的并列排名个数，例如1、1、3）的统计年份（pyear）、销售总额排名值(rk)、
  理财产品编号(p_id)、销售总额(sumamount)。
  注意结果输出要求：(1)按照年份升序排列，同一年份按照销售总额的排名值升序排列，
  如遇到并列排名则按照理财产品编号升序排列;(2)属性显示：统计年份（pyear）、销售总额排名值(rk)、理财产品编号(p_id)、
  销售总额(sumamount)（3）结果显示顺序：先按照统计年份（pyear）升序排,同一年份按照销售总额排名值（rk）升序排,同一排名值的按照理财产品编号（p_id ）升序排。
  */
-- 事务1:
use testdb1;
start transaction;
select tickets from ticket where flight_no = 'MU2455';
set @n = sleep(2);
select tickets from ticket where flight_no = 'MU2455';
commit;


-- 事务2:x
use testdb1;
start transaction;
set @n = sleep(1);
update ticket set tickets = tickets - 1 where flight_no = 'MU2455';
commit;

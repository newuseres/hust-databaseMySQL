-- 编写一存储过程，自动安排某个连续期间的大夜班的值班表:

delimiter $$
create procedure sp_night_shift_arrange(in start_date date, in end_date date)
begin
DECLARE wk,typ int;
DECLARE now_day date DEFAULT start_date;
DECLARE done boolean DEFAULT false;
DECLARE nurse1,nurse2,doctor,zhuren char(30);

DECLARE cur1 cursor for select e_name from employee WHERE e_type = 3;
DECLARE cur2 cursor for select e_type, e_name from employee WHERE e_type = 2 or e_type =1;
declare continue handler for not found set done = true;
open cur1;
open cur2;
WHILE now_day <= end_date DO
    FETCH cur1 into nurse1;
    if done then
        close cur1;
        open cur1;
        set done = false;
        FETCH cur1 into nurse1;
    end if;
    FETCH cur1 into nurse2;
    if done then 
        close cur1;
        open cur1;
        set done = false;
        FETCH cur1 into nurse2;
    end if;
    set wk = weekday(now_day);
    if wk = 0  and zhuren IS NOT NULL then
        set doctor = zhuren;
        set zhuren = null;
    else 
        FETCH cur2 into typ,doctor;
        if done then
            close cur2;
            open cur2;
            set done = false;
            FETCH cur2 into typ,doctor;
        end if;
        if wk >= 5 and typ = 1 then
            set zhuren = doctor;
        FETCH cur2 into typ,doctor;
            if done then
                close cur2;
                open cur2;
                set done = false;
                FETCH cur2 into typ,doctor;
            end if;
        END IF;
    end if;
    insert into night_shift_schedule  values(now_day,doctor,nurse1,nurse2);
    set now_day = date_add(now_day,INTERVAL 1 day);
end while;



end$$

delimiter ;

/*  end  of  your code  */ 

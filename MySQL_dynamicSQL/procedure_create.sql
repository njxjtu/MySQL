delimiter $$

drop procedure if exists p_test $$

create procedure p_test()
begin

declare flag INT default 0;
declare v_table varchar(20);
declare v_concat varchar(100);
declare v_sample_id int;
declare v_text varchar(100);

declare c_batch cursor for
select temp.tn as im_table_name, group_concat(temp.cn) as im_column_names
from (select table_name as tn,column_name as cn
      from information_schema.columns
      where table_name in (select im_table from material_type)
      and column_name not in ('sample_id')) as temp
group by temp.tn;

declare c_batch2 cursor for
select sample_id, temp_text
from temp_store;
declare continue handler for not found set flag=1;

open c_batch;
read_loop: LOOP
fetch c_batch into v_table, v_concat;
if flag=1 then 
  leave read_loop;
end if;
set @a_table :=v_table;
set @a_concat :=v_concat;
set @str=concat('insert into temp_store select sample_id, concat_ws('','',', @a_concat, ') from ', @a_table);

prepare stmt1 from @str;
execute stmt1 ;

end loop read_loop;
close c_batch;

set flag :=0;

open c_batch2;
read_loop2: loop
fetch c_batch2 into v_sample_id, v_text;
if flag=1 then 
  leave read_loop2;
end if;

update sample_table
set sample_text=v_text
where sample_id=v_sample_id;

end loop read_loop2;
close c_batch2;

end$$
DELIMITER ;

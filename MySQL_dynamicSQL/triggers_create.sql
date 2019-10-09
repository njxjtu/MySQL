delimiter $$
drop trigger if exists tri_update_soil$$
create trigger tri_update_soil
    after update on soil_im_table for each row
begin
    update sample_table
    set sample_text = concat_ws(',',new.soil_color,new.soil_smell)
	where sample_id = new.sample_id;
end$$

drop trigger if exists tri_insert_soil$$
create trigger tri_insert_soil
    after insert on soil_im_table for each row
begin
    update sample_table
    set sample_text = concat_ws(',',new.soil_color,new.soil_smell)
	where sample_id = new.sample_id;
end$$

drop trigger if exists tri_update_water$$
create trigger tri_update_water
    after update on water_im_table for each row
begin
    update sample_table
    set sample_text = concat_ws(',',new.water_source,new.water_temp)
	where sample_id = new.sample_id;
end$$

drop trigger if exists tri_insert_water$$
create trigger tri_insert_water
    after insert on water_im_table for each row
begin
    update sample_table
    set sample_text = concat_ws(',',new.water_source,new.water_temp)
	where sample_id = new.sample_id;
end$$
delimiter ;

create database db01;
use db01;
create table material_type(type_id int, type_name varchar(10), im_table varchar(20));
insert into material_type values(11, 'soil','soil_im_table');
insert into material_type values(12, 'water','water_im_table');
create table soil_im_table(sample_id int, soil_color varchar(10), soil_smell varchar(10));
insert into soil_im_table values(1,'red','fresh');
insert into soil_im_table values(3,'dark','smelly');
create table water_im_table(sample_id int, water_source varchar(20), water_temp int);
insert into water_im_table values(2,'undergnd',70);
insert into water_im_table values(4,'rain',41);
create table sample_table(sample_id int, sample_material varchar(20),sample_loc varchar(20), sample_dense varchar(20), sample_text varchar(100));
insert into sample_table values(1,'Portland','soil','high',null);
insert into sample_table values(2,'Sacramento','water','mid',null);
insert into sample_table values(3,'Albany','soil','high',null);
insert into sample_table values(4,'Davis','water','low',null);
create table temp_store(sample_id int, temp_text varchar(100));

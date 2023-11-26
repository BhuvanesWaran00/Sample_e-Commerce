create database userdata;
use userdata;

create table CustomerAccount(
	account_id int auto_increment not null,
	email varchar(100),
	password varchar(255) not null,
	name varchar(30) not null,
	gender enum('Female','Male') not null,
	primary key(account_id) 
);

/* LaptopModel(model_id, model, brand, cpu_specs, display_size, resolution, operating_system, gpu_specs, launch_date, thumbnail, price) */
create table LaptopModel(
	model_id varchar(100) not null,
	model text not null,
	brand varchar(100) not null,
	cpu_specs text, 
	display_size double(5,2), 
	resolution varchar(100),
	operating_system text,
	gpu_specs text,
	launch_date date,
	thumbnail text,
	price double(10,2) not null,
	primary key(model_id) 
);



0 row(s) affected, 2 warning(s): 
1681 Specifying number of digits for floating point data types is deprecated and will be removed in a future release. 
1681 Specifying number of digits for floating point data types is deprecated and will be removed in a future release.

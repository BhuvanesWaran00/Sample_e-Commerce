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
CREATE TABLE LaptopModel (
    model_id VARCHAR(100) NOT NULL,
    model TEXT NOT NULL,
    brand VARCHAR(100) NOT NULL,
    cpu_specs TEXT,
    display_size DOUBLE,
    resolution VARCHAR(100),
    operating_system TEXT,
    gpu_specs TEXT,
    launch_date DATE,
    thumbnail TEXT,
    price DOUBLE NOT NULL,
    PRIMARY KEY (model_id)
);



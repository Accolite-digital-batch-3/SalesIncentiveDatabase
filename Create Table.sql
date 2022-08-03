use salesincentive;

# Product Type

drop table product_type;
create table product_type(
	type_id int AUTO_INCREMENT primary key,
    type_name varchar(100)
);

#Product
drop table product;
create table product(
	product_id int AUTO_INCREMENT primary key,
    product_name varchar(255),
    cost decimal(10,2),
    type_id int ,
    foreign key(type_id) references product_type(type_id)
);

#Commission model
drop table commission_model;
create table commission_model(
	cm_id int AUTO_INCREMENT primary key,
    amount1 decimal(10,2),
    amount2 decimal(10,2),
    percentage int,
    type_id int ,
    foreign key(type_id) references product_type(type_id)
);

# Location for Quota amount for employee per month
drop table location;
create table location(
	location_id int AUTO_INCREMENT primary key,
    location varchar(100),
    quota_amount decimal(10,2)
);

drop table employee;
#Employee
create table employee(
	emp_id int AUTO_INCREMENT primary key,
    emp_name varchar(255),
    emp_email varchar(255),
    emp_password varchar(255),
    location_id int,
    reporting_head_id int,
    role varchar(100),
    foreign key(location_id) references location(location_id)
    
);
drop table sales_line_item;

#Sales of each product 
create table sales_line_item(
	sales_id int AUTO_INCREMENT primary key,
    emp_id int,
    product_id int,
    sold_date date,
    sold_cost decimal(10,2),
	foreign key(emp_id) references employee(emp_id),
	foreign key(product_id) references product(product_id)
);

#monthly sale
drop table monthly_commission;
create table monthly_commission(
	id int AUTO_INCREMENT primary key,
    emp_id int,
    commission_amount decimal(10,2),
    month_year date
);
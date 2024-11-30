drop database if exists amusement_park;
create database amusement_park;
use amusement_park;

create table customers (
    customer_id int primary key auto_increment,
    first_name varchar(25),
    last_name varchar(50),
    phone_number varchar(15),
    email_address varchar(50)
);

create table positions (
    position_id int primary key auto_increment,
    position_name varchar(20)
);

create table employees (
    employee_id int primary key auto_increment,
    position_id int,
    customer_id int,
    contract_number varchar(20),
    employment_end_date date,
    salary varchar(10),
    bonus varchar(5),
    foreign key (position_id) references positions (position_id),
    foreign key (customer_id) references customers (customer_id)
);

create table attractions (
    attraction_id int primary key auto_increment,
    name varchar(20),
    description varchar(255),
    employee_id int,
    foreign key (employee_id) references employees (employee_id)
);

create table ticket_types (
    ticket_type_id int primary key auto_increment,
    ticket_type varchar(10)
);

create table discounts (
    discount_type_id int primary key auto_increment,
    discount_type varchar(10),
    discount_value varchar(5)
);

create table tickets (
    ticket_id int primary key auto_increment,
    ticket_type_id int,
    discount_id int,
    price varchar(5),
    foreign key (ticket_type_id) references ticket_types (ticket_type_id),
    foreign key (discount_id) references discounts (discount_type_id)
);

create table payment_types (
    payment_type_id int primary key auto_increment,
    payment_type varchar(10)
);

create table orders (
    order_id int primary key auto_increment,
    customer_id int,
    ticket_id int,
    approving_employee_id int,
    purchase_date datetime,
    foreign key (ticket_id) references tickets (ticket_id),
    foreign key (customer_id) references customers (customer_id),
    foreign key (approving_employee_id) references employees (employee_id)
);

drop database if exists amusement_park;
create database amusement_park;
use amusement_park;

create table customers (
    customer_id int primary key auto_increment,
    first_name varchar(25),
    last_name varchar(50),
    phone_number varchar(15),
    email_address varchar(50)
);

create table positions (
    position_id int primary key auto_increment,
    position_name varchar(20)
);

create table employees (
    employee_id int primary key auto_increment,
    position_id int,
    customer_id int,
    contract_number varchar(20),
    employment_end_date date,
    salary varchar(10),
    bonus varchar(5),
    foreign key (position_id) references positions (position_id),
    foreign key (customer_id) references customers (customer_id)
);

create table attractions (
    attraction_id int primary key auto_increment,
    name varchar(20),
    description varchar(255),
    employee_id int,
    foreign key (employee_id) references employees (employee_id)
);

create table ticket_types (
    ticket_type_id int primary key auto_increment,
    ticket_type varchar(10)
);

create table discounts (
    discount_type_id int primary key auto_increment,
    discount_type varchar(10),
    discount_value decimal(5,2)
);

create table tickets (
    ticket_id int primary key auto_increment,
    ticket_type_id int,
    discount_id int,
    price decimal(10,2)
    foreign key (ticket_type_id) references ticket_types (ticket_type_id),
    foreign key (discount_id) references discounts (discount_type_id)
);

create table payment_types (
    payment_type_id int primary key auto_increment,
    payment_type varchar(10)
);

create table orders (
    order_id int primary key auto_increment,
    customer_id int,
    approving_employee_id int,
    purchase_date datetime,
    payment_type_id int,
    foreign key (customer_id) references customers (customer_id),
    foreign key (approving_employee_id) references employees (employee_id),
    foreign key (payment_type_id) references payment_types (payment_type_id)
);

create table order_tickets (
    order_ticket_id int primary key auto_increment,
    order_id int,
    ticket_id int,
    quantity int,
    foreign key (order_id) references orders (order_id),
    foreign key (ticket_id) references tickets (ticket_id)
);
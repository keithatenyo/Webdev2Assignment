create table users (
ID int not null auto_increment primary key,
date_of_record date not null,
time_of_record time not null,
user_name varchar(32) not null,
email varchar(50) not null,
password varchar(32) not null,
user_type varchar(32) not null
);

create table categories (
category_ID int not null auto_increment primary key,
category_name varchar(32) not null,
category_order varchar(15) not null
);

create table products (
product_ID int not null auto_increment primary key,
product_name varchar(32) not null,
product_description varchar(255) not null,
image_url blob not null,
price double not null,
cat_id int not null,
foreign key (cat_id) references categories(category_ID)
);

create table promotions (
promotion_ID int not null auto_increment primary key,
promotion_name varchar(32) not null,
pro_description varchar(255) not null,
start_date date not null,
end_date date not null,
date_of_creation date not null,
price double,
overall_discount double,
zip_code varchar(32),
type_of_promotion varchar(32) 
);

create table carts (
cart_ID int not null auto_increment primary key,
cart_status varchar(32) not null,
date_of_creation date not null,
user_id int not null,
zip_code varchar(32),
foreign key (user_id) references users(ID)
);

create table cartProducts (
id int not null auto_increment primary key,
crt_id int not null,
pdct_id int not null,
quantity int not null,
foreign key (crt_id) references carts(cart_ID),
foreign key (pdct_id) references products(product_ID)
);

create table cartPromotions (
id int not null auto_increment primary key,
promo_id int not null,
pdct_id int not null,
foreign key (promo_id) references promotions(promotion_ID),
foreign key (pdct_id) references products(product_ID)
);
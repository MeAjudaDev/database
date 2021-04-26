
drop database gestao_financeira;
create database gestao_financeira;

use gestao_financeira;


create table users(
	user_id int(11) AUTO_INCREMENT primary key,
  	name varchar(100),
  	email varchar(100),
  	password varchar(100),
  	state_user char,
  	activation_code varchar(4),
  	update_at datetime on update current_timestamp,
    created_at datetime default current_timestamp
)
engine = INNODB
default charset = utf8;


create table categories (
  	category_id int(11) primary key,
  	description varchar(100),
  	state_category char,
  	update_at datetime on update current_timestamp,
    created_at datetime default current_timestamp
)
engine = INNODB
default charset = utf8;


create table expenses (
	expenses_id int AUTO_INCREMENT primary key,
    description varchar(150),
    value decimal(15,2),
    is_fixed boolean,
	due_date date,
    update_at datetime on update current_timestamp,
    created_at datetime default current_timestamp,
    user_id int(11), 
  	category_id int(11), 
  	FOREIGN KEY (user_id) REFERENCES users(user_id),
  	FOREIGN KEY (category_id) REFERENCES categories(category_id)
)
engine = INNODB
default charset = utf8;




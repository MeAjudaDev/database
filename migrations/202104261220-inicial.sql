-- drop database gestao_financeira;
create database gestao_financeira;
use gestao_financeira;

create table users(
	id int(11) AUTO_INCREMENT primary key,
	name varchar(100),
	email varchar(100),
	password varchar(100),
	activation_code varchar(4), -- Codigo de ativação da conta / Recuperação de Senha
    state char default 'P', -- [A] Ativo / [P] Pendente / [D] Desativo / [E] Excluido
	update_at datetime on update current_timestamp,
	created_at datetime default current_timestamp
) 
engine = INNODB 
default charset = utf8;

create table categories (
	id int(11) primary key,
	description varchar(100),
	state char default 'A', -- [A] Ativo / [D] Desativo / [E] Excluido
    type char, -- [E] Despesas / [R] Receitas
    user_id int(11),
	update_at datetime on update current_timestamp,
	created_at datetime default current_timestamp,
    FOREIGN KEY (user_id) REFERENCES users(id)
) 
engine = INNODB 
default charset = utf8;

create table expenses (
	id int AUTO_INCREMENT primary key,
	description varchar(150),
	value decimal(15, 2),
	is_fixed boolean,
	due_date date,
	update_at datetime on update current_timestamp,
	created_at datetime default current_timestamp,
	user_id int(11),
	category_id int(11),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (category_id) REFERENCES categories(id)
) 
engine = INNODB 
default charset = utf8;
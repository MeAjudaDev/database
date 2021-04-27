-- drop database gestao_financeira;
create database gestao_financeira;
use gestao_financeira;


create table users(
	id int(11) AUTO_INCREMENT primary key,
	name varchar(100) not null,			-- Nome do usuario
	email varchar(100) not null,		-- Email do usuario
	password varchar(100) not null,		-- Senha do usuario
	activation_code varchar(4),			-- Codigo de ativação da conta / Recuperação de Senha
	state char default 'P',				-- [A] Ativo / [P] Pendente / [D] Desativado (a) / [E] Excluido (a)
	update_at datetime on update current_timestamp,
	created_at datetime default current_timestamp
) 
engine = INNODB 
default charset = utf8;


create table categories (
	id int(11) AUTO_INCREMENT primary key,
	nome varchar(100) not null,		-- Nome da Categoria ( Obrigatorio )
	state char default 'A',			-- [A] Ativo / [D] Desativado (a) / [E] Excluido (a)
	type char not null,				-- [E] Despesas / [R] Receitas
	user_id int(11) not null, 		-- Referencia ao usuario que criou a categoria
	update_at datetime on update current_timestamp,
	created_at datetime default current_timestamp,
	FOREIGN KEY (user_id) REFERENCES users(id)
) 
engine = INNODB 
default charset = utf8;


create table expenses_recipes (
	id int AUTO_INCREMENT primary key,
	description varchar(150) not null,	-- Descrição da despesa/receita
	value decimal(15, 2) not null,		-- Valor da despesa/receita
	is_fixed boolean not null,
	due_date date not null,				-- Data de Vencimento ou Data de Recebimento
	type char not null,					-- [E] Despesas / [R] Receitas
	state char default 'A',				-- [A] Ativo / [D] Desativado (a) / [E] Excluido (a)
	user_id int(11) not null,			-- Referencia ao usuario que criou a despesa/receita
	category_id int(11) not null,		-- Referencia a categoria dessa despesa/receita
	update_at datetime on update current_timestamp,
	created_at datetime default current_timestamp,
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (category_id) REFERENCES categories(id)
)
engine = INNODB 
default charset = utf8;
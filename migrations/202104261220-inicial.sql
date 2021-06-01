-- drop database gestao_financeira;
create database gestao_financeira;
use gestao_financeira;

create table users (
    id int AUTO_INCREMENT primary key,
    name varchar(100) not null,                     -- Nome do usuario
    email varchar(100) not null,                    -- Email do usuario
    password varchar(100) not null,                 -- Senha do usuario
    activation_code varchar(4),                     -- Codigo de ativação da conta / Recuperação de Senha
    state char default 'P',                         -- [A] Ativo / [P] Pendente / [D] Desativado (a) / [E] Excluido (a)
    update_at datetime on update current_timestamp,
    created_at datetime default current_timestamp
) 
engine = INNODB 
default charset = UTF8MB4;

create table categories (
    id int AUTO_INCREMENT primary key,
    user_id int not null,                           -- Referencia ao usuário que criou a categoria
    name varchar(100) not null,                     -- Nome da Categoria ( Obrigatorio )
    enabled boolean default 1 not null,             -- 1 = True = Enabled / 0 = False = Disabled
    type char not null,                             -- [E] Despesas / [R] Receitas
    update_at datetime on update current_timestamp,
    created_at datetime default current_timestamp,
    FOREIGN KEY (user_id) REFERENCES users(id)
) 
engine = INNODB 
default charset = UTF8MB4;

create table transactions (
    id int AUTO_INCREMENT primary key,
    user_id int not null,                           -- Referencia ao usuário que criou a transação
    category_id int not null,                       -- Referencia à categoria dessa transação
    description varchar(150) not null,              -- Descrição da transação
    value decimal(15, 2) not null,                  -- Valor da transação
    is_fixed boolean not null,
    due_date date not null,                         -- Data de Vencimento ou Data de Recebimento
    type char not null,                             -- Tipo da transação: [E] Expense (Despesas) / [R] Revenue (Receitas)
    state char default 'A',                         -- [A] Ativo / [D] Desativado (a) / [E] Excluido (a)
    update_at datetime on update current_timestamp,
    created_at datetime default current_timestamp,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
)
engine = INNODB 
default charset = UTF8MB4;

show databases;

create database concessionaria;

use concessionaria;

create table tb_veiculo (
 id_veiculo int primary key auto_increment,
 ds_cor varchar(45),
 nr_ano_modelo int,
 nr_renavam int,
 ds_disponibilidade varchar(45),
 vl_preco decimal (10, 2),
 ds_tipo varchar (45),
 bt_reparo bool,
 dt_cadastro datetime
);

show tables;
create table tb_moto (
id_moto int primary key auto_increment,
id_veiculo int,
foreign key (id_veiculo) references tb_veiculo (id_veiculo)
);

create table tb_carro (
id_carro int primary key auto_increment,
id_veiculo int,
nr_portas int, 
nr_assentos int,
foreign key (id_veiculo) references tb_veiculo (id_veiculo)
);

create table tb_estoque (
id_estoque int primary key auto_increment,
id_moto int, 
id_carro int,
nr_qtd int,
foreign key (id_carro) references tb_carro (id_carro),
foreign key (id_moto) references tb_moto (id_moto)
);

create table tb_usuario (
id_usuario int primary key auto_increment,
nm_usuario_completo varchar(75),
nm_usuario_apelido varchar (45),
ds_email varchar(100),
ds_cargo varchar (45),
dt_nascimento datetime,
ds_senha varchar (45),
ds_RG varchar (45)
);


create table tb_cliente (
id_cliente int primary key auto_increment,
nm_cliente varchar (100),
ds_rg varchar (45),
ds_cpf varchar (45),
dt_nascimento datetime
);

create table tb_pedido (
id_pedido int primary key auto_increment,
id_usuario int,
id_cliente int, 
nr_nota_fiscal int, 
vl_total decimal (10, 2),
ds_pagamento varchar(45),
bt_retirado bool,
foreign key (id_usuario) references tb_usuario (id_usuario),
foreign key (id_cliente) references tb_cliente (id_cliente)
);


create table tb_pedido_item (
id_pedido_item int primary key auto_increment,
id_carro int, 
id_moto int,
id_pedido int,
ds_airbag varchar(45),
ds_midia varchar(45),
ds_vidro_eletrico varchar (45),
ds_seguro varchar(45),
nr_garantia int,
foreign key (id_carro) references tb_carro (id_carro),
foreign key (id_moto) references tb_moto (id_moto),
foreign key (id_pedido) references tb_pedido (id_pedido)
);

show tables;







-- crud da tabela tb_cliente

insert into tb_cliente (nm_cliente, ds_rg, ds_cpf, dt_nascimento)
values ('Sthefany Silva', '56.765.456-9', '74654934-97', '2020-09-30');

insert into tb_cliente (nm_cliente, ds_rg, ds_cpf, dt_nascimento)
values ('Luciene Sousa', '56.666.666-7', '7235727-97', '2000-03-12');

select * from tb_cliente;

update tb_usuario
set ds_nascimento = '2004-09-30'
where id_usuario = 1;

delete from tb_cliente
where id_cliente = 1;



-- crud da tabela tb_usuario

insert into tb_usuario (nm_usuario_completo, nm_usuario_apelido, ds_email, 
                                 ds_cargo, dt_nascimento, ds_senha, ds_rg)
values ('Alex Filho', 'Ale', 'alexandre@gmail.com', 'gerente', '1990-05-09',
                                                'ale123', '65.438.765-6');

insert into tb_usuario (nm_usuario_completo, nm_usuario_apelido, ds_email, 
                                 ds_cargo, dt_nascimento, ds_senha, ds_rg)
values ('Gustavo Ferreira', 'Gustavo', 'guferreira@hotmail.com', 'vendedor', 
                                    '1998-05-09', 'guxtavo', '65.777.777-6');

select * from tb_usuario;

update tb_usuario
set ds_email = 'ferreira@hotmail.com'
where id_usuario = 2;

delete from tb_usuario 
where id_usuario = 2;




-- crud da tabela tb_veiculo

insert into tb_veiculo(ds_cor, nr_ano_modelo, nr_renavam, ds_disponibilidade, 
                                   vl_preco, ds_tipo, bt_reparo, dt_cadastro)
values ('vermelho', 2017, 847343764, 'patio: 4', 274673, 'conversivel', false, 
                                                          '2020-06-12');

insert into tb_veiculo(ds_cor, nr_ano_modelo, nr_renavam, ds_disponibilidade, 
                                       vl_preco, ds_tipo, bt_reparo, dt_cadastro)
values ('preto', 2015, 847343764, 'patio: 1', 544532,'esportivo', true, 
                                                          '2020-04-12');

select * from tb_veiculo;

update tb_veiculo
set ds_cor = 'vermelho'
where id_veiculo = 1;

delete from tb_veiculo 
where id_veiculo = 1;





-- crud da tabela tb_carro
select * from tb_carro;

insert into tb_carro (id_veiculo, nr_portas, nr_assentos)
values (3, 4, 4);

update tb_carro 
set nr_portas = 2
where id_carro = 2;

delete from tb_carro
where id_carro = 2;


-- crud da tabela tb_moto

select * from tb_moto;

insert into tb_moto (id_veiculo)
values (2);

update tb_moto
set id_veiculo = 3
where id_moto = 1;

delete from tb_moto 
where id_moto = 1;




-- crud da tabela tb_estoque

select * from tb_estoque;

insert into tb_estoque (id_moto, nr_qtd)
value(2, 2);

insert into tb_estoque (id_carro, nr_qtd)
values (3, 4);

update tb_estoque
set nr_qtd = 3
where id_estoque = 2;





-- crud da tabela pedido

select * from tb_pedido;

insert into tb_pedido (id_usuario, id_cliente, nr_nota_fiscal, vl_total, 
                                              ds_pagamento, bt_retirado)
values (1, 2, 7236423, 566336, 'financiadora', false);

update tb_pedido 
set bt_retirado = 1
where id = 1;

delete from tb_pedido
where id_pedido = 1;



-- crud da tabela pedido_item

select * from tb_pedido_item;

insert into tb_pedido_item (id_carro, id_pedido, ds_airbag, ds_midia, 
                                              ds_seguro, nr_garantia)
values (3, 2, 'completo', 'radio', 'basic', 12);

update tb_pedido_item
set nr_garantia = 18
where id_pedido_item = 1;

delete from tb_pedido_item
where id_pedido_item = 1;

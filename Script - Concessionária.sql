
-- criação de todas as tabelas, DDL
create database concessionaria;
use concessionaria;

create table tb_veiculo (
 id_veiculo int primary key auto_increment,
 ds_cor varchar(45),
 nr_ano_modelo int,
 ds_disponibilidade varchar(45),
 vl_preco decimal (10, 2),
 bt_reparo bool,
 dt_cadastro datetime
);


create table tb_moto (
id_moto int primary key auto_increment,
id_veiculo int,
nm_moto varchar (50),
ds_tipo varchar (75),
nr_renavam int,
foreign key (id_veiculo) references tb_veiculo (id_veiculo)
);

create table tb_carro (
id_carro int primary key auto_increment,
id_veiculo int,
nm_carro varchar(50),
nr_portas int, 
nr_assentos int,
ds_tipo varchar (75),
nr_renavam int,
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
dt_pedido datetime,
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

-- CRUD de todas as tabelas, DML

-- create, update e delete tb_cliente
 
insert into tb_cliente (nm_cliente, ds_rg, ds_cpf, dt_nascimento)
values ('Sthefany Silva', '56.765.456-9', '743.654.934-97', '2020-09-30');

insert into tb_cliente (nm_cliente, ds_rg, ds_cpf, dt_nascimento)
values ('Luciene Sousa', '56.666.666-7', '722.235.727-97', '2000-03-12');

insert into tb_cliente (nm_cliente, ds_rg, ds_cpf, dt_nascimento)
values ('Alexa Oliveira', '22.333.333-3', '999.999.999-99', '2003-05-04');

update tb_usuario
set dt_nascimento = '2004-09-30'
where id_usuario = 1;

delete from tb_cliente
where id_cliente = 1;


-- create, update e delete tb_usuario
insert into tb_usuario (nm_usuario_completo, nm_usuario_apelido, ds_email, 
                                 ds_cargo, dt_nascimento, ds_senha, ds_rg)
values ('Alex Filho', 'Ale', 'alexandre@gmail.com', 'gerente', '1990-05-09',
                                                'ale123', '65.438.765-6');

insert into tb_usuario (nm_usuario_completo, nm_usuario_apelido, ds_email, 
                                 ds_cargo, dt_nascimento, ds_senha, ds_rg)
values ('Gustavo Ferreira', 'Gustavo', 'guferreira@hotmail.com', 'vendedor', 
                                    '1998-05-09', 'guxtavo', '65.777.777-6');

insert into tb_usuario (nm_usuario_completo, nm_usuario_apelido, ds_email, 
                                 ds_cargo, dt_nascimento, ds_senha, ds_rg)
values ('Sandra Garcia', 'Sandrinha', 'sandrah@gmail.com', 'vendedora', 
                                 '2003-09-08', 'sandraa', '99.999.999-9');

update tb_usuario
set ds_email = 'ferreira@hotmail.com'
where id_usuario = 2;

delete from tb_usuario 
where id_usuario = 1;


-- create, update e delete tb_veiculo
insert into tb_veiculo(ds_cor, nr_ano_modelo, ds_disponibilidade, 
                                   vl_preco, bt_reparo, dt_cadastro)
values ('vermelho', 2017, 'patio: 4', 274673, false, '2020-06-12');

insert into tb_veiculo(ds_cor, nr_ano_modelo, ds_disponibilidade, 
                                       vl_preco, bt_reparo, dt_cadastro)
values ('preto', 2015, 'patio: 1', 544532, true, '2020-04-12');

insert into tb_veiculo(ds_cor, nr_ano_modelo, ds_disponibilidade, 
                                       vl_preco, bt_reparo, dt_cadastro)
values ('amarelo', 2020, 'encomenda: 3', 734365, false, '2008-11-27');

update tb_veiculo
set ds_cor = 'vermelho'
where id_veiculo = 1;

delete from tb_veiculo 
where id_veiculo = 1;



-- create, update e delete tb_carro

insert into tb_carro (id_veiculo,nm_carro,  nr_portas, nr_assentos, ds_tipo, nr_renavam)
values (3,'Civic',  4, 4, 'conversível', 4385647);

insert into tb_carro ( id_veiculo,nm_carro, nr_portas, nr_assentos, ds_tipo, nr_renavam)
values (2, 'CR-V', 2, 4, 'esportivo', 34756438);

insert into tb_carro (id_veiculo, nm_carro, nr_portas, nr_assentos, ds_tipo, nr_renavam)
values (3,'Accord',  4, 4, 'esportivo', 7348734);

update tb_carro 
set nr_portas = 2
where id_carro = 1;

delete from tb_carro
where id_carro = 3;
select * from tb_carro;


-- create, update e delete tb_moto
insert into tb_moto (id_veiculo, nm_moto, ds_tipo, nr_renavam)
values (2, 'Pop', 'Naked', 843653428);

insert into tb_moto (id_veiculo, nm_moto, ds_tipo, nr_renavam)
values (3, 'Biz','Street', 7364764); 

insert into tb_moto (id_veiculo, nm_moto, ds_tipo, nr_renavam)
values (2, 'CG', 'Naked', 7346543);

update tb_moto
set id_veiculo = 3
where id_moto = 1;

delete from tb_moto 
where id_moto = 1;


-- create, update e delete tb_estoque
insert into tb_estoque (id_moto, nr_qtd)
value(3, 7);

insert into tb_estoque (id_moto, nr_qtd)
value(2, 5);

insert into tb_estoque (id_carro, nr_qtd)
values (2, 1);

insert into tb_estoque (id_carro, nr_qtd)
values (1, 3);

insert into tb_estoque (id_carro, nr_qtd)
values (3, 2);

update tb_estoque
set nr_qtd = 3
where id_estoque = 2;

delete from tb_estoque
where id_carro = 5;




-- create, update e delete tb_pedido
insert into tb_pedido (id_usuario, id_cliente, nr_nota_fiscal, vl_total, 
								    ds_pagamento, bt_retirado, dt_pedido)
values (2, 3, 7236423, 566336, 'financiadora', false, '2020-06-07');

insert into tb_pedido (id_usuario, id_cliente, nr_nota_fiscal, vl_total, 
									ds_pagamento, bt_retirado, dt_pedido)
values (3, 2, 72364287, 938764, 'dinheiro, financiadora', true, '2020-06-01');

update tb_pedido 
set bt_retirado = 1
where id_pedido = 1;

delete from tb_pedido
where id_pedido = 1;


-- create, update e delete tb_pedido_item
insert into tb_pedido_item (id_carro, id_pedido, ds_airbag, ds_midia, 
                                              ds_seguro, nr_garantia)
values (2, 2, 'completo', 'radio', 'basic', 12);

insert into tb_pedido_item (id_carro, id_pedido, ds_midia, 
                                              ds_seguro, nr_garantia)
values (1, 2, 'premium', 'basic', 18);

insert into tb_pedido_item (id_moto, id_pedido, ds_midia, 
                                              ds_seguro, nr_garantia)
values (3, 1, 'completa', 'premium', 12);

update tb_pedido_item
set nr_garantia = 18
where id_pedido_item = 1;

delete from tb_pedido_item
where id_pedido_item = 1;



-- read nas tabelas tb_pedido, tb_cliente, tb_usuario
select u.nm_usuario_completo `Nome usuário`,
	   c.nm_cliente `Nome cliente`,
       p.dt_pedido `Data pedido`,
       p.nr_nota_fiscal `Nota fiscal`,
       p.vl_total `Total`
from tb_pedido p
inner join tb_cliente c
on p.id_cliente = c.id_cliente
inner join tb_usuario u
on u.id_usuario = p.id_usuario;

-- read em tb_pedido_item
select count(id_pedido) as `Itens pedidos`
from tb_pedido_item
where id_pedido = 2; 

-- read em tb_veiculo e tb_carro
select c.nm_carro `carro`, 
       v.vl_preco `valor`
from tb_veiculo v
right join tb_carro c
on c.id_veiculo = v.id_veiculo;

-- read em tb_veiculo e tb_moto
select m.nm_moto `moto`, 
       v.vl_preco `valor`
from tb_veiculo v
right join tb_moto m
on m.id_veiculo = v.id_veiculo;


-- read em tb_estoque
select sum(nr_qtd) `itens no estoque` 
from tb_estoque;



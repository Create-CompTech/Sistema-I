create database cabeleireiro;
use cabeleireiro;



create table tb_endereco (
id_endereco int primary key auto_increment,
ds_cep varchar (45),
ds_complemento varchar (45),
nr_casa int,
ds_cidade varchar (45),
ds_estado varchar (45)
);

create table tb_cortes(
id_cortes int primary key auto_increment,
tb_cortes_com_tesoura varchar (45),
tb_cortes_maquina varchar (45),
tb_cortes_navalha varchar (45)
);

create table tb_ferramentas(
id_ferramentas int primary key auto_increment,
tb_ferramentas varchar (45)
);


create table tb_usuario (
id_usuario int primary key auto_increment,
id_endereco int,
nm_usuario varchar (45),
ds_senha varchar (45),
dt_nasc datetime,
bt_gerente bool,
vl_salario decimal,
ds_cpf varchar (45),
ds_genero varchar (45),
nm_cargo varchar (45),
tp_turno varchar (45),
bt_alergia_produtos bool,
foreign key (id_endereco) references tb_endereco (id_endereco)
);





create table tb_cliente(
id_cliente int primary key auto_increment,
id_endereco int,
nm_cliente varchar (45),
dt_nasc datetime,
ds_cpf varchar (45),
ds_genero varchar (45),
vl_cel int,
bt_vip bool,
bt_alergia_formol bool,
foreign key (id_endereco) references tb_endereco (id_endereco)
);



create table tb_estoque (
id_estoque int primary key auto_increment,
id_cortes int,
id_tinturas int,
id_ferramentas int,
tb_tintas_com_formol varchar(45),
tb_tintas_sem_formol varchar (45),
tb_tesouras_esterilizadas varchar (45),
tb_navalhas_esterilizadas varchar (45),
tb_bateria_maquina_cab varchar (45),
tb_pentes varchar (45),
foreign key (id_cortes) references tb_cortes (id_cortes),
foreign key (id_ferramentas) references tb_ferramentas (id_ferramentas),
foreign key (id_tinturas) references tb_tintura (id_tinturas)
);



create table tb_pedido (
id_pedido int primary key auto_increment,
id_cliente int,
id_usuario int,
nr_nota_fiscal int,
vl_total decimal (10,2),
foreign key (id_cliente) references tb_cliente (id_cliente),
foreign key (id_usuario) references tb_usuario (id_usuario)
);



create table tb_pedido_cab (
id_pedido_cab int primary key auto_increment,
id_tinturas int,
id_cortes int,
id_pedido int,
foreign key (id_tinturas) references tb_tintura (id_tinturas),
foreign key (id_cortes) references tb_cortes (id_cortes),
foreign key (id_pedido) references tb_pedido (id_pedido)
);

create table tb_tintura(
id_tinturas int primary key auto_increment,
tb_tintas_morenas varchar (45),
tb_tintas_loiras varchar (45),
tb_tintas_ruivas varchar (45),
tb_tintas_coloridas varchar (45),
tb_tintas_com_formol varchar (45)
);

show tables;









   -- crud da tabela tb_cliente 
   
   insert into tb_cliente (nm_cliente, dt_nasc, ds_cpf, ds_genero, vl_cel, bt_vip, bt_alergia_formol)
   values ('alice assis', '2001-06-22','11122233345', 'feminino', '119568423', true, true);
   
   insert into tb_cliente (nm_cliente, dt_nasc, ds_cpf, ds_genero, vl_cel, bt_vip, bt_alergia_formol)
     values ('gabriel moraes', '2001-06-07','22233344456', 'masculino', '1123456789', true, false);
     
     select * from tb_cliente;
     
     update tb_usuario
     set dt_nasc = '2001-05-26'
     where id_usuario= 1;
     
     delete from tb_cliente 
     where id_cliente =1;
     
     
     
     
     -- crud da tabela tb_usuario
     
     insert into tb_usuario (nm_usuario,ds_senha,dt_nasc,bt_gerente,vl_salario,ds_cpf,ds_genero,nm_cargo,tp_turno,bt_alergia_produtos)
	values ( 'gabriel', 'eu+amo+a+alice','2020-06-07', true, 80.55,'1112223333', 'masculino', 'gerente','noturno',true);

     insert into tb_usuario (nm_usuario,ds_senha,dt_nasc,bt_gerente,vl_salario,ds_cpf,ds_genero,nm_cargo,tp_turno,bt_alergia_produtos)
	values ( 'alice', 'quero+emprego','2020-06-22', true, 8.55,'1112223333', 'femino', 'gerente','noturno',true);

select* from tb_usuario;
update tb_usuario
     set dt_nasc = '2001-05-26'
     where id_usuario= 1;
     
       delete from tb_usuario
     where id_usuario =1;
	
     
     
     -- crud da tabela tb_endereco 
     insert into tb_endereco ( ds_cep, ds_complemento,nr_casa,ds_cidade, ds_estado)
     values ('04845110','casa','236','são paulo','SP');
     
select* from tb_endereco;
update tb_endereco
     set ds_cidade= 'indaiatuba'
     where id_endereco= 1;
     
     delete from tb_endereco
     where id_endereco= 1;
     
     
     
     insert into tb_cortes (tb_cortes_com_tesoura, tb_cortes_maquina, tb_cortes_navalha)
     values ('usar tesouras','usar maquina de cortar cabelo','usar navalha');
     
	select* from tb_cortes;
update tb_cortes
     set tb_cortes_navalha = 'sim'
     where id_cortes= 1;
     
     delete from tb_cortes
     where id_cortes= 1;
     
 -- crud da tabela tb_ferramentas
 
   insert into tb_ferramentas (tb_ferramentas)
     values ('tesouras,navalhas, maquinas');
     
	select* from tb_ferramentas;
update tb_ferramentas
     set tb_ferramentas = 'maquina'
     where id_ferramentas= 0;
     
     delete from tb_ferramentas
     where id_ferramentas= 0;
     
     
      -- crud da tabela tb_tintura
 
   insert into tb_tintura (tb_tintas_morenas, tb_tintas_loiras,tb_tintas_ruivas,tb_tintas_coloridas,tb_tintas_com_formol)
     values ('preto','dourado','marsala','rosa','com formol');
     
	select* from tb_tintura;
update tb_tintura
     set tb_tintura= 'preto'
     where id_tinturas= 1;
     
     delete from tb_tintura
     where id_tinturas= 1;
     
     
     -- crud da tabela tb_pedido 
     insert into tb_pedido (nr_nota_fiscal,vl_total)
     values (1234567, 78.5);
     
     select* from tb_pedido;
update tb_pedido
     set tb_pedido= '85.5'
     where id_pedido= 1;
     
     
     delete from tb_pedido
     where id_pedido= 1;
     
     -- crud da tabela tb_estoque 
     insert into tb_estoque(tb_tintas_com_formol,tb_tintas_sem_formol,tb_tesouras_esterilizadas, 
                                           tb_navalhas_esterilizadas,tb_bateria_maquina_cab,tb_pentes)
     values ('disponivel','disponivel','esterilizadas','esterilizadas','disponivel','disponivel');
     
      select* from tb_estoque;
 update tb_estoque
     set tb_pentes= 'tem'
     where id_estoque= '1';
     
     
     delete from tb_estoque
     where id_estoque= 0;
     
     
      -- crud da tabela tb_pedido_cab
     insert into tb_pedido_cab (id_cortes,id_pedido, id_tinturas )
     values ('5','8','10');
  
        select* from tb_pedido_cab;
 update tb_pedido_cab
     set id_pedido = 'sim'
     where id_pedido= '1';
     
     insert into tb_cortes (tb_cortes_com_tesoura, tb_cortes_maquina, tb_cortes_navalha)
     values ('usar tesouras','usar maquina de cortar cabelo','usar navalha');
     insert into tb_pedido (nr_nota_fiscal,vl_total)
     values (1234567, 78.5);
     insert into tb_tintura (tb_tintas_morenas, tb_tintas_loiras,tb_tintas_ruivas,tb_tintas_coloridas,tb_tintas_com_formol)
     values ('preto','dourado','marsala','rosa','com formol');
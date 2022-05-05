create database db_generation_game_online;
use db_generation_game_online;

create table tb_personagens(
id_personagem bigint auto_increment,
Ataque varchar (6),
Defesa varchar (6),
Armadura varchar (6),
Poder varchar (6),
primary key (id_personagem),
id_classes bigint,
Foreign Key (id_classes) references tb_classes(id_classes)
);

create table tb_classes(
id_classes bigint auto_increment,
suporte boolean,
assalto boolean,
medico boolean,
batedor boolean,

primary key (id_classes)
);

insert into tb_classes (suporte, assalto, medico, batedor)
values
(true, false, false, false),
(false, true, false, false),
(false, false, true, false),
(false, false, false, true);

insert into tb_personagens(Ataque, Defesa, Armadura, Poder, id_classes)
values
(96, 54, 63, 50 , 1),
(75, 73, 42, 13 , 1),
(42, 73, 48, 14 , 2),
(12, 82, 69, 56 , 2),
(64, 93, 83, 60 , 3),
(83, 71, 20, 70 , 3),
(42, 82, 40, 80 , 4),
(37, 60, 90, 96 , 4);

select * from tb_personagens where ataque > 20;
select * from tb_personagens where defesa > 10 and defesa < 20;
select * from tb_classes where suporte or batedor or medico or assalto like '%c%';
select * from tb_classes
inner join tb_personagens on tb_personagens.id_classes = tb_classes.id_classes;
select * from tb_classes
inner join tb_personagens on tb_personagens.id_classes = tb_classes.id_classes
where suporte = 'true';

create database db_pizzaria_legal;
use db_pizzaria_legal;
create table tb_pizzas (
id_pizzas bigint auto_increment,
sabor varchar (30),
borda boolean,
adicional varchar (30),
id_categoria bigint,
primary key (id_pizzas),
Foreign Key (id_categoria) references tb_categoria(id_categoria)
);

create table tb_categoria (
id_categoria bigint auto_increment,
preco decimal (5,2),
opcao varchar (50),
tamanho varchar (50),
primary key (id_categoria)
);
insert into tb_pizzas(sabor, borda, adicional, id_categoria)
values ("Queijo", true, "Tomate extra", 4),
("Calabresa", true, "Sem Oregano", 5),
("Portuguesa", true, "Queijo Extra", 4),
("Atum", true, "Sem Tomate", 5),
("Da Casa", true, "Tomate extra", 2),
("Frango com Catuby", true, "Sem Frango", 4),
("Banana com Chocolate", true, "Sem banana", 2),
("Romeu e Julieta", true, "Sem goiabada", 1);

insert into tb_categoria (preco, opcao, tamanho)
values
(19.99, "Vegetariano", "Medio"),
(22.99, "Vegana", "Grande"),
(29.99, "Doce", "pequena"),
(36.99, "Normal", "Media"),
(69.99, "Normal", "Grande");
select * from tb_categoria where preco > 45.00;
select * from tb_categoria where preco > 50.00 and preco < 100;
select * from tb_pizzas where sabor like'%M%';
select * from tb_categoria
inner join tb_pizzas on tb_pizzas.id_categoria = tb_categoria.id_categoria;
select * from tb_categoria
inner join tb_pizzas on tb_pizzas.id_categoria = tb_categoria.id_categoria
where opcao = "Vegana";

create database db_farmacia_bem_estar;
use db_farmacia_bem_estar;

create table tb_categoria (
id bigint auto_increment,
usoOral boolean,
usoInjetavel boolean,
primary key (id)
);

select * from tb_categoria;

create table tb_produtos (
id bigint auto_increment,
preco varchar (30),
validade varchar (50),
cor varchar (60),
Generico boolean,
primary key (id),
id_class bigint,
Foreign Key (id_class) references tb_categoria(id)
);

select * from tb_produtos;

insert into tb_categoria (usoOral, usoInjetavel)
values (true, false),
(false, true),
(true, false),
(false, true),
(false, true),
(true, false);
insert into tb_produtos (preco, validade, cor, Generico, id_class)
values

("12.56", "25/06/2022", "amarelo", true, 1),
("56.85", "24/05/2022", "amarelo", true, 1),
("18.46", "18/09/2023", "rosa", true, 2),
("86.42", "17/08/2022", "marron", false, 2),
("74.62", "30/04/2023", "amarelo", true, 3),
("74.16", "04/11/2022", "verde", false, 3),
("16.47", "12/10/2023", "vermelho", false, 4),
("96.42", "26/07/2022", "amarelo", true, 4);

select * from tb_produtos where preco > 50;
select * from tb_produtos where preco > 5 and preco < 60;
select * from tb_produtos where cor like '%C%';
select * from tb_produtos
inner join tb_categoria on tb_categoria.id = tb_produtos.id;
select * from tb_produtos
inner join tb_categoria on tb_categoria.id = tb_produtos.id
where cor = "Amarelo";

create database db_cidade_das_carnes;
use db_cidade_das_carnes;

create table tb_categorias(
id_categoria bigint auto_increment,
carneVermelha boolean,
carneBranca boolean,
nomeDaCarne varchar (30),
primary key (id_categoria)
);

insert into tb_categorias (carneVermelha, carneBranca, nomeDaCarne)
values
(true, false, "Picanha"),
(true, false, "Alcaltra"),
(true, false, "Linguiça"),
(true, false, "Coração"),
(false, true, "Tilapia"),
(false, true, "Saldinha");

select * from tb_categorias;

create table tb_produtos(
id_produtos bigint auto_increment,
preco decimal (5,2),
dias_validade int,
animal varchar (30),
Kilogramas decimal (5,2),
id_referencia bigint,
foreign key (id_referencia) references tb_categorias (id_categoria),
primary key (id_produtos)
);

insert into tb_produtos (preco, dias_validade, animal, Kilogramas, id_referencia)
values
(23.47, 30, "Boi", 50.00, 1),
(10.00, 30, "Boi", 30.00, 2),
(18.99, 40, "Porco", 10.00, 3),
(38.99, 40, "Frango", 40.00, 4),
(46.99, 80, "Peixe", 60.00, 5),
(16.99, 90, "Peixe", 80.00, 6),
(24.99, 40, "Frango", 10.00, 3);

select * from tb_produtos;

select * from tb_produtos where preco > 50.00;
select * from tb_produtos where preco > 50.00 and preco < 150.00;
select * from tb_categorias where nomeDaCarne like '%C%';
select * from tb_produtos
inner join tb_categorias on tb_categorias.id_categoria = tb_produtos.id_produtos;
select * from tb_produtos
inner join tb_categorias on tb_categorias.id_categoria = tb_produtos.id_produtos
where animal = "boi";

create database db_construindo_vidas;
use db_construindo_vidas;

create table tb_categorias (
id_categorias bigint auto_increment,
construcao boolean,
nome varchar (50),
primary key (id_categorias)
);

insert into tb_categoria (construcao, nome)
values
(true, "Tijolo"),
(true, "Pia"),
(true, "Furadeira"),
(false, "Roda"),
(false, "Secadora");

create table tb_produtos  (
id_produtos bigint auto_increment,
preco decimal (5,2),
corProduto varchar (20),
Setor varchar (20),
desconto decimal (5,2),
id_referencia bigint,
foreign key (id_referencia) references tb_categorias (id_categorias),
primary Key (id_produtos)
);

insert into tb_produtos (preco, corProduto, Setor, desconto, id_referencia)
values
(80.99, "")

create database db_construindo_vidas;
use db_construindo_vidas;

create table tb_categorias (
id_categorias bigint auto_increment,
construcao boolean,
nome varchar (50),
primary key (id_categorias)
);

insert into tb_categorias (construcao, nome)
values
(true, "Tijolo"),
(true, "Pia"),
(true, "Furadeira"),
(false, "Roda"),
(false, "Secadora");

create table tb_produtos  (
id_produtos bigint auto_increment,
preco decimal (5,2),
corProduto varchar (20),
Setor varchar (20),
desconto decimal (5,2),
id_referencia bigint,
foreign key (id_referencia) references tb_categorias (id_categorias),
primary Key (id_produtos)
);

insert into tb_produtos (preco, corProduto, Setor, desconto, id_referencia)
values
(80.99, "Preto", "Cozinha", 2.88, 2),
(93.99, "Amarelo", "Quarto", 3.69, 1),
(120.99, "Roxo", "Banheiro", 7.86, 1),
(99.99, "Rosa", "Sem definição", 7.85, 1),
(86.99, "Vermelho", "Sem definição", 11.99, 5),
(23.99, "Verde", "Quarto", 0.00, 3),
(46.99, "Prata", "Sala", 0.00, 2),
(73.96, "Branco", "Sala", 17.68, 2);

select * from tb_produtos where preco > 100;
select * from tb_produtos where preco > 70 and preco < 150;
select * from tb_categorias where nome like '%C%';
select * from tb_produtos
INNER JOIN tb_categorias on tb_categorias.id_categorias = tb_produtos.id_produtos;
select * from tb_produtos
INNER JOIN tb_categorias on tb_categorias.id_categorias = tb_produtos.id_produtos
where Setor = "Cozinha";

create database db_curso_da_minha_vida;
use db_curso_da_minha_vida;

create table tb_categorias (
id_categorias bigint auto_increment,
curso varchar (30),
pago decimal (5,2),
bolsa boolean,
primary key (id_categorias)
);

insert into tb_categorias (curso,pago,bolsa)
values ("Java", "0.00", true),
("Java", "150.00", false),
("Costura", "0.00", true),
("Costura", "100.00", false),
("ConsertoDeCelular", "0.00", true),
("ConsertoDeCelular", "200.00", false);

create table tb_cursos  (
id_cursos bigint auto_increment,
estudante varchar (80),
idade int,
cpf varchar (12),
id_referencia bigint,
primary key (id_cursos),
foreign key  (id_referencia) references tb_categorias (id_categorias)
);

insert into tb_cursos (estudante,idade,cpf)
values ("Maiar", 19, "46737846-96"),
("Maicon", 24, "846375849-76"),
("Fernando", 74, "567826934-97"),
("Israel", 42, "71482159-96"),
("Cleison", 81, "32468122-96"),
("Roberto", 18, "852852641-96");

select * from tb_categorias where pago > 500;
select * from tb_categorias where pago > 600 and pago < 1500;
select * from tb_categorias where curso like '%J%';
select * from tb_categorias
inner join tb_cursos on tb_cursos.id_cursos = tb_categorias.id_categorias;
select * from tb_categorias
inner join tb_cursos on tb_cursos.id_cursos = tb_categorias.id_categorias
where bolsa = false;
CREATE DATABASE db_recursos_humanos;
USE db_recursos_humanos;

CREATE TABLE tb_dados_dos_colaboradores (
id BIGINT AUTO_INCREMENT,
nome VARCHAR (255),
idade INT,
endereco VARCHAR (255),
cpf VARCHAR (255),
PRIMARY KEY (id)
);
SELECT * FROM tb_dados_dos_colaboradores;
INSERT INTO tb_dados_dos_colaboradores (nome, idade, endereco, cpf)
VALUES
("Maiar Lindo", 18, "Av. Sapopemba", "467859624-46"),
("Maiar Gostoso", 19, "Rua Bela Cintra", "582642814-96"),
("Maicon", 65, "Rua liberdade", "854692375-86"),
("Fernando", 58, "Rua independe", "456327814-85"),
("Israel", 67, "Rua Corithians", "478621594-96");
SELECT * FROM tb_dados_dos_colaboradores;

CREATE DATABASE db_recursos_humanos;
USE db_recursos_humanos;

CREATE TABLE tb_dados_dos_colaboradores (
id BIGINT AUTO_INCREMENT,
nome VARCHAR (255),
idade INT,
endereco VARCHAR (255),
cpf VARCHAR (255),
salario FLOAT (9,2),
PRIMARY KEY (id)
);
SELECT * FROM tb_dados_dos_colaboradores;

INSERT INTO tb_dados_dos_colaboradores (nome, idade, endereco, cpf, salario)
VALUES
("Maiar Lindo", 18, "Av. Sapopemba", "467859624-46", 1526.35),
("Maiar Gostoso", 19, "Rua Bela Cintra", "582642814-96", 2563.45),
("Maicon", 65, "Rua liberdade", "854692375-86", 2136.95),
("Fernando", 58, "Rua independe", "456327814-85", 1684.63),
("Israel", 67, "Rua Corithians", "478621594-96", 8523.41);

SELECT * FROM tb_dados_dos_colaboradores;

SELECT nome, salario FROM tb_dados_dos_colaboradores where salario > 2000;
SELECT nome, salario FROM tb_dados_dos_colaboradores where salario < 2000;
UPDATE tb_dados_dos_colaboradores SET cpf = "452186349-95" WHERE id = 3;
SELECT * FROM tb_dados_dos_colaboradores;

CREATE DATABASE db_ecommerce;
USE db_ecommerce;

CREATE TABLE tb_vendas (
id BIGINT AUTO_INCREMENT,
nome VARCHAR (255),
produto VARCHAR (255),
valor DOUBLE,
valorFrete DOUBLE,
idadeDoComprador INT,
endereco VARCHAR (255),
tempoDeEntrega DOUBLE,

PRIMARY KEY (id)
);

SELECT * FROM tb_vendas;

INSERT INTO tb_vendas (nome, produto,valor, valorFrete, idadeDoComprador, endereco, tempoDeEntrega)
VALUES
("Maiar","Fone",150.63,20.74,19,"Av Sapopemba",4),
("Fernando","Celular", 1500, 200,65,"Rua bela cintra", 8),
("Macon","bala", 4, 0 , 45," Rua independente", 0),
("Gustavo","Xbox", 7500,500.45, 26,"Rua casa das primas", 9),
("Douglas"," PlayStation 4", 9624.45, 456.45, 39,"Rua dos parças", 14),
("Manar","Fone", 563.45, 25.87, 24,"Avenida Sapopemba", 4),
("Nawar","sapato", 13, 0, 26,"Rua Glicerio", 0),
("Rajaa","Vestido", 45, 12.45, 9,"Rua Siria", 8);
SELECT * FROM tb_vendas;
SELECT nome, produto, valor FROM tb_vendas where valor > 500;
SELECT nome, produto, valor FROM tb_vendas where valor < 500;
UPDATE tb_vendas SET valor = 85.45 WHERE id = 8;

CREATE DATABASE db_escola;
USE db_escola;

CREATE TABLE tb_cadastro (
id BIGINT AUTO_INCREMENT,
nome VARCHAR (255),
turma VARCHAR (255),
nota DOUBLE,
nomeDoPai VARCHAR (255),
idade INT,
endereco VARCHAR (255),
CPF DOUBLE,

PRIMARY KEY (id)
);

SELECT * FROM tb_cadastro;

INSERT INTO tb_cadastro (nome, turma, nota, nomeDoPai, idade, endereco, CPF)
VALUES
("Maiar",  "50", 10, "Younis", 19, "Avenida Sapopemba" , 467915623-84),
("Manar",  "50", 4, "Younis",21,"Avenida Sapopemba", 58716324-95),
("Israel", "50", 6, "Cleison", 25, "Rua bela Cintra", 564213897-85),
("Nawar", "96", 7, "Younis" , 15,"Avenida Sapopemba", 485691234-58),
("Maicon", "58", 4, "Roberto",36, "Avenida Paulista", 584623489-87),
("Fernando", "62", 8, "Alberto",13, "Rua  Cristovão", 584641234-97),
("Gustavo", "84", 2, "Cristavão",14, "Rua General", 521479632-84),
("Douglas", "41", 6, "Maiar", 16, "Rua França Pinto", 584623147-98);

SELECT * FROM tb_cadastro;
SELECT nome, nota FROM tb_cadastro where nota > 7;
SELECT nome, nota FROM tb_cadastro where nota < 7;
UPDATE tb_cadastro SET nota = 8 WHERE id = 7;
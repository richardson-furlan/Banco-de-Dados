CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE tb_categorias(
id bigint AUTO_INCREMENT,
tipo varchar(200) not null,
descricao varchar(200) not null,
primary key (id)
);

CREATE TABLE tb_produtos(
id bigint AUTO_INCREMENT,
nome varchar(200) not null,
dataValidade date not null,
preco decimal(5,2) not null,
categoria_id bigint,
primary key (id),
foreign key (categoria_id) references tb_categorias(id)
);

INSERT INTO tb_categorias (tipo, descricao) 
VALUES ("Bovina", "Carne de gado"),
("Suína","Carne de porco"),
("Aves","Inclui carne de frango, peru, pato e outras aves domésticas"),
("Ovina","Carne de carneiro ou cordeiro"),
("Peixe","Inclui diversas variedades de peixes");

select * from tb_categorias;

INSERT INTO tb_produtos (nome, dataValidade, preco, categoria_id)
VALUES ("Bacon", "2024-03-07", 13.99, 2),
("Tilapia", "2024-05-08", 10.00, 5),
("Filé de sassami", "2024-07-09", 25.99, 3),
("Sardinha", "2024-02-10", 5.99, 5),
("Picanha ", "2024-04-12", 76.98, 1),
("Filé de Costela", "2024-06-11", 59.98, 1),
("Bife de Lombo", "2024-08-13", 23.99, 2),
("Espetinho de Coração", "2024-10-01", 39.98, 3),
("Carré Francês De Cordeiro Da Patagônia", "2024-07-09", 23.99, 4)
;

select * from tb_produtos;

SELECT * FROM tb_produtos WHERE preco > 50.00;

SELECT * FROM tb_produtos WHERE preco BETWEEN 50.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome LIKE "%d%";

SELECT nome, dataValidade, preco, tb_categorias.tipo as categoria
FROM tb_produtos 
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

SELECT nome, tb_categorias.tipo as categoria
FROM tb_produtos 
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_categorias.tipo = "Bovina";
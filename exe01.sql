CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classe(
id bigint AUTO_INCREMENT,
descricao VARCHAR(255) NOT NULL,
habilidade_especial VARCHAR(255) NOT NULL,
pontos_fracos VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE tb_personagens(
id bigint AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
pontos_de_ataque INT NOT NULL,
pontos_de_defesa INT NOT NULL,
hp INT NOT NULL,
classe_id BIGINT,
PRIMARY KEY (id),
Foreign Key (classe_id) REFERENCES tb_classe(id)
);

INSERT INTO tb_classe(descricao,habilidade_especial,pontos_fracos)
VALUE ("Mago Elemental","Invocação Elemental","Baixa resistência física"),
("Guerreiro Implacável","Investida Frenética","Ataques a longa distância"),
("Arqueiro Sombrio","Disparo Tóxico","Combate direto"),
("Curandeiro Divino","Bênção de Cura","Baixa resistência física e limitadas habilidades ofensivas"),
("Ladrão das Sombras","Ataque das Sombras","Baixa resistência a ataques diretos");

INSERT INTO tb_personagens (nome,pontos_de_ataque,pontos_de_defesa,hp,classe_id)
VALUE ("Lorena, a Mestra das Chamas",2830,1666,4000,1),
("Rikirito, o Espadachim das Sombras",3666,2666,5000,2),
("Serena, a Sombra Mortal",3166,1333,3666,3),
("Alden, o Curador Divino",2000,2500,6000,4),
("Zephyr, o Fantasma Rápido",2500,1000,3333,5),
("Elara, a Encantadora",3060,1500,4166,1),
("Thorin, o Sentinel",3500,2933,5333,2),
("Sylvia, a Flecha Noturna",3200,1400,3833,3);

SELECT * FROM tb_personagens WHERE pontos_de_ataque > 2000;

SELECT * FROM tb_personagens WHERE pontos_de_defesa > 1000 AND pontos_de_defesa < 2000;

SELECT * FROM tb_personagens WHERE nome LIKE "%c%";

SELECT nome, pontos_de_ataque, pontos_de_defesa, hp, tb_classe.descricao, tb_classe.habilidade_especial, tb_classe.pontos_fracos
FROM tb_personagens INNER JOIN tb_classe 
ON tb_personagens.classe_id = tb_classe.id;

SELECT nome, pontos_de_ataque, pontos_de_defesa, hp, tb_classe.descricao, tb_classe.habilidade_especial, tb_classe.pontos_fracos
FROM tb_personagens INNER JOIN tb_classe 
ON tb_personagens.classe_id = tb_classe.id
WHERE tb_classe.id = 1 ;
-- Alterando nome da tabela 'categoria' para 'categorias'
ALTER TABLE categoria RENAME TO categorias;


-- Alterando tabela 'livros' para adicionar chave estrangeira 'fk_categoria'
ALTER TABLE livros
	ADD CONSTRAINT fk_categoria FOREIGN KEY (categoria_id)
	REFERENCES categorias (id);


-- Alterando tabela 'autores_livros' para adicionar chave estrangeira 'fk_autores'
ALTER TABLE autores_livros 
	ADD CONSTRAINT fk_autores FOREIGN KEY (autor_id) 
	REFERENCES autores (id);


-- Alterando tabela 'autores_livros' para adicionar chave estrangeira 'fk_livros'
ALTER TABLE autores_livros 
	ADD CONSTRAINT fk_livros FOREIGN KEY (livros_id) 
	REFERENCES livros (id);


-- Alterando tabela 'livros' para excluir chave estrangeira 'fk_categoria'
ALTER TABLE livros DROP CONSTRAINT fk_categoria;

-- Apagando tabela 'categorias'
DROP TABLE categorias;


-- Criando novamente a tabela 'categorias'
CREATE TABLE categorias (
	id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nome VARCHAR(50) NOT NULL UNIQUE
);

-- Alterando a tabela 'livros' para adicionar a chave estrangeira 'fk_categoria' novamente
ALTER TABLE livros
	ADD CONSTRAINT fk_categoria FOREIGN KEY (categoria_id)
	REFERENCES categorias (id);


-- Inserindo dados na tabela 'categorias'
INSERT INTO categorias (nome) 
	VALUES ('Romance'), ('Fantasia'), ('Ficção'), ('Comédia') RETURNING *;


-- Inserindo dados na tabela 'editoras'
INSERT INTO editoras 
	(nome, endereco, telefone)
VALUES 
  ('Martin Claret', 'Rua Alegrete, 62 - Sumaré / São Paulo - SP 1254-010', '(67) 2600-8963'),
	('Principis', 'Rua Simplício Dias, 917 - Nossa Senhora do Carmo / São Paulo - SP 64200-055', '(67) 99770-1390'),
  ('Galera', 'Rua Colonizador Ênio Pipino, 958 - Residencial Pérola / Sinop - MT 78558-099', '(69) 2859-6853'),
  ('Intrínseca', 'Rua Caviana, 562 - Floresta Sul / Rio Branco - AC 69912-497', '(69) 99420-7385'),
  ('Rocco', 'Rua Fortaleza, 404 - Santa Isabel / Várzea Grande - MT 78150-374', '(47) 3791-2313'),
  ('HarperCollins', 'Rua 12 de Outubro, 327 - São Joaquim / Teresina - PI 64004-070', '(47) 98957-7895'),
  ('Editora Aleph', 'Beco Um, 426 - Aberta dos Morros / Porto Alegre - RS 91751-356', '(86) 3950-8740'),
  ('Editora Arqueiro','Rua das camelias, 25 - Centro / Fortaleza - CE', '(88) 8185-0259')
RETURNING *;


-- Inserindo dados na tabela 'livros'
INSERT INTO livros 
	(titulo, isbn, codigo, ano, paginas, categoria_id, editora_id)
VALUES 
	('Orgulho e Preconceito', '978-8544001820', '8544001823', 2018, 424, 1, 1),
	('Razão e sensibilidade', '978-6555520712', '655552071', 2020, 288, 1, 1),
	('Persuasão', '978-6550970277', '655097027', 2019, 240, 1, 2),
	('Todas as suas (im)perfeições', '978-8501117687', '8501117684', 2019, 304, 1, 3),
	('Para todos os garotos que já amei', '978-8580577266', '8580577268', 2015, 320, 1, 4),
	('Como eu era antes de você', '978-8580579246', '8580579244', 2016, 320, 1, 4),
	('Eragon', '9788532518484', '8532518486', 2005, 468, 2, 5),
	('Trono de vidro', '978-8501401380', '8501401382', 2013, 392, 2, 3),
	('Academia de vampiros', '978-8501401380', '6555112875', 2022, 448, 2, 6),
	('Um mistério no Caribe', '978-8595085909', '8595085900', 2020, 208, 3, 6),
	('Duna', '978-8576573135', '857657313', 2017, 680, 3, 7),
	('A hipótese do amor','9786555653304','6555653302', 2022, 336, 1,8)
RETURNING *;


-- Inserindo dados na tabela de relacionamento 'autores_livros'
INSERT INTO autores_livros
	(autor_id, livros_id)
VALUES
	(1,1),
	(1,2),
	(1,3),
	(2,4),
	(3,5),
	(4,6),
	(5,7),
	(6,8),
	(7,9),
	(8,10),
	(9,11),
    (10,12)
RETURNING *;


-- Atualizando email de uma autor
UPDATE autores 
SET email = 'ali.hazelwood@outlook.com'
WHERE id = 10
RETURNING *;


-- Excluindo um relacionamento de autor e livro
DELETE FROM autores_livros WHERE autor_id = 10 RETURNING *;

-- Excluindo um livro
DELETE FROM livros WHERE id = 12 RETURNING *;


-- Usando SELECT com várias opções
SELECT titulo, paginas, ano AS ano_lancamento
FROM livros 
WHERE ano > 2020 OR paginas <= 300
ORDER BY titulo desc;


-- Usando INNER JOIN
SELECT l.titulo AS titulo_livro, e.nome AS nome_editora FROM livros l
INNER JOIN editoras e ON l.editora_id = e.id;

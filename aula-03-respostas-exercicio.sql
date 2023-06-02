-- Inserindo novos dados
--

-- 1. Inserindo duas novas editoras:
INSERT INTO editoras 
	(nome, endereco, telefone)
VALUES 
	('Seguinte', 'Travessa Antônio Ferreira, 125 - Igrejinha / Capanema - PA 68700216', ' (58) 92587-5686'),
	('Paralela', 'Rua Frederico Moura, 37 - Cidade Nova / Franca - SP 14401150', '(52) 92035-3387');





--2. Inserindo todos os autores:
INSERT INTO autores
	(nome, email, telefone)
VALUES 
	('Rick Riordan', 'rickriordan@gmail.com', '(92) 98825-0225'),
	('J. K. Rowling', 'jkrowling@gmail.com', '(22) 98325-4585'),
	('Danielle L. Jensen', 'daniellejensen@gmail.com', '(88) 82566-8584'),
	('Shelby Mahurin', 'shelbymahurin@gmail.com', '(85) 93845-6276'),
	('Suzanne Collins', 'suzannecollins@gmail.com', '(89) 93157-8271'),
	('Taylor Jenkins Reid', 'taylorjenkins@gmail.com', '(93) 93523-5526');





-- 3. Inserindo novos livros
INSERT INTO livros
	(titulo, isbn, codigo, ano, paginas, categoria_id, editora_id, autor_id)
VALUES
	('É Assim que Acaba', '9788501112514', '8501112518', 2018, 368, 1, 3, 2),
	('É assim que começa', '9786559811397', '6559811395', 2022, 336, 1, 3, 2),
	('Percy Jackson e o ladrão de raios','9788580575392', '8580575397', 2014, 400, 3, 4, 11),
	('Harry Potter e a Pedra Filosofal','9788532523051', '8532511015', 2000, 264, 3, 5, 12),
	('Corte de espinhos e rosas', '9788501105875', '8501105872', 2015, 434, 3, 3, 6),
	('A ponte entre reinos', '9788555341953', '8555341957', 2022, 416, 3, 9, 13),
	('Pássaro e serpente', '9786555872347', '6555872349', 2021, 504, 2, 3, 14),
	('Jogos Vorazes', '9786555321449', '655532144X', 2022, 400, 3, 5, 15),
	('Amor(es) verdadeiro(s)', '9788584391677', '8584391673', 2020, 296, 1, 10, 16),
	('Malibu renasce', '9788584392162', '8584392165', 2021, 360, 1, 10, 16);





-- Realizando consultas
--

-- 1. Crie uma consulta para listar os livros ordenados por número de páginas em ordem decrescente:
SELECT * FROM livros ORDER BY paginas DESC;





-- 2. Realize uma consulta na tabela de livros, onde terá como retorno o título e página dos livros com ano de lançamento igual a 2000:
SELECT titulo, paginas FROM livros WHERE ano = 2000;





-- 3. Retorne os autores(as) cujo nome começa com a letra "A":
SELECT * FROM autores WHERE nome LIKE 'A%';





-- 4. Realize uma consulta para encontrar os livros com o maior número de páginas:
SELECT *
FROM livros
WHERE paginas = (SELECT MAX(paginas) FROM livros);





-- 5. Elabore uma consulta para listar os livros da editora Galera, mostrando apenas o título e o ano de publicação:
SELECT titulo, ano FROM livros WHERE editora_id = 3;





-- 6. Crie uma consulta para listar os livros com suas respectivas editoras:
SELECT l.titulo, e.nome AS editora
FROM livros l
JOIN editoras e ON l.editora_id = e.id;





-- 7. Realize uma consulta para retornar a contagem de livros existentes em cada categoria:
SELECT c.nome AS categoria, COUNT(*) AS total_livros
FROM livros l
JOIN categorias c ON l.categoria_id = c.id
GROUP BY c.nome;





-- 8. Realize uma consulta que retorne a média de páginas dos livros de cada editora:
SELECT e.nome AS editora, AVG(l.paginas) AS media_paginas
FROM livros l
JOIN editoras e ON l.editora_id = e.id
GROUP BY e.nome;





-- 9. Execute uma consulta para listar os livros da categoria Ficção e ordene a saída por título:
SELECT l.titulo, c.nome AS categoria
FROM livros l
JOIN categorias c ON l.categoria_id = c.id
WHERE c.nome = 'Ficção'
ORDER BY l.titulo;





-- 10. Crie uma consulta para listar os autores(as) que possuem mais de 2 livros:
SELECT a.nome, COUNT(*) AS total_livros
FROM autores a
JOIN livros l ON l.autor_id = a.id
GROUP BY a.nome
HAVING COUNT(*) > 2;

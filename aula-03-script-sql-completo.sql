DROP TABLE livros;
DROP TABLE autores;
DROP TABLE categorias;
DROP TABLE editoras;




CREATE TABLE autores (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  telefone VARCHAR(20),
  bio TEXT,
  UNIQUE (email)
);

CREATE TABLE categorias (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  UNIQUE(nome)
);

CREATE TABLE editoras (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  endereco TEXT NOT NULL,
  telefone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS livros (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  titulo VARCHAR NOT NULL,
  resumo TEXT,
  isbn VARCHAR(20) NOT NULL,
  paginas INTEGER NOT NULL,
  codigo VARCHAR(10) NOT NULL UNIQUE,
  ano INTEGER NOT NULL,
  categoria_id BIGINT NOT NULL,
  editora_id BIGINT NOT NULL,
  autor_id BIGINT NOT NULL,
  CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES categorias,
  CONSTRAINT fk_editora FOREIGN KEY (editora_id) REFERENCES editoras,
  CONSTRAINT fk_autor FOREIGN KEY (autor_id) REFERENCES autores
);




INSERT INTO autores
    (nome, email, telefone)
VALUES
	('Jane Austen', 'jane.austen@gmail.com', '(92) 3709-1345'),
    ('Colleen Hoover', 'colleen@hotmail.com', '(92) 99973-021'),
    ('Jenny Han', 'jenny.han@gmail.com', '(91) 3869-343'),
    ('Jojo Moyes', 'jojo.moyes@outlook.com', '(91) 98917-5631'),
    ('Christopher Paolini', 'Christopher.Paolini@gmail.com', '(68) 2837-1753'),
    ('Sarah J. Maas', 'sara.mass@gmail.com', '(68) 98195-3278'),
    ('Richelle Mead', 'richelle.mead@hotmail.com', '(41) 2842-2743'),
    ('Agatha Christie', 'agatha.christie@gmail.com', '(41) 98786-8124'),
    ('Frank Herbert', 'frank.herbert@outlook.com', '(68) 2762-1218'),
    ('Ali Hazelwood','ali@outlook.com', '(68) 3185-7856')
RETURNING *;

INSERT INTO categorias (nome) 
	VALUES ('Romance'), ('Fantasia'), ('Ficção'), ('Comédia')
RETURNING *;

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

INSERT INTO livros
	(titulo, isbn, codigo, ano, paginas, categoria_id, editora_id, autor_id)
VALUES 
	('Orgulho e Preconceito', '978-8544001820', '8544001823', 2018, 424, 1, 1, 1),
	('Razão e sensibilidade', '978-6555520712', '655552071', 2020, 288, 1, 1, 1),
	('Persuasão', '978-6550970277', '655097027', 2019, 240, 1, 2, 1),
	('Todas as suas (im)perfeições', '978-8501117687', '8501117684', 2019, 304, 1, 3, 2),
	('Para todos os garotos que já amei', '978-8580577266', '8580577268', 2015, 320, 1, 4, 3),
	('Como eu era antes de você', '978-8580579246', '8580579244', 2016, 320, 1, 4, 4),
	('Eragon', '9788532518484', '8532518486', 2005, 468, 2, 5, 5),
	('Trono de vidro', '978-8501401380', '8501401382', 2013, 392, 2, 3, 6),
	('Academia de vampiros', '978-8501401380', '6555112875', 2022, 448, 2, 6, 7),
	('Um mistério no Caribe', '978-8595085909', '8595085900', 2020, 208, 3, 6, 8),
	('Duna', '978-8576573135', '857657313', 2017, 680, 3, 7, 9),
	('A hipótese do amor','9786555653304','6555653302', 2022, 336, 1, 8, 10)
RETURNING *;
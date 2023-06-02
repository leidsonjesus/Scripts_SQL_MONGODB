-- 1. Criando tabela categoria
-- -- Criando tabela com chave primária na mesma linha, formato simples:
CREATE TABLE categoria (
  id BIGINT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL
);


-- 2. Criando tabela editoras
-- -- Usando estilo de chave primário composta, porém usando um único campo:
CREATE TABLE editoras (
  id SERIAL,
  nome VARCHAR(255) NOT NULL,
  endereco TEXT NOT NULL,
  telefone VARCHAR(20),
  PRIMARY KEY (id)
);


-- 3. Criando tabela autores
-- -- Criando tabela usando IF TABLE para migrations;
-- -- Com nome de CONSTRAINT primary key específico;
-- -- Usando UNIQUE no email.
CREATE TABLE autores (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  telefone VARCHAR(20),
  UNIQUE (email)
);

-- 4. Criando tabela livros
-- -- Criando com tudo que foi visto nos passos anteriores
-- --  E colocando chave estrangeira diretamente no comando de criação
CREATE TABLE IF NOT EXISTS livros (
  id BIGINT GENERATED ALWAYS AS IDENTITY,
  titulo VARCHAR NOT NULL,
  isbn VARCHAR(20) NOT NULL,
  paginas INTEGER NOT NULL,
  codigo VARCHAR(10) NOT NULL UNIQUE,
  ano INTEGER NOT NULL,
  categoria_id BIGINT NOT NULL,
  editora_id BIGINT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_editora FOREIGN KEY (editora_id) REFERENCES editoras
);


-- 5. Criando tabela autores_livros
-- --  Criando tabela associativa com chave composta
CREATE TABLE IF NOT EXISTS autores_livros (
  autor_id BIGINT,
  livros_id BIGINT,
  PRIMARY KEY (autor_id, livros_id)
);

/* Prática 11 – Lanchonete – modelo físico (DDL) */
DROP DATABASE IF EXISTS lanchonete;
CREATE DATABASE lanchonete;
USE lanchonete;

-- unidades da rede
CREATE TABLE unidade (
  codigo   INT AUTO_INCREMENT PRIMARY KEY,
  -- dica: texto curto, como o nome do servico
  nome     ____________ NOT NULL,
  -- dica: na figura, endereço sem regra: aceita vazio
  endereco VARCHAR(150) ________
  -- dica: escreva entre as aspas o que a tabela guarda
) COMMENT = '______________________';

-- clientes: o telefone não se repete
CREATE TABLE cliente (
  codigo   INT AUTO_INCREMENT PRIMARY KEY,
  -- dica: na figura, a regra ao lado de nome
  nome     VARCHAR(80) ________,
  -- dica: na figura, a regra ao lado de telefone
  telefone VARCHAR(15) ________
);

-- cardápio: o preço de tabela é maior que zero
CREATE TABLE produto (
  -- dica: o mesmo tipo do codigo das outras tabelas
  codigo       ____ AUTO_INCREMENT PRIMARY KEY,
  -- dica: na figura, a segunda regra ao lado de nome
  nome         VARCHAR(60) NOT NULL ________,
  -- dica: preço com centavos, como o preco do servico
  preco_tabela __________ NOT NULL
               CHECK (preco_tabela ___ 0)
);

-- entregadores
CREATE TABLE entregador (
  codigo INT AUTO_INCREMENT PRIMARY KEY,
  -- dica: na figura, a regra ao lado de nome
  nome   VARCHAR(60) ________
);

-- passos 9 a 13: escreva aqui pedido, item_pedido e o ALTER TABLE

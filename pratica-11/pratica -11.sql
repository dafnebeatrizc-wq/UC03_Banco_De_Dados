/* Prática 11 – Lanchonete – modelo físico (DDL) */
DROP DATABASE IF EXISTS lanchonete;
CREATE DATABASE lanchonete;
USE lanchonete;

-- ============================================================================
-- Parte 2. Completar o molde
-- ============================================================================

-- unidades da rede
CREATE TABLE unidade (
  codigo   INT AUTO_INCREMENT PRIMARY KEY,
  nome     VARCHAR(60) NOT NULL,
  endereco VARCHAR(150) NULL
) COMMENT = 'Unidades físicas que pertencem à rede da lanchonete';

-- clientes: o telefone não se repete
CREATE TABLE cliente (
  codigo   INT AUTO_INCREMENT PRIMARY KEY,
  nome     VARCHAR(80) NOT NULL,
  telefone VARCHAR(15) UNIQUE
);

-- cardápio: o preço de tabela é maior que zero
CREATE TABLE produto (
  codigo       INT AUTO_INCREMENT PRIMARY KEY,
  nome         VARCHAR(60) NOT NULL UNIQUE,
  preco_tabela DECIMAL(6,2) NOT NULL CHECK (preco_tabela > 0)
);

-- entregadores
CREATE TABLE entregador (
  codigo INT AUTO_INCREMENT PRIMARY KEY,
  nome   VARCHAR(60) NOT NULL
);

-- ============================================================================
-- Parte 3. Escrever pedido e item_pedido (Passos 9 a 13)
-- ============================================================================

-- pedidos: registra os dados gerais de cada venda e entrega
CREATE TABLE pedido (
  numero            INT AUTO_INCREMENT PRIMARY KEY,
  data_hora         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  cliente_codigo    INT NOT NULL,
  unidade_codigo    INT NOT NULL,
  entregador_codigo INT NULL, -- NULL porque aceita vazio se for no balcão
  FOREIGN KEY (cliente_codigo) REFERENCES cliente (codigo),
  FOREIGN KEY (unidade_codigo) REFERENCES unidade (codigo),
  FOREIGN KEY (entregador_codigo) REFERENCES entregador (codigo)
);

-- itens de cada pedido: armazena os produtos comprados e suas quantidades
CREATE TABLE item_pedido (
  pedido_numero  INT NOT NULL,
  produto_codigo INT NOT NULL,
  quantidade     INT NOT NULL CHECK (quantidade > 0),
  preco_cobrado  DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (pedido_numero, produto_codigo),
  FOREIGN KEY (pedido_numero) REFERENCES pedido (numero),
  FOREIGN KEY (produto_codigo) REFERENCES produto (codigo)
);

-- alteração da tabela produto para inclusão de disponibilidade do item
ALTER TABLE produto ADD disponivel CHAR(1) NOT NULL DEFAULT 'S' CHECK (disponivel IN ('S', 'N'));

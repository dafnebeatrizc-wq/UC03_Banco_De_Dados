/* SA1 - Banco da indústria de embalagens */
DROP DATABASE IF EXISTS embalagens;
CREATE DATABASE embalagens;
USE embalagens;

-- Tabela que armazena as unidades fabris da indústria
CREATE TABLE Unidade (
    id_unidade INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_unidade)
) COMMENT = 'Armazena os dados cadastrais das unidades fabris';

-- Tabela que armazena os tipos de matéria-prima plástica
CREATE TABLE Resina (
    id_resina INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_resina)
) COMMENT = 'Cadastro dos tipos de resina utilizados na produção';

-- Tabela que armazena os clientes compradores das embalagens
CREATE TABLE Cliente (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    cnpj VARCHAR(18) NOT NULL,
    razao_social VARCHAR(150) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NULL,
    PRIMARY KEY (id_cliente),
    UNIQUE KEY uk_cliente_cnpj (cnpj)
) COMMENT = 'Cadastro de clientes da indústria com CNPJ único e telefone opcional';

-- Tabela que armazena o catálogo único de produtos da empresa
CREATE TABLE Produto (
    id_produto INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco_tabela DECIMAL(10,2) NOT NULL,
    id_resina INT NOT NULL,
    PRIMARY KEY (id_produto),
    UNIQUE KEY uk_produto_nome (nome),
    CONSTRAINT chk_produto_preco CHECK (preco_tabela > 0),
    CONSTRAINT fk_produto_resina FOREIGN KEY (id_resina) REFERENCES Resina (id_resina)
) COMMENT = 'Catálogo unificado de produtos vinculados a uma única resina';

-- Tabela associativa que controla o estoque de resinas por unidade
CREATE TABLE Estoque_Resina (
    id_unidade INT NOT NULL,
    id_resina INT NOT NULL,
    qtd_quilos DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_unidade, id_resina),
    CONSTRAINT fk_estoque_unidade FOREIGN KEY (id_unidade) REFERENCES Unidade (id_unidade),
    CONSTRAINT fk_estoque_resina FOREIGN KEY (id_resina) REFERENCES Resina (id_resina)
) COMMENT = 'Controla a quantidade em quilos de cada resina armazenada por unidade';

-- Tabela que registra as ordens de produção e o controle de refugo
CREATE TABLE Ordem_Producao (
    numero_ordem INT NOT NULL,
    data DATE NOT NULL,
    qtd_planejada INT NOT NULL,
    qtd_boa INT NOT NULL,
    qtd_refugo INT NOT NULL,
    id_unidade INT NOT NULL,
    id_produto INT NOT NULL,
    PRIMARY KEY (numero_ordem),
    CONSTRAINT fk_ordem_unidade FOREIGN KEY (id_unidade) REFERENCES Unidade (id_unidade),
    CONSTRAINT fk_ordem_produto FOREIGN KEY (id_produto) REFERENCES Produto (id_produto)
) COMMENT = 'Registra as ordens de produção por unidade e produto, incluindo refugos';

-- Tabela de cabeçalho das expedições de saída para clientes
CREATE TABLE Expedicao (
    numero_expedicao INT NOT NULL,
    data DATE NOT NULL,
    id_unidade INT NOT NULL,
    id_cliente INT NOT NULL,
    PRIMARY KEY (numero_expedicao),
    CONSTRAINT fk_expedicao_unidade FOREIGN KEY (id_unidade) REFERENCES Unidade (id_unidade),
    CONSTRAINT fk_expedicao_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente)
) COMMENT = 'Registra a saída de mercadorias de uma unidade para um cliente';

-- Tabela associativa que detalha os produtos enviados em cada expedição
CREATE TABLE Item_Expedicao (
    numero_expedicao INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_cobrado DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (numero_expedicao, id_produto),
    CONSTRAINT fk_item_expedicao FOREIGN KEY (numero_expedicao) REFERENCES Expedicao (numero_expedicao),
    CONSTRAINT fk_item_produto FOREIGN KEY (id_produto) REFERENCES Produto (id_produto)
) COMMENT = 'Itens de cada expedição com quantidade e preço praticado na venda';

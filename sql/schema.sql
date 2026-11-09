-- ============================================================
-- schema.sql — Criação das tabelas (PostgreSQL)
-- ============================================================

DROP TABLE IF EXISTS itens_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    cliente_id     INT PRIMARY KEY,
    nome           VARCHAR(100) NOT NULL,
    cidade         VARCHAR(50),
    estado         CHAR(2),
    data_cadastro  DATE
);

CREATE TABLE produtos (
    produto_id      INT PRIMARY KEY,
    nome_produto    VARCHAR(100) NOT NULL,
    categoria       VARCHAR(50),
    preco_unitario  DECIMAL(10,2)
);

CREATE TABLE pedidos (
    pedido_id    INT PRIMARY KEY,
    cliente_id   INT NOT NULL,
    data_pedido  DATE NOT NULL,
    status       VARCHAR(20),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE itens_pedido (
    item_id      INT PRIMARY KEY,
    pedido_id    INT NOT NULL,
    produto_id   INT NOT NULL,
    quantidade   INT NOT NULL,
    preco_venda  DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedido_id)  REFERENCES pedidos(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);
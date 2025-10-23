
use  DB_03360A_Maicon;
-- Fornecedores
CREATE TABLE fornecedores (
    id_fornecedor INT PRIMARY KEY,
    nome_fornecedor VARCHAR(100)
);
-- Produtos
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    id_fornecedor INT,
    preco DECIMAL(10,2),
    estoque INT
);

-- Vendas
CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    id_produto INT,
    quantidade INT,
    data_venda DATE,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
-- Inserir fornecedores
INSERT INTO fornecedores (id_fornecedor, nome_fornecedor) VALUES
(1, 'Pães do Vale'),
(2, 'Doces São João'),
(3, 'Café Bom Sabor'),
(4, 'Distribuidora Delícia'),
(5, 'Sabores da Serra');

-- Inserir produtos
INSERT INTO produtos (id_produto, nome_produto, id_fornecedor, preco, estoque) VALUES
(1, 'Pão Francês', 1, 0.50, 40),
(2, 'Bolo de Chocolate', 2, 25.00, 10),
(3, 'Café Torrado', 3, 15.00, 50),
(4, 'Croissant', 4, 6.50, 8),
(5, 'Sonho de Creme', 2, 7.00, 12),
(6, 'Pão de Queijo', 1, 1.50, 20),
(7, 'Bolo de Cenoura', 2, 22.00, 5),
(8, 'Café Moído', 3, 18.00, 30),
(9, 'Rosquinha Doce', 5, 4.00, 18),
(10, 'Torta de Morango', 2, 35.00, 7);

-- Inserir vendas
INSERT INTO vendas (id_venda, id_produto, quantidade, data_venda) VALUES
(1, 1, 100, '2025-10-01'),
(2, 2, 3, '2025-10-02'),
(3, 4, 5, '2025-10-03'),
(4, 3, 10, '2025-10-04'),
(5, 5, 6, '2025-10-05'),
(6, 7, 2, '2025-10-06'),
(7, 8, 4, '2025-10-07'),
(8, 1, 50, '2025-10-08'),
(9, 9, 7, '2025-10-09'),
(10, 10, 3, '2025-10-10'),
(11, 2, 5, '2025-10-11'),
(12, 4, 2, '2025-10-12'),
(13, 6, 20, '2025-10-13'),
(14, 5, 4, '2025-10-14'),
(15, 8, 1, '2025-10-15');

-- Exibir o nome dos produtos e o nome do fornecedor de cada um
SELECT p.nome_produto, f.nome_fornecedor
FROM produtos AS p
INNER JOIN fornecedores AS f
ON p.id_fornecedor = f.id_fornecedor;
-- Listar os produtos vendidos com suas quantidades e data da venda
SELECT p.nome_produto, v.quantidade, v.data_venda
FROM vendas AS v
INNER JOIN produtos AS p
ON v.id_produto = p.id_produto;
-- Ver o nome do produto, valor total da venda e nome do fornecedor
SELECT 
    p.nome_produto,
    (v.quantidade * p.preco) AS valor_total,
    f.nome_fornecedor
FROM vendas AS v
INNER JOIN produtos AS p ON v.id_produto = p.id_produto
INNER JOIN fornecedores AS f ON p.id_fornecedor = f.id_fornecedor;
-- Exibir produtos com estoque abaixo de 15 unidades e seus fornecedores
SELECT p.nome_produto, p.estoque, f.nome_fornecedor
FROM produtos AS p
INNER JOIN fornecedores AS f
ON p.id_fornecedor = f.id_fornecedor
WHERE p.estoque < 15;
-- Listar as 5 últimas vendas (por data decrescente) exibindo a quantidade, o nome do produto e o fornecedor
SELECT 
    v.data_venda,
    v.quantidade,
    p.nome_produto,
    f.nome_fornecedor
FROM vendas AS v
INNER JOIN produtos AS p ON v.id_produto = p.id_produto
INNER JOIN fornecedores AS f ON p.id_fornecedor = f.id_fornecedor
ORDER BY v.data_venda DESC
LIMIT 5;


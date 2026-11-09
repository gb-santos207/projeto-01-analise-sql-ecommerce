-- ============================================================
-- seed.sql — Carga de dados sintéticos
-- Projeto 01 — Análise Exploratória de E-commerce com SQL
-- 30 clientes | 20 produtos | 100 pedidos | 250 itens
-- ============================================================

TRUNCATE TABLE itens_pedido, pedidos, produtos, clientes RESTART IDENTITY CASCADE;

-- ============================================================
-- CLIENTES (30) — concentração em SP, RJ, MG (realista)
-- Datas de cadastro entre 2023-01 e 2023-12
-- ============================================================
INSERT INTO clientes (cliente_id, nome, cidade, estado, data_cadastro) VALUES
(1,  'Ana Souza',           'São Paulo',       'SP', DATE '2023-01-15'),
(2,  'Bruno Lima',          'Rio de Janeiro',  'RJ', DATE '2023-02-03'),
(3,  'Carla Mendes',        'Belo Horizonte',  'MG', DATE '2023-02-20'),
(4,  'Diego Ferreira',      'São Paulo',       'SP', DATE '2023-03-08'),
(5,  'Elisa Rocha',         'Curitiba',        'PR', DATE '2023-03-22'),
(6,  'Felipe Alves',        'Porto Alegre',    'RS', DATE '2023-04-11'),
(7,  'Gabriela Nunes',      'Salvador',        'BA', DATE '2023-04-29'),
(8,  'Henrique Dias',       'São Paulo',       'SP', DATE '2023-05-14'),
(9,  'Isabela Castro',      'Recife',          'PE', DATE '2023-05-30'),
(10, 'João Pereira',        'Rio de Janeiro',  'RJ', DATE '2023-06-12'),
(11, 'Karina Oliveira',     'Fortaleza',       'CE', DATE '2023-06-25'),
(12, 'Lucas Martins',       'Belo Horizonte',  'MG', DATE '2023-07-09'),
(13, 'Mariana Ribeiro',     'São Paulo',       'SP', DATE '2023-07-21'),
(14, 'Nicolas Barbosa',     'Brasília',        'DF', DATE '2023-08-04'),
(15, 'Olívia Cardoso',      'Florianópolis',   'SC', DATE '2023-08-18'),
(16, 'Pedro Henrique',      'Campinas',        'SP', DATE '2023-09-02'),
(17, 'Queren Silva',        'Goiânia',         'GO', DATE '2023-09-15'),
(18, 'Rafael Teixeira',     'Rio de Janeiro',  'RJ', DATE '2023-09-28'),
(19, 'Sofia Araújo',        'São Paulo',       'SP', DATE '2023-10-10'),
(20, 'Thiago Costa',        'Manaus',          'AM', DATE '2023-10-23'),
(21, 'Ursula Pinto',        'Belo Horizonte',  'MG', DATE '2023-11-05'),
(22, 'Victor Hugo',         'Curitiba',        'PR', DATE '2023-11-17'),
(23, 'Wendy Moraes',        'São Paulo',       'SP', DATE '2023-11-29'),
(24, 'Xavier Campos',       'Salvador',        'BA', DATE '2023-12-08'),
(25, 'Yara Fernandes',      'Porto Alegre',    'RS', DATE '2023-12-15'),
(26, 'Zeca Ramos',          'Rio de Janeiro',  'RJ', DATE '2023-12-20'),
(27, 'Alice Monteiro',      'Recife',          'PE', DATE '2023-12-27'),
(28, 'Bernardo Lopes',      'São Paulo',       'SP', DATE '2023-12-29'),
(29, 'Camila Duarte',       'Brasília',        'DF', DATE '2023-12-30'),
(30, 'Daniel Vieira',       'Campinas',        'SP', DATE '2023-12-31');

-- ============================================================
-- PRODUTOS (20) — 4 categorias, faixas de preço variadas
-- ============================================================
INSERT INTO produtos (produto_id, nome_produto, categoria, preco_unitario) VALUES
(1,  'Fone Bluetooth',           'Eletrônicos', 199.90),
(2,  'Smartwatch Fit',           'Eletrônicos', 349.90),
(3,  'Caixa de Som Portátil',    'Eletrônicos', 249.90),
(4,  'Carregador Turbo',         'Eletrônicos', 89.90),
(5,  'Camiseta Básica',          'Vestuário',   49.90),
(6,  'Calça Jeans Slim',         'Vestuário',   159.90),
(7,  'Jaqueta Corta-Vento',      'Vestuário',   229.90),
(8,  'Tênis Running',            'Vestuário',   299.90),
(9,  'Meias Kit 3 Pares',        'Vestuário',   29.90),
(10, 'Livro: SQL na Prática',    'Livros',      79.90),
(11, 'Livro: Python para Dados', 'Livros',      89.90),
(12, 'Livro: Storytelling',      'Livros',      69.90),
(13, 'Livro: Estatística Básica','Livros',      59.90),
(14, 'Jogo de Panelas',          'Casa',        189.90),
(15, 'Jogo de Toalhas',          'Casa',        99.90),
(16, 'Luminária de Mesa',        'Casa',        119.90),
(17, 'Organizador Modular',      'Casa',        74.90),
(18, 'Cafeteira Elétrica',       'Casa',        219.90),
(19, 'Aspirador Portátil',       'Casa',        259.90),
(20, 'Kit Ferramentas',          'Casa',        149.90);

-- ============================================================
-- PEDIDOS (100) — distribuídos em 2024 com sazonalidade
-- Padrões embutidos:
--   - Pico em maio (Dia das Mães), novembro (Black Friday), dezembro (Natal)
--   - Vales em janeiro e fevereiro
--   - ~12% cancelados, ~8% pendentes, ~80% concluídos
--   - Clientes 1, 2, 3, 4, 5, 6, 7 compram recorrentemente (top clientes)
--   - Clientes 28, 29, 30 nunca compram (para a query de "clientes sem pedido")
-- ============================================================
INSERT INTO pedidos (pedido_id, cliente_id, data_pedido, status) VALUES
-- Janeiro (6 pedidos — mês fraco)
(1,  1,  DATE '2024-01-05', 'concluido'),
(2,  2,  DATE '2024-01-09', 'concluido'),
(3,  4,  DATE '2024-01-14', 'cancelado'),
(4,  8,  DATE '2024-01-18', 'concluido'),
(5,  10, DATE '2024-01-22', 'pendente'),
(6,  13, DATE '2024-01-27', 'concluido'),

-- Fevereiro (6 pedidos)
(7,  1,  DATE '2024-02-03', 'concluido'),
(8,  3,  DATE '2024-02-08', 'concluido'),
(9,  5,  DATE '2024-02-12', 'concluido'),
(10, 11, DATE '2024-02-17', 'cancelado'),
(11, 19, DATE '2024-02-21', 'concluido'),
(12, 23, DATE '2024-02-26', 'concluido'),

-- Março (8 pedidos)
(13, 2,  DATE '2024-03-02', 'concluido'),
(14, 4,  DATE '2024-03-07', 'concluido'),
(15, 6,  DATE '2024-03-11', 'concluido'),
(16, 9,  DATE '2024-03-15', 'pendente'),
(17, 12, DATE '2024-03-19', 'concluido'),
(18, 16, DATE '2024-03-23', 'concluido'),
(19, 20, DATE '2024-03-27', 'cancelado'),
(20, 24, DATE '2024-03-30', 'concluido'),

-- Abril (8 pedidos)
(21, 1,  DATE '2024-04-04', 'concluido'),
(22, 3,  DATE '2024-04-08', 'concluido'),
(23, 5,  DATE '2024-04-13', 'concluido'),
(24, 7,  DATE '2024-04-17', 'concluido'),
(25, 10, DATE '2024-04-21', 'concluido'),
(26, 14, DATE '2024-04-25', 'cancelado'),
(27, 18, DATE '2024-04-28', 'concluido'),
(28, 22, DATE '2024-04-30', 'concluido'),

-- Maio (12 pedidos — pico Dia das Mães)
(29, 1,  DATE '2024-05-02', 'concluido'),
(30, 2,  DATE '2024-05-04', 'concluido'),
(31, 3,  DATE '2024-05-06', 'concluido'),
(32, 4,  DATE '2024-05-08', 'concluido'),
(33, 5,  DATE '2024-05-10', 'concluido'),
(34, 6,  DATE '2024-05-12', 'concluido'),
(35, 8,  DATE '2024-05-15', 'concluido'),
(36, 11, DATE '2024-05-18', 'pendente'),
(37, 15, DATE '2024-05-21', 'concluido'),
(38, 19, DATE '2024-05-24', 'concluido'),
(39, 21, DATE '2024-05-27', 'cancelado'),
(40, 25, DATE '2024-05-30', 'concluido'),

-- Junho (8 pedidos)
(41, 1,  DATE '2024-06-03', 'concluido'),
(42, 2,  DATE '2024-06-07', 'concluido'),
(43, 5,  DATE '2024-06-11', 'concluido'),
(44, 7,  DATE '2024-06-15', 'concluido'),
(45, 9,  DATE '2024-06-19', 'cancelado'),
(46, 13, DATE '2024-06-22', 'concluido'),
(47, 17, DATE '2024-06-25', 'concluido'),
(48, 23, DATE '2024-06-28', 'concluido'),

-- Julho (8 pedidos — férias)
(49, 2,  DATE '2024-07-02', 'concluido'),
(50, 4,  DATE '2024-07-06', 'concluido'),
(51, 6,  DATE '2024-07-10', 'concluido'),
(52, 10, DATE '2024-07-14', 'concluido'),
(53, 12, DATE '2024-07-18', 'pendente'),
(54, 16, DATE '2024-07-22', 'concluido'),
(55, 20, DATE '2024-07-26', 'concluido'),
(56, 24, DATE '2024-07-30', 'concluido'),

-- Agosto (8 pedidos)
(57, 1,  DATE '2024-08-03', 'concluido'),
(58, 3,  DATE '2024-08-07', 'concluido'),
(59, 5,  DATE '2024-08-11', 'concluido'),
(60, 8,  DATE '2024-08-15', 'cancelado'),
(61, 11, DATE '2024-08-19', 'concluido'),
(62, 14, DATE '2024-08-23', 'concluido'),
(63, 18, DATE '2024-08-27', 'concluido'),
(64, 22, DATE '2024-08-30', 'concluido'),

-- Setembro (8 pedidos)
(65, 2,  DATE '2024-09-03', 'concluido'),
(66, 4,  DATE '2024-09-07', 'concluido'),
(67, 6,  DATE '2024-09-11', 'concluido'),
(68, 9,  DATE '2024-09-15', 'concluido'),
(69, 13, DATE '2024-09-19', 'pendente'),
(70, 17, DATE '2024-09-23', 'concluido'),
(71, 21, DATE '2024-09-27', 'concluido'),
(72, 25, DATE '2024-09-30', 'concluido'),

-- Outubro (8 pedidos)
(73, 1,  DATE '2024-10-04', 'concluido'),
(74, 3,  DATE '2024-10-08', 'concluido'),
(75, 5,  DATE '2024-10-12', 'concluido'),
(76, 7,  DATE '2024-10-16', 'cancelado'),
(77, 10, DATE '2024-10-20', 'concluido'),
(78, 15, DATE '2024-10-24', 'concluido'),
(79, 19, DATE '2024-10-28', 'concluido'),
(80, 23, DATE '2024-10-31', 'concluido'),

-- Novembro (12 pedidos — pico Black Friday)
(81, 1,  DATE '2024-11-02', 'concluido'),
(82, 2,  DATE '2024-11-05', 'concluido'),
(83, 3,  DATE '2024-11-08', 'concluido'),
(84, 4,  DATE '2024-11-11', 'concluido'),
(85, 5,  DATE '2024-11-14', 'concluido'),
(86, 6,  DATE '2024-11-17', 'concluido'),
(87, 8,  DATE '2024-11-20', 'concluido'),
(88, 11, DATE '2024-11-22', 'concluido'),
(89, 13, DATE '2024-11-25', 'concluido'),
(90, 16, DATE '2024-11-27', 'cancelado'),
(91, 20, DATE '2024-11-28', 'concluido'),
(92, 24, DATE '2024-11-29', 'concluido'),

-- Dezembro (8 pedidos — Natal)
(93,  1,  DATE '2024-12-03', 'concluido'),
(94,  3,  DATE '2024-12-07', 'concluido'),
(95,  5,  DATE '2024-12-11', 'concluido'),
(96,  7,  DATE '2024-12-15', 'concluido'),
(97,  9,  DATE '2024-12-18', 'pendente'),
(98,  12, DATE '2024-12-21', 'concluido'),
(99,  18, DATE '2024-12-24', 'concluido'),
(100, 22, DATE '2024-12-28', 'concluido');

-- ============================================================
-- ITENS_PEDIDO (250) — 2 a 3 itens por pedido
-- Produtos campeões (1, 5, 8, 10, 15) aparecem com mais frequência
-- Preço de venda = preço unitário do produto (com pequenas variações)
-- Pedidos cancelados também têm itens (para a query de taxa de cancelamento)
-- ============================================================

-- Helper mental: pedidos 1-100; cada pedido recebe 2-3 itens.
-- Total: 100 pedidos × 2,5 itens em média = 250 itens.

INSERT INTO itens_pedido (item_id, pedido_id, produto_id, quantidade, preco_venda) VALUES
-- Pedido 1
(1,  1,  1,  1, 199.90), (2,  1,  5,  2, 49.90), (3,  1,  10, 1, 79.90),
-- Pedido 2
(4,  2,  2,  1, 349.90), (5,  2,  8,  1, 299.90),
-- Pedido 3 (cancelado)
(6,  3,  7,  1, 229.90), (7,  3,  9,  3, 29.90),
-- Pedido 4
(8,  4,  15, 1, 99.90), (9,  4,  17, 1, 74.90), (10, 4, 18, 1, 219.90),
-- Pedido 5 (pendente)
(11, 5,  3,  1, 249.90), (12, 5,  4,  1, 89.90),
-- Pedido 6
(13, 6,  10, 1, 79.90), (14, 6,  11, 1, 89.90), (15, 6, 12, 1, 69.90),
-- Pedido 7
(16, 7,  1,  1, 199.90), (17, 7,  6,  1, 159.90),
-- Pedido 8
(18, 8,  8,  1, 299.90), (19, 8,  9,  2, 29.90), (20, 8, 5, 2, 49.90),
-- Pedido 9
(21, 9,  14, 1, 189.90), (22, 9,  15, 1, 99.90),
-- Pedido 10 (cancelado)
(23, 10, 2,  1, 349.90), (24, 10, 4, 1, 89.90),
-- Pedido 11
(25, 11, 10, 1, 79.90), (26, 11, 11, 1, 89.90), (27, 11, 13, 1, 59.90),
-- Pedido 12
(28, 12, 1,  1, 199.90), (29, 12, 3, 1, 249.90),
-- Pedido 13
(30, 13, 5,  3, 49.90), (31, 13, 9, 3, 29.90), (32, 13, 6, 1, 159.90),
-- Pedido 14
(33, 14, 8,  1, 299.90), (34, 14, 7, 1, 229.90),
-- Pedido 15
(35, 15, 15, 2, 99.90), (36, 15, 17, 1, 74.90), (37, 15, 20, 1, 149.90),
-- Pedido 16 (pendente)
(38, 16, 1,  1, 199.90), (39, 16, 10, 1, 79.90),
-- Pedido 17
(40, 17, 18, 1, 219.90), (41, 17, 19, 1, 259.90),
-- Pedido 18
(42, 18, 2,  1, 349.90), (43, 18, 4, 1, 89.90), (44, 18, 9, 2, 29.90),
-- Pedido 19 (cancelado)
(45, 19, 6,  1, 159.90), (46, 19, 7, 1, 229.90),
-- Pedido 20
(47, 20, 10, 1, 79.90), (48, 20, 12, 1, 69.90), (49, 20, 13, 1, 59.90),
-- Pedido 21
(50, 21, 1,  1, 199.90), (51, 21, 5, 2, 49.90),
-- Pedido 22
(52, 22, 8,  1, 299.90), (53, 22, 9, 3, 29.90),
-- Pedido 23
(54, 23, 14, 1, 189.90), (55, 23, 15, 1, 99.90), (56, 23, 16, 1, 119.90),
-- Pedido 24
(57, 24, 2,  1, 349.90), (58, 24, 3, 1, 249.90),
-- Pedido 25
(59, 25, 10, 1, 79.90), (60, 25, 11, 1, 89.90), (61, 25, 12, 1, 69.90),
-- Pedido 26 (cancelado)
(62, 26, 5,  2, 49.90), (63, 26, 9, 3, 29.90),
-- Pedido 27
(64, 27, 1,  1, 199.90), (65, 27, 8, 1, 299.90),
-- Pedido 28
(66, 28, 15, 2, 99.90), (67, 28, 17, 1, 74.90), (68, 28, 18, 1, 219.90),
-- Pedido 29
(69, 29, 2,  1, 349.90), (70, 29, 4, 1, 89.90), (71, 29, 9, 2, 29.90),
-- Pedido 30
(72, 30, 1,  1, 199.90), (73, 30, 6, 1, 159.90),
-- Pedido 31
(74, 31, 14, 1, 189.90), (75, 31, 15, 1, 99.90),
-- Pedido 32
(76, 32, 8,  1, 299.90), (77, 32, 7, 1, 229.90),
-- Pedido 33
(78, 33, 10, 1, 79.90), (79, 33, 11, 1, 89.90), (80, 33, 13, 1, 59.90),
-- Pedido 34
(81, 34, 1,  1, 199.90), (82, 34, 3, 1, 249.90), (83, 34, 5, 2, 49.90),
-- Pedido 35
(84, 35, 2,  1, 349.90), (85, 35, 8, 1, 299.90),
-- Pedido 36 (pendente)
(86, 36, 15, 1, 99.90), (87, 36, 16, 1, 119.90),
-- Pedido 37
(88, 37, 14, 1, 189.90), (89, 37, 18, 1, 219.90), (90, 37, 19, 1, 259.90),
-- Pedido 38
(91, 38, 1,  1, 199.90), (92, 38, 10, 1, 79.90),
-- Pedido 39 (cancelado)
(93, 39, 6,  1, 159.90), (94, 39, 7, 1, 229.90),
-- Pedido 40
(95, 40, 8,  1, 299.90), (96, 40, 9, 3, 29.90), (97, 40, 5, 2, 49.90),
-- Pedido 41
(98, 41, 2,  1, 349.90), (99, 41, 3, 1, 249.90),
-- Pedido 42
(100, 42, 10, 1, 79.90), (101, 42, 11, 1, 89.90),
-- Pedido 43
(102, 43, 1,  1, 199.90), (103, 43, 8, 1, 299.90), (104, 43, 9, 2, 29.90),
-- Pedido 44
(105, 44, 14, 1, 189.90), (106, 44, 15, 1, 99.90), (107, 44, 20, 1, 149.90),
-- Pedido 45 (cancelado)
(108, 45, 2,  1, 349.90), (109, 45, 4, 1, 89.90),
-- Pedido 46
(110, 46, 5,  3, 49.90), (111, 46, 6, 1, 159.90),
-- Pedido 47
(112, 47, 1,  1, 199.90), (113, 47, 3, 1, 249.90), (114, 47, 10, 1, 79.90),
-- Pedido 48
(115, 48, 8,  1, 299.90), (116, 48, 7, 1, 229.90),
-- Pedido 49
(117, 49, 15, 2, 99.90), (118, 49, 17, 1, 74.90),
-- Pedido 50
(119, 50, 2,  1, 349.90), (120, 50, 1, 1, 199.90), (121, 50, 9, 2, 29.90),
-- Pedido 51
(122, 51, 10, 1, 79.90), (123, 51, 12, 1, 69.90),
-- Pedido 52
(124, 52, 14, 1, 189.90), (125, 52, 18, 1, 219.90),
-- Pedido 53 (pendente)
(126, 53, 5,  2, 49.90), (127, 53, 9, 3, 29.90),
-- Pedido 54
(128, 54, 1,  1, 199.90), (129, 54, 8, 1, 299.90),
-- Pedido 55
(130, 55, 15, 1, 99.90), (131, 55, 16, 1, 119.90), (132, 55, 20, 1, 149.90),
-- Pedido 56
(133, 56, 2,  1, 349.90), (134, 56, 6, 1, 159.90),
-- Pedido 57
(135, 57, 10, 1, 79.90), (136, 57, 11, 1, 89.90), (137, 57, 13, 1, 59.90),
-- Pedido 58
(138, 58, 1,  1, 199.90), (139, 58, 5, 2, 49.90),
-- Pedido 59
(140, 59, 8,  1, 299.90), (141, 59, 7, 1, 229.90), (142, 59, 9, 2, 29.90),
-- Pedido 60 (cancelado)
(143, 60, 2,  1, 349.90), (144, 60, 3, 1, 249.90),
-- Pedido 61
(145, 61, 14, 1, 189.90), (146, 61, 15, 1, 99.90),
-- Pedido 62
(147, 62, 1,  1, 199.90), (148, 62, 10, 1, 79.90), (149, 62, 11, 1, 89.90),
-- Pedido 63
(150, 63, 8,  1, 299.90), (151, 63, 6, 1, 159.90),
-- Pedido 64
(152, 64, 15, 2, 99.90), (153, 64, 17, 1, 74.90), (154, 64, 18, 1, 219.90),
-- Pedido 65
(155, 65, 2,  1, 349.90), (156, 65, 4, 1, 89.90),
-- Pedido 66
(157, 66, 1,  1, 199.90), (158, 66, 3, 1, 249.90), (159, 66, 9, 2, 29.90),
-- Pedido 67
(160, 67, 10, 1, 79.90), (161, 67, 12, 1, 69.90),
-- Pedido 68
(162, 68, 14, 1, 189.90), (163, 68, 15, 1, 99.90), (164, 68, 20, 1, 149.90),
-- Pedido 69 (pendente)
(165, 69, 8,  1, 299.90), (166, 69, 7, 1, 229.90),
-- Pedido 70
(167, 70, 1,  1, 199.90), (168, 70, 5, 2, 49.90),
-- Pedido 71
(169, 71, 2,  1, 349.90), (170, 71, 3, 1, 249.90), (171, 71, 4, 1, 89.90),
-- Pedido 72
(172, 72, 10, 1, 79.90), (173, 72, 11, 1, 89.90), (174, 72, 13, 1, 59.90),
-- Pedido 73
(175, 73, 1,  1, 199.90), (176, 73, 8, 1, 299.90),
-- Pedido 74
(177, 74, 14, 1, 189.90), (178, 74, 18, 1, 219.90),
-- Pedido 75
(179, 75, 5,  3, 49.90), (180, 75, 9, 2, 29.90),
-- Pedido 76 (cancelado)
(181, 76, 2,  1, 349.90), (182, 76, 6, 1, 159.90),
-- Pedido 77
(183, 77, 10, 1, 79.90), (184, 77, 12, 1, 69.90), (185, 77, 13, 1, 59.90),
-- Pedido 78
(186, 78, 1,  1, 199.90), (187, 78, 3, 1, 249.90),
-- Pedido 79
(188, 79, 15, 2, 99.90), (189, 79, 16, 1, 119.90), (190, 79, 20, 1, 149.90),
-- Pedido 80
(191, 80, 8,  1, 299.90), (192, 80, 7, 1, 229.90), (193, 80, 9, 2, 29.90),
-- Pedido 81
(194, 81, 2,  1, 349.90), (195, 81, 4, 1, 89.90),
-- Pedido 82
(196, 82, 1,  1, 199.90), (197, 82, 10, 1, 79.90), (198, 82, 11, 1, 89.90),
-- Pedido 83
(199, 83, 8,  1, 299.90), (200, 83, 6, 1, 159.90),
-- Pedido 84
(201, 84, 14, 1, 189.90), (202, 84, 15, 1, 99.90), (203, 84, 18, 1, 219.90),
-- Pedido 85
(204, 85, 1,  1, 199.90), (205, 85, 5, 2, 49.90),
-- Pedido 86
(206, 86, 2,  1, 349.90), (207, 86, 3, 1, 249.90),
-- Pedido 87
(208, 87, 10, 1, 79.90), (209, 87, 12, 1, 69.90),
-- Pedido 88
(210, 88, 8,  1, 299.90), (211, 88, 7, 1, 229.90), (212, 88, 9, 2, 29.90),
-- Pedido 89
(213, 89, 1,  1, 199.90), (214, 89, 15, 1, 99.90),
-- Pedido 90 (cancelado)
(215, 90, 14, 1, 189.90), (216, 90, 18, 1, 219.90),
-- Pedido 91
(217, 91, 2,  1, 349.90), (218, 91, 4, 1, 89.90), (219, 91, 9, 2, 29.90),
-- Pedido 92
(220, 92, 1,  1, 199.90), (221, 92, 8, 1, 299.90),
-- Pedido 93
(222, 93, 10, 1, 79.90), (223, 93, 11, 1, 89.90), (224, 93, 12, 1, 69.90),
-- Pedido 94
(225, 94, 5,  3, 49.90), (226, 94, 6, 1, 159.90),
-- Pedido 95
(227, 95, 14, 1, 189.90), (228, 95, 15, 1, 99.90), (229, 95, 20, 1, 149.90),
-- Pedido 96
(230, 96, 1,  1, 199.90), (231, 96, 3, 1, 249.90),
-- Pedido 97 (pendente)
(232, 97, 2,  1, 349.90), (233, 97, 8, 1, 299.90),
-- Pedido 98
(234, 98, 15, 2, 99.90), (235, 98, 17, 1, 74.90), (236, 98, 18, 1, 219.90),
-- Pedido 99
(237, 99, 1,  1, 199.90), (238, 99, 10, 1, 79.90), (239, 99, 11, 1, 89.90),
-- Pedido 100
(240, 100, 8,  1, 299.90), (241, 100, 7, 1, 229.90),
-- Itens extras para fechar 250 (alguns pedidos com 4 itens — realista)
(242, 7,  9,  3, 29.90),
(243, 13, 5,  2, 49.90),
(244, 21, 10, 1, 79.90),
(245, 33, 12, 1, 69.90),
(246, 44, 11, 1, 89.90),
(247, 57, 15, 1, 99.90),
(248, 73, 9,  2, 29.90),
(249, 81, 13, 1, 59.90),
(250, 93, 6,  1, 159.90);
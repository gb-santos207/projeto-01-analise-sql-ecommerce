-- ============================================================
-- queries.sql — Análise Exploratória de E-commerce
-- Projeto 01 — Analista de Dados Júnior
-- ============================================================

-- ============================================
--PERGUNTA 1: Qual o ticket médio por estado?
-- ============================================
 
  WITH receita_por_pedido AS (
	SELECT
		p.pedido_id,
      c.estado,
      SUM(ip.preco_venda * ip.quantidade) AS valor_total_pedido
	FROM clientes c
	JOIN pedidos p
	ON p.cliente_id = c.cliente_id
	JOIN itens_pedido ip
	ON ip.pedido_id = p.pedido_id
	WHERE p.status = 'concluido'
	GROUP BY p.pedido_id, c.estado
)
SELECT 
	estado,
	ROUND(AVG(valor_total_pedido)::numeric, 2) AS ticket_medio
FROM receita_por_pedido
GROUP BY estado
ORDER BY ticket_medio DESC;


-- ============================================
-- PERGUNTA 2: Quais os 10 produtos que mais geraram receita?
-- ============================================
-- 
WITH produtos_receita AS (
SELECT
	    pr.nome_produto,
	    ROUND(SUM(ip.preco_venda * ip.quantidade), 2) AS receita_total
	FROM produtos pr
	JOIN itens_pedido ip
	ON ip.produto_id = pr.produto_id
	JOIN pedidos pe
	ON pe.pedido_id = ip.pedido_id
	WHERE pe.status = 'concluido'
	GROUP BY pr.nome_produto
)
SELECT
	nome_produto,
	receita_total
FROM produtos_receita
ORDER BY receita_total DESC
LIMIT 10;


-- ============================================
-- PERGUNTA 3: Qual a taxa de cancelamento por mês?
-- ============================================
-- 
WITH taxa_cancelamento AS (
	SELECT
		TO_CHAR(data_pedido, 'MM-YYYY') AS mes,
		COUNT(pedido_id) AS total,
		SUM(CASE WHEN status = 'cancelado' THEN 1 ELSE 0 END) AS cancelados
	FROM pedidos
	GROUP BY mes
	ORDER BY mes
)
SELECT
	mes,
	ROUND(SUM(cancelados::numeric / total * 100), 2) AS porc_cancelados
FROM taxa_cancelamento
GROUP BY mes


-- ============================================
-- PERGUNTA 4: Quais clientes nunca fizeram pedido?
-- ============================================
--
WITH clientes_sem_pedido AS (
	SELECT
		c.nome as nome_cliente
	FROM clientes c
	LEFT JOIN pedidos p
	ON p.cliente_id = c.cliente_id
	WHERE p.pedido_id IS NULL
)
SELECT
*
FROM clientes_sem_pedido


-- ============================================
-- PERGUNTA 5: Qual a evolução mensal do número de pedidos?
-- ============================================
-- (escreva sua query aqui)


-- ============================================
-- PERGUNTA 6: Qual categoria tem maior receita média por pedido?
-- ============================================
-- (escreva sua query aqui)


-- ============================================
-- PERGUNTA 7: Ranking de clientes por receita total (Top 5)
-- ============================================
-- (escreva sua query aqui)


-- ============================================
-- PERGUNTA 8: Percentual de receita acumulada por mês
-- ============================================
-- (escreva sua query aqui)

-- ============================================================
-- FIM DO ARQUIVO
-- ============================================================
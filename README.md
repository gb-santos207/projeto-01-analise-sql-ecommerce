# Projeto 01 — Análise Exploratória de E-commerce com SQL

## Contexto de Negócio
Uma empresa fictícia do setor de e-commerce precisa entender seu desempenho de vendas ao longo do ano de 2024. O objetivo deste projeto é extrair dados de um banco relacional e responder a 8 perguntas de negócio fundamentais para guiar as decisões comerciais da empresa (como foco geográfico, produtos campeões e retenção de clientes).

## Objetivo
Demonstrar habilidades de extração, manipulação e análise de dados utilizando **SQL Puro** em um banco **PostgreSQL**. O projeto cobre desde a modelagem do banco até consultas avançadas com funções de agregação e funções de janela (Window Functions).

## Ferramentas Utilizadas
- **PostgreSQL** (Banco de dados relacional)
- **pgAdmin 4** (Interface de administração e execução de queries)
- **Git e GitHub** (Versionamento de código)

## Modelo de Dados
O banco de dados foi estruturado com 4 tabelas relacionais:
- `clientes`: Dados cadastrais e localização (estado).
- `produtos`: Catálogo de itens, categorias e preços unitários.
- `pedidos`: Registro de vendas, data e status (concluído, cancelado, pendente).
- `itens_pedido`: Detalhamento dos produtos em cada pedido (quantidade e preço de venda).

## Estrutura do Repositório
- `sql/schema.sql`: Script de criação das tabelas e chaves estrangeiras.
- `sql/seed.sql`: Script de carga de dados sintéticos (30 clientes, 20 produtos, 100 pedidos).
- `sql/queries.sql`: As 8 consultas analíticas comentadas.
- `imagens/`: Capturas de tela dos resultados das consultas.

---

## Principais Insights e Respostas

Abaixo estão as perguntas de negócio respondidas pelas queries e os principais insights extraídos.

### 1. Ticket Médio por Estado
**Insight:** O estado de **Santa Catarina (SC)** possui o maior ticket médio (R$ 224,00), superando estados com volume muito maior de vendas, como São Paulo (R$ 165,00). Isso indica que, embora SP tenha mais pedidos, os clientes de SC consomem produtos de maior valor agregado.
*(Veja o print [aqui](imagens/p1.ticket_medio.png))*

### 2. Top 10 Produtos por Receita
**Insight:** O **Tênis Running** e o **Fone Bluetooth** são os grandes campeões de receita (R$ 5.698,10 e R$ 4.797,60). Nota-se também a forte presença de itens de casa (Jogo de Toalhas e Jogo de Panelas), mostrando que o volume de vendas de itens mais baratos compensa o preço unitário menor.
*(Veja o print [aqui](imagens/p2.receita_produtos.png))*

### 3. Taxa de Cancelamento por Mês
**Insight:** Os meses de **Janeiro e Fevereiro** apresentaram a maior taxa de cancelamento (16,67%), enquanto Julho, Setembro e Dezembro tiveram **zero cancelamentos**. Uma hipótese para o início do ano é o arrependimento de compras de fim de ano ou problemas logísticos pós-festas.
*(Veja o print [aqui](imagens/p3.taxa_cancelamento.png))*

### 4. Clientes sem Compras (Oportunidade de Reativação)
**Insight:** Identificamos **5 clientes** cadastrados que nunca realizaram nenhum pedido (ex: Alice Monteiro, Bernardo Lopes). Isso representa uma oportunidade para o time de Marketing criar campanhas de e-mail com cupons de primeira compra.
*(Veja o print [aqui](imagens/p4.clientes_sem_pedido.png))*

### 5. Evolução Mensal de Pedidos (Sazonalidade)
**Insight:** Fica evidente a sazonalidade do e-commerce brasileiro. O ano começa fraco (6 pedidos em Jan/Fev), mas tem **picos expressivos em Maio (Dia das Mães) e Novembro (Black Friday)**, ambos com 12 pedidos.
*(Veja o print [aqui](imagens/p5.evolucao_mensal.png))*

### 6. Receita Média por Categoria
**Insight:** A categoria de **Eletrônicos** lidera a receita média por pedido. O cliente que compra nessa categoria tende a montar um carrinho de maior valor quando comparado às categorias de Livros ou Vestuário.
*(Veja o print [aqui](imagens/p6.receita_categoria.png))*

### 7. Top 5 Clientes (Ranking)
**Insight:** A cliente **Ana Souza** é a principal compradora (R$ 4.094,60). Percebe-se que os top 5 clientes são responsáveis por uma fatia significativa do faturamento, o que sugere a importância de criar um programa de fidelidade para reter esse público (CRM).
*(Veja o print [aqui](imagens/p7.ranking_clientes.png))*

### 8. Curva de Receita Acumulada (Running Total)
**Insight:** Até o mês de **Agosto**, a empresa já havia batido **63%** de toda a sua receita anual. Fechar o ano com 100% mostra uma curva saudável, impulsionada principalmente pelo mês de Maio e Novembro.
*(Veja o print [aqui](imagens/p8.percentual_mes.png))*

---
## Como Reproduzir este Projeto

1. Clone este repositório.
2. Abra o pgAdmin (ou seu SGBD PostgreSQL de preferência) e crie um banco de dados chamado `ecommerce_db`.
3. Execute o arquivo `sql/schema.sql` no Query Tool para criar a estrutura.
4. Execute o arquivo `sql/seed.sql` para popular o banco com os dados sintéticos.
5. Abra o arquivo `sql/queries.sql` e rode as consultas para visualizar as análises.

Ivan Wagner

# Desafio de projeto - Construindo seu Primeiro Projeto Lógico de Banco de Dados

Depois de realizar a criação do Script Sql, utilizando o MySql Workbench, persisti alguns dados de teste para entregar o que se pede a seguir:

* Recuperações simples com SELECT Statement
* Filtros com WHERE Statement
* Crie expressões para gerar atributos derivados
* Defina ordenações dos dados com ORDER BY
* Condições de filtros aos grupos – HAVING Statement
* Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados

Algumas diretrizes foram seguidas:

* Não há um mínimo de queries a serem realizadas;
* Os tópicos supracitados devem estar presentes nas queries;
* Elabore perguntas que podem ser respondidas pelas consultas;
* As cláusulas podem estar presentes em mais de uma query;

Algumas perguntas que foram propostas:

* Quantos pedidos foram feitos por cada cliente?
* Algum vendedor também é fornecedor?
* Relação de produtos fornecedores e estoques;
* Relação de nomes dos fornecedores e nomes dos produtos;



**Desafio:**

**Modelagem Lógica de Banco de Dados para E-commerce**

**Objetivo:**

- Replicar a modelagem lógica de banco de dados para um cenário de e-commerce.
- Aplicar refinamentos propostos no modelo conceitual.
- Criar consultas SQL complexas usando várias cláusulas.

**Diretrizes:**

- Definir chaves primárias e estrangeiras.
- Considerar relacionamentos do modelo EER.
- Mapear modelos para refinamentos conceituais.
- Criar script SQL para criar o esquema do banco de dados.
- Persistir dados para testes.
- Elaborar consultas SQL com as seguintes cláusulas:
  - SELECT
  - WHERE
  - Expressões para atributos derivados
  - ORDER BY
  - HAVING
  - Junções de tabelas

**Consultas SQL:**

**1. Quantidade de pedidos por cliente**

sql

SELECT cliente_id, COUNT(*) AS num_pedidos
FROM pedido
GROUP BY cliente_id
ORDER BY num_pedidos DESC;

```
**2. Vendedores que também são fornecedores**

sql

SELECT DISTINCT nome
FROM vendedor
INTERSECT
SELECT DISTINCT nome
FROM fornecedor;
```

**3. Relação de produtos, fornecedores e estoques**

sql

SELECT produto.nome AS nome_produto,
       fornecedor.nome AS nome_fornecedor,
       estoque.quantidade
FROM produto
JOIN fornecimento ON produto.id = fornecimento.produto_id
JOIN fornecedor ON fornecimento.fornecedor_id = fornecedor.id
JOIN estoque ON produto.id = estoque.produto_id;

```
**4. Nomes de fornecedores e produtos**

sql

SELECT fornecedor.nome AS nome_fornecedor,
       produto.nome AS nome_produto
FROM fornecedor
JOIN fornecimento ON fornecedor.id = fornecimento.fornecedor_id
JOIN produto ON fornecimento.produto_id = produto.id;
```

**Projeto GitHub:**

**Exploração Adicional:**

**Mapeamento de Refinamentos Conceituais**

Os refinamentos conceituais propostos foram aplicados ao modelo lógico da seguinte forma:

- **Cliente PJ e PF:** A tabela `cliente` foi alterada para incluir um atributo `tipo` que pode ser "PJ" ou "PF".
- **Pagamento:** A tabela `pagamento` foi alterada para permitir vários registros para o mesmo pedido, representando diferentes formas de pagamento.
- **Entrega:** A tabela `entrega` foi adicionada para incluir informações de status e código de rastreamento.

**Consultas SQL Complexas**

Além das consultas SQL básicas fornecidas no desafio, aqui estão algumas consultas mais complexas que demonstram o uso de várias cláusulas:

**1. Clientes que fizeram pedidos acima de um determinado valor**

sql

SELECT cliente.nome
FROM cliente
JOIN pedido ON cliente.id = pedido.cliente_id
WHERE pedido.valor_total > 100;

```
**2. Produtos mais vendidos por categoria**

sql

SELECT categoria.nome AS categoria_produto,
       produto.nome AS nome_produto,
       SUM(item_pedido.quantidade) AS quantidade_vendida
FROM categoria
JOIN produto ON categoria.id = produto.categoria_id
JOIN item_pedido ON produto.id = item_pedido.produto_id
GROUP BY categoria_produto, nome_produto
ORDER BY quantidade_vendida DESC;
```

**3. Vendas totais por vendedor e mês**

sql

SELECT vendedor.nome AS nome_vendedor,
       strftime('%Y-%m', pedido.data_pedido) AS mes_pedido,
       SUM(item_pedido.quantidade * item_pedido.valor_unitario) AS vendas_totais
FROM vendedor
JOIN pedido ON vendedor.id = pedido.vendedor_id
JOIN item_pedido ON pedido.id = item_pedido.pedido_id
GROUP BY nome_vendedor, mes_pedido
ORDER BY nome_vendedor, mes_pedido;



**O QUE ESTE DESAFIO PROPORCIONOU:****** **

**Desafio de Modelagem de Banco de Dados de E-commerce****

**Objetivo:**

- Aprimorar habilidades de modelagem lógica de banco de dados.
- Aplicar refinamentos conceituais a um modelo lógico.
- Criar consultas SQL complexas para extrair informações valiosas.

**Desenvolvimento:**

- Replicação da modelagem lógica de banco de dados para um cenário de e-commerce, considerando chaves primárias e estrangeiras, relacionamentos EER e refinamentos conceituais.
- Criação de script SQL para criar o esquema do banco de dados.
- Persistência de dados para testes.
- Elaboração de consultas SQL usando cláusulas como SELECT, WHERE, expressões derivadas, ORDER BY, HAVING e junções de tabelas.

**Aprendizado:**

- Importância de definir claramente chaves primárias e estrangeiras para garantir a integridade dos dados.
- Técnicas para mapear refinamentos conceituais para modelos lógicos.
- Uso de consultas SQL complexas para obter insights valiosos dos dados.

**Benefícios:**

- Melhor compreensão dos princípios de modelagem de banco de dados.
- Capacidade aprimorada de projetar e implementar bancos de dados eficientes e eficazes.
- Habilidade de extrair informações valiosas de grandes conjuntos de dados usando SQL.

**Conclusão:**

Este desafio forneceu uma base sólida para o desenvolvimento de habilidades avançadas de modelagem de banco de dados e análise de dados. Ao replicar a modelagem lógica, aplicar refinamentos conceituais e criar consultas SQL complexas, os alunos aprimoraram sua capacidade de projetar, implementar e analisar bancos de dados para cenários do mundo real.

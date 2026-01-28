# DOCUMENTAÇÃO

Este projeto de banco de dados tem como tema o gerenciamento de uma empresa familiar rural. Seu foco é em **controle de insumos, gastos e de produção**, **registro de vendas, produtos e clientes**  

## SUMÁRIO

1. [Contexto do banco de dados](#1-contexto-do-banco-de-dados)
2. [Modelo Logico](#2-modelo-lógico-do-banco-de-dados)
3. [Dicionário de dados](#3-dicionário-de-dados)

--- 

## 1. Contexto do Banco de dados:
- **Qual problema o banco de dados resolve?**
    - Resolve a falta de controle e organização das informações operacionais e financeiras de uma empresa familiar rural.
- **Qual o contexto do sistema (ex.: clínica, loja, escola, campeonato etc.)?**
    - O sistema está inserido no contexto de uma empresa familiar rural, que realiza atividades de produção de produtos.

- **Quem seriam os usuários do sistema?**
    - Proprietário da empresa
- **Que tipo de informação o banco armazena e por quê?** 
    1. Produtos e unidades de medida, para padronizar produção e vendas
    2. Clientes e vendas, permitindo registrar o histórico comercial
    3. Itens vendidos, detalhando quantidade e valor de cada produto por venda
    4. Produções e produtos produzidos, para acompanhar períodos produtivos e volumes gerados
    5. Insumos e gastos com insumos, possibilitando o controle de custos e análise financeira
    > Essas informações são armazenadas para garantir organização, rastreabilidade e controle financeiro, além de facilitar relatórios e análises futuras.

---

## 2. Modelo Lógico do Banco de Dados:

![Modelagem do banco de dados](image.png)


---

## 3. Dicionário de dados:

#### tb_unidade_medida
Descrição: Armazena as unidades de medida utilizadas para os produtos (ex.: KG, UNI, etc.).

| Campo       | Tipo        | Null | Key | Default | Extra          |  Descrição    |
| :--         | :--         | :--  | :-- | :--      | :--           | :--           |
| uni_codigo  | int         | NO   | PRI | NULL    | auto_increment | Chave primária              |
| uni_unidade | varchar(40) | NO   |     | NULL    |                | Informar o nome da unidade de medida             |


#### tb_produto
Descrição: Armazena os produtos fabricados pela empresa \
Chaves estrangeiras: `pro_uni_codigo`

| Campo       | Tipo        | Null | Key | Default | Extra          | Descrição    |
| :--         | :--         | :--  | :-- | :--      | :-- |      :--
| pro_codigo     | int           | NO   | PRI | NULL    | auto_increment | Chave primária
| pro_nome       | varchar(80)   | NO   |     | NULL    |                | Informar o nome do produto
| pro_uni_codigo | int           | NO   | MUL | NULL    |                | Informar código correpondente a unidade de medida do produto
| pro_preco      | decimal(10,2) | NO   |     | NULL    |                | Informar o preço unitário do produto

#### tb_itens_vendidos
Descrição: Armazena os itens vendidos em cada venda, relacionando produtos às vendas realizadas, bem como a quantidade e o valor total de cada item. \
Chave Primária Composta: (`it_pro_codigo`, `it_ven_codigo`) 


| Campo       | Tipo        | Null | Key | Default | Extra          | Descrição
| :--         | :--         | :--  | :-- | :--      | :-- | :--
| it_pro_codigo  | int           | NO   | PRI | NULL    |       | Chave estrangeira (código do produto) correspondente ao produto a ser vendido
| it_ven_codigo  | int           | NO   | PRI | NULL    |       | Chave estrangeira (código da venda) correspondente a venda a ser realizada
| it_quantidade  | int           | NO   |     | NULL    |       | Informar a quantidade de produto.
| it_valor_total | decimal(10,2) | NO   |     | NULL    |       | 


#### tb_venda

Descrição: Armazena as vendas realizadas pela empresa, registrando a data da venda e o cliente associado. \
Chaves estrangeiras: `ven_cli_codigo`


| Campo       | Tipo        | Null | Key | Default | Extra          | Descrição
| :--         | :--         | :--  | :-- | :--      | :-- | :--
| ven_codigo     | int  | NO   | PRI | NULL    | auto_increment | Chave primária
| ven_data       | date | NO   |     | NULL    |                | Informar data da venda
| ven_cli_codigo | int  | NO   | MUL | NULL    |                | Chave estrangeira (código do cliente) correspondente ao cliente que realizou a compra

#### tb_cliente

Descrição: Armazena os clientes da empresa

| Campo       | Tipo        | Null | Key | Default | Extra          | Descrição
| :--         | :--         | :--  | :-- | :--      | :-- | :--
| cli_codigo | int         | NO   | PRI | NULL    | auto_increment | Chave primária
| cli_nome   | varchar(80) | NO   |     | NULL    |                | Informar o nome do cliente


#### tb_producao

Descrição: Armazena os períodos de produção da empresa, informando a data de início e a data de término de cada produção.


| Campo       | Tipo        | Null | Key | Default | Extra          | Descrição
| :--         | :--         | :--  | :-- | :--      | :-- | :--
| prod_codigo      | int  | NO   | PRI | NULL    | auto_increment | Chave primária
| prod_data_inicio | date | NO   |     | NULL    |                | Informar data de inicio da produção
| prod_data_fim    | date | NO   |     | NULL    |                | Informar data final da produção


#### tb_producao_produto

Descrição: Armazena os produtos associados a uma produção, informando a quantidade produzida de cada produto em determinado período produtivo.\
Chaves estrangeiras: `pp_pro_codigo`, `pp_prod_codigo`

| Campo       | Tipo        | Null | Key | Default | Extra          | Descrição
| :--         | :--         | :--  | :-- | :--      | :-- | :--
| pp_codigo      | int  | NO   | PRI | NULL    | auto_increment | Chave primária
| pp_prod_codigo | int  | NO   | MUL | NULL    |                | Chave estrangeira (código da produção) correspondente ao intervalo de produção
| pp_pro_codigo  | int  | NO   | MUL | NULL    |                | Chave estrangeira (código do produto) correspondente ao produto a ser produzido
| pp_quantidade  | int  | NO   |     | NULL    |                | Informar a quantidade de produto que foi produzido.


#### tb_insumo

Descrição: Armazena os insumos necessários para o funcionamento da empresa

| Campo       | Tipo        | Null | Key | Default | Extra          | Descrição
| :--         | :--         | :--  | :-- | :--      | :-- | :--
| ins_codigo | int         | NO   | PRI | NULL    | auto_increment | Chave primária
| ins_nome   | varchar(50) | NO   |     | NULL    |                | Informar nome do insumo

#### tb_gasto_insumos

Descrição: Armazena os gastos relacionados à compra de insumos, informando quantidade, valor unitário, valor total e data da aquisição. \
Chaves estrangeiras: `gas_ins_codigo`

| Campo       | Tipo        | Null | Key | Default | Extra          | Descrição
| :--         | :--         | :--  | :-- | :--      | :-- | :--
| gas_codigo         | int           | NO   | PRI | NULL    | auto_increment | Chave primária
| gas_ins_codigo     | int           | NO   | MUL | NULL    |                | Chave estrangeira (codigo do insumo) correspondente ao insumo 
| gas_qtd_insumo     | int           | NO   |     | NULL    |                | Informar a quantidade de insumo
| gas_preco_unitario | decimal(10,2) | NO   |     | NULL    |                | Informar o preço unitario do insumo
| gas_data           | date          | NO   |     | NULL    |                | Informar a data da aquisição do insumo
| gas_valor_total    | decimal(10,2) | NO   |     | NULL    |                |
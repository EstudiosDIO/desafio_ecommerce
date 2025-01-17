
# Projeto Lógico de Banco de Dados - E-commerce

Este projeto consiste na modelagem e implementação de um banco de dados lógico para um cenário de e-commerce, atendendo a requisitos de negócios comuns nesse tipo de aplicação.

## Contexto do Projeto

O banco de dados foi projetado para gerenciar as informações de um sistema de e-commerce, incluindo:
- Cadastro de clientes Pessoa Física (PF) e Pessoa Jurídica (PJ), garantindo que cada cliente pertença exclusivamente a um desses tipos.
- Registro de múltiplas formas de pagamento para pedidos.
- Controle de entregas com status e código de rastreamento.
- Relacionamento entre produtos, fornecedores, vendedores e estoques.

## Funcionalidades Implementadas

O script SQL disponibilizado implementa:
- **Criação do Esquema de Banco de Dados:**
  - Definição de tabelas com suas respectivas chaves primárias e estrangeiras.
  - Aplicação de constraints para garantir a integridade dos dados.
- **Persistência de Dados:**
  - Inserção de dados fictícios para validação de testes.
- **Consultas SQL Complexas:**
  - Recuperação de dados utilizando `SELECT`.
  - Filtros com `WHERE` e agrupamentos com `HAVING`.
  - Ordenação dos resultados com `ORDER BY`.
  - Junções entre tabelas para fornecer insights mais complexos.

## Perguntas Respondidas pelo Banco de Dados

Com este banco de dados, é possível responder a perguntas como:
- Quantos pedidos foram feitos por cada cliente?
- Algum vendedor também é fornecedor?
- Qual a relação entre produtos, fornecedores e estoques?
- Quais fornecedores oferecem produtos específicos?

## Como Utilizar

1. Clone este repositório:
   ```bash
   git clone <url-do-repositorio>
   ```
2. Execute o script SQL para criar o banco de dados e inserir os dados:
   ```sql
   source script.sql;
   ```
3. Use ferramentas como MySQL Workbench ou outro cliente de banco de dados para executar consultas e explorar os dados.

## Arquivo Disponível

- **`script.sql`**: Contém o esquema completo do banco de dados, incluindo criação de tabelas, inserção de dados fictícios e exemplos de consultas.

## Tecnologias Utilizadas

- **Banco de Dados:** MySQL
- **Linguagem SQL**
- **Modelagem:** Modelo Entidade-Relacionamento Estendido (EER)

## Licença

Este projeto é aberto e pode ser utilizado para fins educacionais ou como referência para a criação de bancos de dados. Contribuições são bem-vindas!

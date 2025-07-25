# Loja de Games - Banco de Dados

Banco de dados SQL Server para uma loja de games, desenvolvido para gerenciar clientes, produtos, pedidos e seus itens.

## Estrutura do Banco de Dados

O sistema é composto por 4 tabelas principais:

### Game_Clientes
- Armazena informações dos clientes
- Campos:
  - `id`: Identificador único do cliente (FK, AUTO_INCREMENT)
  - `nome`: Nome do cliente
  - `email`: Email do cliente (UNIQUE)

### Game_Produtos
- Catálogo de produtos disponíveis
- Campos:
  - `id`: Identificador único do produto (AUTO_INCREMENT)
  - `nome`: Nome do produto
  - `tipo`: Categoria do produto (games, consoles, acessórios, etc)
  - `valor`: Preço do produto

### Game_Pedidos
- Registra os pedidos realizados
- Campos:
  - `id`: Identificador único do pedido (AUTO_INCREMENT)
  - `id_cliente`: Referência ao cliente que fez o pedido
  - `data`: Data e hora do pedido (TIMESTAMP)
  - `status`: Status atual do pedido (carrinho, pago, enviado)

### Game_Itens_pedido
- Detalha os itens incluídos em cada pedido
- Campos:
  - `id_pedido`: Referência ao pedido
  - `id_produto`: Referência ao produto
  - `quantidade`: Quantidade do produto
  - `valor_unitario`: Valor unitário do produto no momento da compra

## Características

- Utiliza chaves estrangeiras para garantir integridade referencial
- Implementa chave primária composta na tabela de itens do pedido
- Campos obrigatórios (NOT NULL) para dados essenciais
- Email único por cliente

## Como Usar

1. Execute o script SQL `estrutura_banco.sql` em seu servidor SQL Server
2. As tabelas serão criadas automaticamente com todas as restrições e relacionamentos
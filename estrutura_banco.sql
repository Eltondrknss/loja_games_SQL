-- Tabela para armazenar os dados dos clientes cadastrados.
-- Cada cliente possui um ID único, nome e um email que também é único.
CREATE TABLE Game_Clientes (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(200) NOT NULL,
	email VARCHAR(200) UNIQUE NOT NULL
);

-- Tabela para o catálogo de produtos.
-- Armazena todos os produtos da loja.
-- O campo 'tipo' ajuda a categorizar os produtos. (games, consoles, acessorios, etc)
CREATE TABLE Game_Produtos (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(200) NOT NULL,
	tipo VARCHAR(50) NOT NULL,
	valor DECIMAL(10,2) NOT NULL
);
	
-- Tabela principal para registrar os pedidos.
-- Cada linha é um pedido, com um status (ex: 'carrinho', 'pago', 'enviado').
-- A chave estrangeira 'id_cliente' cria o vínculo com a tabela de clientes.
CREATE TABLE Game_Pedidos (
	id INT PRIMARY KEY AUTO_INCREMENT,
	id_cliente INT NOT NULL,
	data DATETIME DEFAULT CURRENT_TIMESTAMP,
	status VARCHAR(50) DEFAULT 'carrinho',
	FOREIGN KEY (id_cliente) REFERENCES Game_Clientes(id)
);

-- Tabela associativa que detalha o conteúdo de cada pedido.
-- A Chave Primária Composta (id_pedido, id_produto) garante que um produto
-- não pode ser adicionado duas vezes no mesmo pedido como linhas diferentes.
CREATE TABLE Game_Itens_pedido (
	id_pedido INT NOT NULL,
	id_produto INT NOT NULL,
	quantidade INT NOT NULL DEFAULT 1,
	valor_unitario DECIMAL(10,2) NOT NULL,
	PRIMARY KEY (id_pedido, id_produto),
	FOREIGN KEY (id_pedido) REFERENCES Game_Pedidos(id),
	FOREIGN KEY (id_produto) REFERENCES Game_Produtos(id)
);


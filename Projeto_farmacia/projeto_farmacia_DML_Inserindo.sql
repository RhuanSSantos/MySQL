# Inserindos dados de teste

-- Tipos produtos
INSERT INTO tipos_produtos (tipo) VALUES ('Remedios');
INSERT INTO tipos_produtos (tipo) VALUES ('Cosmeticos');
INSERT INTO tipos_produtos (tipo) VALUES ('Diversos');

-- Fabricantes
INSERT INTO fabricantes (fabricante) VALUES ('Roche');
INSERT INTO fabricantes (fabricante) VALUES ('Vitalis');
INSERT INTO fabricantes (fabricante) VALUES ('Palmolive');

-- Medicos
INSERT INTO medicos (nome, crm) VALUES ('Alfredo Muniz', '123123SP');
INSERT INTO medicos (nome, crm) VALUES ('Fernando Aliva', '3423423MG');
INSERT INTO medicos (nome, crm) VALUES ('Julieta Santana', '565465C');

-- Clientes
INSERT INTO clientes (nome, endereco, telefone, cep, localidade, cpf) VALUES ('Felicity Jones','Rua da Paz, 34', '(11) 2345-8892', '34.4567-092', 'Santos', '234.789.433-23');
INSERT INTO clientes (nome, endereco, telefone, cep, localidade, cpf) VALUES ('Angelica Ramos','Rua do Ipiranga, 465', '(23) 75233-3234', '56.654-567', 'Rio de Janeiro', '354.689.231-12');
INSERT INTO clientes (nome, endereco, telefone, cep, localidade, cpf) VALUES ('Ricardo Chavez','Rua Certa, 678', '(21) 2678-3984', '12.4569-223', 'Planaltina', '786.234.443-32');

-- Produtos
INSERT INTO produtos (produto, designacao, composicao, preco_venda, id_tipo_produto, id_fabricante) VALUES ('Dipirona', 'Dores em geral', 'Metilpropileno', '12.44', 1, 1);
INSERT INTO produtos (produto, designacao, composicao, preco_venda, id_tipo_produto, id_fabricante) VALUES ('Sabonete Protex', 'Limpeza', 'cloretos', '3.56', 2, 3);
INSERT INTO produtos (produto, designacao, composicao, preco_venda, id_tipo_produto, id_fabricante) VALUES ('Protetor Solar', 'Protetor Solar', 'Soro de abacate', '90.12', 2, 1);

-- Compras
INSERT INTO compras (id_cliente, data) VALUES (1, '2025-05-08');
INSERT INTO compras (id_cliente, data) VALUES (1, '2024-06-14');
INSERT INTO compras (id_cliente, data) VALUES (2, '2023-07-25');

-- Produtos compra
INSERT INTO produtos_compra (id_compra, id_produto, quantidade) VALUES (1, 1, 2);
INSERT INTO produtos_compra (id_compra, id_produto, quantidade) VALUES (1, 2, 3);
INSERT INTO produtos_compra (id_compra, id_produto, quantidade) VALUES (2, 3, 1);

-- Receitas medicas
INSERT INTO receitas_medica (id_produtos_compra, id_medico, receita) VALUES (1, 1, 'receita1.pdf');
INSERT INTO receitas_medica (id_produtos_compra, id_medico, receita) VALUES (3, 2, 'receita2.pdf');


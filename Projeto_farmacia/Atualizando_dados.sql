-- Atualizando dados

-- Tipos produto
SELECT * FROM tipos_produtos;
UPDATE tipos_produtos SET tipo = 'Bijuterias' WHERE id = 4;


-- Produtos
SELECT * FROM produtos;
UPDATE produtos SET preco_venda = '20.49', id_tipo_produto = 2, id_fabricante = 2 WHERE id = 3;

-- Produtos Compra
SELECT * FROM produtos_compra;
UPDATE produtos_compra SET id_produto = 3, quantidade = 4 WHERE id = 3;


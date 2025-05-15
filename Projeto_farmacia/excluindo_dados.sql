-- Excluindo dados

-- Receitas medica (deletar primeiro, pois ele possui um dado que dependia de produto_compra)
SELECT * FROM receitas_medica;
DELETE FROM receitas_medica WHERE id = 2;

-- Produto compra
SELECT * FROM produtos_compra;
DELETE FROM produtos_compra WHERE id = 3;





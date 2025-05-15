# Consulta em multiplas tabelas

SELECT * FROM tipos_produto;
SELECT * FROM produtos;

-- Consulta em multíplas tabelas

SELECT p.codigo AS 'Código', p.descricao AS 'Descrição', p.preco AS 'Preço', tp.descricao AS 'Tipo Produto'
	FROM produtos AS p, tipos_produto AS tp
    WHERE codigo_tipo = tp.codigo;

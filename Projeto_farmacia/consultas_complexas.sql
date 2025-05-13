# Consulta complexa

-- compras
-- Passos 1 - Trazer as compras
SELECT * FROM compras;

-- Passo 2 - Colocar o nome dos clientes nas compras
SELECT com.id AS 'ID Compra', cli.nome AS 'Cliente', com.data AS 'Data Compra' FROM compras AS com, clientes AS cli WHERE com.id_cliente = cli.id;

-- Passo 3 - Valor Total da Compra
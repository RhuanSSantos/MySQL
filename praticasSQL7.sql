CREATE DATABASE subconsulta;

USE subconsulta;

CREATE TABLE escritorios(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	pais VARCHAR(30) NOT NULL
);

CREATE TABLE funcionarios(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    sobrenome VARCHAR(60) NOT NULL,
    id_escritorio INT NOT NULL,
    FOREIGN KEY (id_escritorio) REFERENCES escritorios(id)
);

CREATE TABLE pagamentos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT NOT NULL,
    salario DECIMAL(8,2) NOT NULL,
    data DATE NOT NULL,
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id)
);

INSERT INTO escritorios (pais) VALUES ('Brasil');
INSERT INTO escritorios (pais) VALUES ('Estados Unidos');
INSERT INTO escritorios (pais) VALUES ('Alemanha');
INSERT INTO escritorios (pais) VALUES ('França');

INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ('Pedro', 'Souza', 1);
INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ('Sandra', 'Rubin', 2);
INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ('Mikail', 'Schumer', 3);
INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ('Olivier', 'Gloçan', 4);

INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (1, '5347.55', '2025-04-28');
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (2, '9458.48', '2025-04-28');
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (3, '4669.67', '2025-04-28');
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (4, '2770.32', '2025-04-28');

# Subconsultas

-- Exemplo 1
SELECT nome, sobrenome FROM funcionarios WHERE  id_escritorio IN (SELECT id FROM escritorios WHERE pais = 'Brasil');

-- Sem subconsulta
SELECT nome, sobrenome FROM funcionarios, escritorios AS e WHERE id_escritorio = e.id AND e.pais = 'Brasil';

-- Exemplo 2

SELECT f.nome, f.sobrenome, e.pais, p.salario
	FROM pagamentos AS p, funcionarios AS f, escritorios AS e
    WHERE f.id_escritorio = e.id
		AND f.id = p.id_funcionario
        AND salario = (SELECT MAX(salario) FROM pagamentos);
        
-- Exemplo 3

SELECT f.nome, f.sobrenome, e.pais, p.salario
	FROM pagamentos AS p, funcionarios AS f, escritorios AS e
    WHERE f.id_escritorio = e.id
		AND f.id = p.id_funcionario
        AND salario < (SELECT AVG(salario) FROM pagamentos);
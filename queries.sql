-- Alter Table

ALTER TABLE pessoa 
ADD (sexo CHAR);

-- Create Index

CREATE INDEX id_lote 
ON produto (lote);

-- Insert Into

INSERT INTO funcionario (cpf,cargo,cpf_supervisor) 
VALUES ('00698199049', 'atendente', '82322846090');

-- Update

UPDATE funcionario
SET cargo = 'supervisor'
WHERE cpf = '29909148031';

-- Delete

DELETE funcionario
WHERE cpf = '00698199049';

-- Select-From-Where

SELECT * FROM dependente 
WHERE cpf_empr = '29909148031';

-- Between

SELECT cpf FROM cliente 
WHERE pontos BETWEEN 1 AND 100;

-- In

SELECT codigo FROM produto
WHERE nome IN ('sonhos','esperancas');

-- Like

SELECT codigo FROM produto
WHERE nome LIKE 'loja%';

-- Is Null || Is Not Null

SELECT codigo FROM produto
WHERE lote IS NOT NULL;

-- Inner Join

select P.nome, C.cpf, C.pontos, COUNT(V.cpf_cliente) compras
FROM cliente C
INNER JOIN pessoa P ON P.cpf = C.cpf
INNER JOIN Vende V ON V.cpf_cliente = C.cpf
GROUP BY P.nome, C.cpf, C.pontos;

-- Max

SELECT MAX (idade) FROM pessoa;
  
-- Min

SELECT MIN (pontos) FROM cliente;

-- Avg

SELECT AVG (idade) FROM pessoa;

-- Count

SELECT COUNT (*) FROM produtoFornecido;

-- Left || Right || Full Outer Join
-- Subconsulta com Operador Relacional
-- Subconsulta com In
-- Subconsulta com Any
-- Subconsulta com All
-- Order By

SELECT nome FROM pessoa
ORDER BY idade;

-- Group By

SELECT cnpj, COUNT(*) FROM produtoFornecido
GROUP BY cnpj;

-- Having

SELECT cnpj FROM produtoFornecido
GROUP BY cnpj HAVING COUNT(*) > 1;

-- Union || Intersect Minus

(SELECT cpf FROM funcionario) INTERSECT (SELECT cpf FROM vende);

-- Create View

CREATE VIEW funcComDep AS SELECT F.nome FROM funcionario F, dependente D
WHERE F.cpf = D.cpf_empr
-- Grant / Revoke

-- GRANT INSERT ON cliente TO vendedor
-- REVOKE UPDATE ON cliente FROM hackerman

-- Record
-- Table
-- Bloco Anonimo
-- Create Procedure
-- Create Function
-- %TYPE
-- %ROWTYPE
-- IF ELSIF
-- CASE WHEN
-- LOOP EXIT WHEN
-- WHILE LOOP
-- FOR IN LOOP
-- SELECT INTO
-- CURSOR (OPEN/FETCH/CLOSE)
-- EXCEPTION WHEN
-- IN OUT
-- CREATE OR REPLACE PACKAGE
-- CREATE OR REPLACE PACKAGE BODY
-- CREATE OR REPLACE TRIGGER (comando)
-- CREATE OR REPLACE TRIGGER (linha)

-- Alter Table

ALTER TABLE pessoa 
ADD (sexo CHAR);

-- Create Index



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


-- Create View
-- Grant / Revoke


-- PL

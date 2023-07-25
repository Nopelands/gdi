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
-- In
-- Like
-- Is Null || Is Not Null
-- Inner Join
-- Max
-- Min
-- Avg
-- Count
-- Left || Right || Full Outer Join
-- Subconsulta com Operador Relacional
-- Subconsulta com In
-- Subconsulta com Any
-- Subconsulta com All
-- Order By
-- Group By
-- Having
-- Union || Intersect Minus
-- Create View
-- Grant / Revoke


-- PL

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

SELECT produto.nome, produto.lote, produtofornecido.cnpj
FROM produto
LEFT JOIN produtofornecido
ON produto.codigo = produtofornecido.codigo
ORDER BY produto.nome;

-- Subconsulta com Operador Relacional

SELECT cpf FROM cliente
WHERE cpf IN (SELECT cpf_cliente FROM vende 
WHERE data_e_hora <= to_date('2023-06-30','yyyy-mm-dd'));

-- Subconsulta com In

SELECT nome_da_empresa FROM fornecedor
WHERE cnpj IN (SELECT cnpj FROM produtofornecido
WHERE codigo IN ('4379', '1380', '64199'));

-- Subconsulta com Any

SELECT nome_da_empresa FROM fornecedor
WHERE cnpj = ANY
(SELECT cnpj FROM produtoFornecido WHERE codigo = '60649');

-- Subconsulta com All

SELECT nome_da_empresa FROM fornecedor
WHERE cnpj = ALL
(SELECT cnpj FROM produtoFornecido WHERE codigo = '61727');

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

DECLARE
  -- Definindo um registro (record) com campos correspondentes à tabela 'pessoa'
  TYPE pessoa_record IS RECORD (
    cpf pessoa.cpf%TYPE,
    nome pessoa.nome%TYPE,
    rua pessoa.rua%TYPE,
    numero pessoa.numero%TYPE,
    complemento pessoa.complemento%TYPE,
    cep pessoa.cep%TYPE,
    idade pessoa.idade%TYPE
  );

  -- Declarando uma variável do tipo 'pessoa_record'
  pessoa_rec pessoa_record;
BEGIN
  -- Atribuindo valores ao registro 'pessoa_rec'
  pessoa_rec.cpf := '00698199049';
  pessoa_rec.nome := 'João da Silva';
  pessoa_rec.rua := 'Rua A';
  pessoa_rec.numero := 34;
  pessoa_rec.complemento := NULL;
  pessoa_rec.cep := '55158530';
  pessoa_rec.idade := 35;

  -- Exemplo de uso do registro
  DBMS_OUTPUT.PUT_LINE('Nome: ' || pessoa_rec.nome);
END;


-- Table

DECLARE
  -- Criando um tipo de tabela para armazenar dados de clientes
  TYPE cliente_table IS TABLE OF cliente%ROWTYPE;

  -- Declarando uma variável do tipo 'cliente_table'
  clientes cliente_table;
BEGIN
  -- Selecionando dados da tabela 'cliente' e armazenando no tipo de tabela 'clientes'
  SELECT * BULK COLLECT INTO clientes FROM cliente;

  -- Percorrendo os registros da tabela 'clientes'
  FOR i IN 1..clientes.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('Cliente: ' || clientes(i).nome || ', CPF: ' || clientes(i).cpf);
  END LOOP;
END;


-- Bloco Anonimo

BEGIN
  -- Bloco de código anônimo
  DBMS_OUTPUT.PUT_LINE('Olá, mundo!');
END;


-- Create Procedure

CREATE OR REPLACE PROCEDURE aumentar_pontos (p_cpf VARCHAR2, p_pontos NUMBER) AS
  -- Declarações de variáveis locais (se necessário)
BEGIN
  -- Lógica do procedimento para aumentar os pontos de um cliente pelo CPF
  UPDATE cliente SET pontos = pontos + p_pontos WHERE cpf = p_cpf;
  COMMIT;
END;


-- Create Function

CREATE OR REPLACE FUNCTION calcular_idade (p_cpf VARCHAR2) RETURN NUMBER AS
  v_idade NUMBER;
BEGIN
  -- Lógica da função para calcular a idade de uma pessoa pelo CPF
  SELECT idade INTO v_idade FROM pessoa WHERE cpf = p_cpf;
  RETURN v_idade;
END;


-- %TYPE

DECLARE
  v_nome pessoa.nome%TYPE;
BEGIN
  -- Atribuindo valor à variável usando o tipo de dado da coluna 'nome' da tabela 'pessoa'
  v_nome := 'João da Silva';

  -- Exemplo de uso da variável
  DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome);
END;

-- %ROWTYPE

DECLARE
  v_cliente cliente%ROWTYPE;
BEGIN
  -- Selecionando um registro da tabela 'cliente' e armazenando na variável 'v_cliente'
  SELECT * INTO v_cliente FROM cliente WHERE cpf = '00698199049';

  -- Exemplo de uso da variável
  DBMS_OUTPUT.PUT_LINE('Cliente: ' || v_cliente.nome || ', CPF: ' || v_cliente.cpf);
END;

-- IF ELSIF

DECLARE
  v_idade NUMBER := 25;
BEGIN
  -- Verificando a idade da pessoa
  IF v_idade < 18 THEN
    DBMS_OUTPUT.PUT_LINE('Menor de idade.');
  ELSIF v_idade >= 18 AND v_idade < 60 THEN
    DBMS_OUTPUT.PUT_LINE('Adulto.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Idoso.');
  END IF;
END;

-- CASE WHEN

DECLARE
  v_cargo funcionario.cargo%TYPE := 'gerente';
BEGIN
  -- Utilizando CASE para determinar o tipo de cargo e exibir uma mensagem correspondente
  CASE v_cargo
    WHEN 'gerente' THEN
      DBMS_OUTPUT.PUT_LINE('Cargo: Gerente');
    WHEN 'supervisor' THEN
      DBMS_OUTPUT.PUT_LINE('Cargo: Supervisor');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Cargo: Atendente');
  END CASE;
END;

-- LOOP EXIT WHEN

DECLARE
  v_contador NUMBER := 1;
BEGIN
  -- Loop para exibir valores de 1 a 5
  LOOP
    EXIT WHEN v_contador > 5;
    DBMS_OUTPUT.PUT_LINE('Valor: ' || v_contador);
    v_contador := v_contador + 1;
  END LOOP;
END;

-- WHILE LOOP

DECLARE
  v_contador NUMBER := 1;
BEGIN
  -- Loop WHILE para exibir valores de 1 a 5
  WHILE v_contador <= 5 LOOP
    DBMS_OUTPUT.PUT_LINE('Valor: ' || v_contador);
    v_contador := v_contador + 1;
  END LOOP;
END;

-- FOR IN LOOP

DECLARE
  v_total_pontos NUMBER := 0;
BEGIN
  -- Loop FOR IN para calcular o total de pontos dos clientes
  FOR c IN (SELECT pontos FROM cliente) LOOP
    v_total_pontos := v_total_pontos + c.pontos;
  END LOOP;

  -- Exibindo o resultado
  DBMS_OUTPUT.PUT_LINE('Total de Pontos: ' || v_total_pontos);
END;

-- SELECT INTO

DECLARE
  v_nome cliente.nome%TYPE;
BEGIN
  -- Selecionando o nome de um cliente pelo CPF e armazenando na variável 'v_nome'
  SELECT nome INTO v_nome FROM cliente WHERE cpf = '00698199049';

  -- Exemplo de uso da variável
  DBMS_OUTPUT.PUT_LINE('Nome do cliente: ' || v_nome);
END;

-- CURSOR (OPEN/FETCH/CLOSE)

DECLARE
  -- Declarando um cursor para selecionar dados da tabela 'cliente'
  CURSOR c_clientes IS
    SELECT nome, cpf FROM cliente;
  
  -- Declarando variáveis para armazenar os valores do cursor
  v_nome cliente.nome%TYPE;
  v_cpf cliente.cpf%TYPE;
BEGIN
  -- Abrindo o cursor
  OPEN c_clientes;

  -- Loop para percorrer os registros do cursor
  LOOP
    FETCH c_clientes INTO v_nome, v_cpf;
    EXIT WHEN c_clientes%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Cliente: ' || v_nome || ', CPF: ' || v_cpf);
  END LOOP;

  -- Fechando o cursor
  CLOSE c_clientes;
END;

-- EXCEPTION WHEN

DECLARE
  v_total NUMBER;
BEGIN
  -- Bloco que pode gerar uma exceção (divisão por zero)
  v_total := 10 / 0;

EXCEPTION
  -- Tratando a exceção de divisão por zero
  WHEN ZERO_DIVIDE THEN
    DBMS_OUTPUT.PUT_LINE('Erro: Divisão por zero!');
END;

-- IN OUT

CREATE OR REPLACE PROCEDURE obter_cliente(IN p_cpf VARCHAR2, OUT p_nome cliente.nome%TYPE) AS
BEGIN
  -- Selecionando o nome de um cliente pelo CPF e retornando através do parâmetro OUT
  SELECT nome INTO p_nome FROM cliente WHERE cpf = p_cpf;
END;

-- CREATE OR REPLACE PACKAGE

CREATE OR REPLACE PACKAGE minha_package AS
  -- Declarando tipos, constantes, procedimentos e funções
  TYPE cliente_record IS RECORD (
    cpf cliente.cpf%TYPE,
    nome cliente.nome%TYPE,
    pontos cliente.pontos%TYPE
  );
  
  PROCEDURE aumentar_pontos(p_cpf VARCHAR2, p_pontos NUMBER);
  FUNCTION calcular_idade(p_cpf VARCHAR2) RETURN NUMBER;
END minha_package;

-- CREATE OR REPLACE PACKAGE BODY

CREATE OR REPLACE PACKAGE BODY minha_package AS
  PROCEDURE aumentar_pontos(p_cpf VARCHAR2, p_pontos NUMBER) AS
  BEGIN
    -- Lógica para aumentar os pontos de um cliente pelo CPF
    UPDATE cliente SET pontos = pontos + p_pontos WHERE cpf = p_cpf;
    COMMIT;
  END;

  FUNCTION calcular_idade(p_cpf VARCHAR2) RETURN NUMBER AS
    v_idade NUMBER;
  BEGIN
    -- Lógica para calcular a idade de uma pessoa pelo CPF
    SELECT idade INTO v_idade FROM pessoa WHERE cpf = p_cpf;
    RETURN v_idade;
  END;
END minha_package;

-- CREATE OR REPLACE TRIGGER (comando)

CREATE OR REPLACE TRIGGER meu_trigger
BEFORE INSERT ON cliente
FOR EACH ROW
BEGIN
  -- Lógica do trigger antes de inserir um novo cliente
  IF :NEW.idade < 18 THEN
    raise_application_error(-20001, 'Cliente deve ser maior de idade.');
  END IF;
END;

-- CREATE OR REPLACE TRIGGER (linha)

CREATE OR REPLACE TRIGGER meu_trigger
BEFORE INSERT ON cliente
FOR EACH ROW
BEGIN
  -- Lógica do trigger antes de inserir um novo cliente
  IF :NEW.idade < 18 THEN
    raise_application_error(-20001, 'Cliente deve ser maior de idade.');
  END IF;
END;

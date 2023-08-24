-- Telefone
CREATE OR REPLACE TYPE tp_telefone AS OBJECT(
  numero VARCHAR2(11)
);
/
  
CREATE OR REPLACE TYPE tp_array_telefone AS VARRAY(3) OF tp_telefone;
/

-- Pessoa
CREATE OR REPLACE TYPE tp_pessoa AS OBJECT(
  cpf VARCHAR2(11),
  nome VARCHAR2(50),
  rua VARCHAR2(40),
  numero NUMBER,
  complemento VARCHAR2(30),
  cep VARCHAR(8),
  idade NUMBER,
  telefone tp_array_telefone,
  FINAL MEMBER FUNCTION mediaIdade RETURN NUMBER,
  MEMBER PROCEDURE detalhesPessoa (SELF tp_pessoa)
) NOT FINAL NOT INSTANTIABLE;
/
  
CREATE OR REPLACE TYPE BODY tp_pessoa AS	
  -- Retorna Media das idades
  FINAL MEMBER FUNCTION mediaIdade RETURN NUMBER IS
  BEGIN
    RETURN AVG(idade);
  END;

  -- Retorna os detalhes da pessoa
  MEMBER PROCEDURE detalhesPessoa (SELF tp_pessoa) IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Detalhes da Pessoa:');
    DBMS_OUTPUT.PUT_LINE('CPF: '|| cpf);
    DBMS_OUTPUT.PUT_LINE('Nome: '|| nome);
    DBMS_OUTPUT.PUT_LINE('Idade: '||to_char(idade));
  END;
END;
/

-- Dependente
CREATE OR REPLACE TYPE tp_dependente AS OBJECT(
  nome_completo VARCHAR2(50),
  ORDER MEMBER FUNCTION ordenaDependente(D tp_dependente) RETURN INTEGER
);
/

CREATE OR REPLACE TYPE BODY tp_dependente AS
  ORDER MEMBER FUNCTION ordenaDependente(D tp_dependente) RETURN INTEGER IS
  selfID VARCHAR2(250) := SELF.nome_completo;
  otherID VARCHAR2(250) := D.nome_completo;
  BEGIN
    IF (selfID > otherID) THEN
      RETURN 1;
    END IF;
    IF (selfID = otherID) THEN
      RETURN 0;
    END IF;
    RETURN -1;
  END;

END;
/

-- Nested Table Dependente
CREATE OR REPLACE TYPE nt_dependente_funcionario AS TABLE OF tp_dependente
/
	
-- Funcionario
CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa(
  cargo VARCHAR2(10),
  cpf_supervisor REF tp_funcionario,
  dependentes nt_dependente_funcionario,
  OVERRIDING MEMBER PROCEDURE detalhesPessoa (SELF tp_funcionario)
);
/

CREATE OR REPLACE TYPE BODY tp_funcionario AS
  OVERRIDING MEMBER PROCEDURE detalhesPessoa (SELF tp_funcionario) IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Detalhes do Funcionario:');
    DBMS_OUTPUT.PUT_LINE('CPF: '|| cpf);
    DBMS_OUTPUT.PUT_LINE('Nome: '|| nome);
    DBMS_OUTPUT.PUT_LINE('Cargo: '|| cargo);
    DBMS_OUTPUT.PUT_LINE('Idade: '||to_char(idade));
  END;
END;
/

-- Cliente
CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa(
  id_pontos NUMBER,
  pontos NUMBER
); 
/

-- Produto
-- Fornecedor
-- ProdutoFornecido (colocar constructor function)
-- Reabastece
-- Vende

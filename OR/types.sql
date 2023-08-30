-- Telefone
CREATE OR REPLACE TYPE tp_telefone AS OBJECT(
  numero VARCHAR2(11)
);
/
 
-- VARRAY Telefone
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
  FINAL MEMBER FUNCTION quantidadeTelefones RETURN NUMBER,
  MAP MEMBER FUNCTION anoDeNascimento RETURN NUMBER,
  MEMBER PROCEDURE detalhesPessoa (SELF tp_pessoa)
) NOT FINAL NOT INSTANTIABLE;
/

-- Pessoa Type Body
CREATE OR REPLACE TYPE BODY tp_pessoa AS	
  -- Retorna a quantidade de telefones por pessoa
  FINAL MEMBER FUNCTION quantidadeTelefones RETURN NUMBER IS
  BEGIN
    RETURN telefone.COUNT;
  END;
  
  -- Retorna o ano de nascimento da pessoa
  MAP MEMBER FUNCTION anoDeNascimento RETURN NUMBER IS
  BEGIN
    RETURN 2023 - idade;
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

-- Dependente Type Body
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
  dependente nt_dependente_funcionario,
  OVERRIDING MEMBER PROCEDURE detalhesPessoa (SELF tp_funcionario)
);
/

-- Funcionario Type Body
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
CREATE OR REPLACE TYPE tp_produto AS OBJECT(
  codigo NUMBER,
  nome VARCHAR2(30),
  lote VARCHAR2(30)
);
/

-- Alter Type Produto
ALTER TYPE tp_produto MODIFY ATTRIBUTE nome VARCHAR2(40) CASCADE;
/

-- Fornecedor
CREATE OR REPLACE TYPE tp_fornecedor AS OBJECT(
  cnpj VARCHAR2(14),
  nome_da_empresa VARCHAR2(50)
);
/

-- ProdutoFornecido
CREATE OR REPLACE TYPE tp_produtoFornecido AS OBJECT(
  cnpj REF tp_fornecedor,
  codigo REF tp_produto,
  CONSTRUCTOR FUNCTION tp_produtoFornecido(
    cnpj REF tp_fornecedor,
	  codigo REF tp_produto
  ) RETURN SELF AS RESULT
);
/

-- produtoFornecido Type Body
CREATE OR REPLACE TYPE BODY tp_produtoFornecido AS
  CONSTRUCTOR FUNCTION tp_produtoFornecido(
    cnpj REF tp_fornecedor,
    codigo REF tp_produto
  ) RETURN SELF AS RESULT IS
  BEGIN
    SELF.cnpj := cnpj;
    SELF.codigo := codigo;
    RETURN;
  END;
END;
/

-- Reabastece
CREATE OR REPLACE TYPE tp_reabastece AS OBJECT(
  produtoFornecido tp_produtoFornecido,
  cpf REF tp_funcionario
);
/

-- Vende
CREATE OR REPLACE TYPE tp_vende AS OBJECT(
  cpf REF tp_funcionario,
  cpf_cliente REF tp_cliente,
  codigo REF tp_produto,
  data_e_hora DATE
);
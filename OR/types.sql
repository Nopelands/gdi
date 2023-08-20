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
  idade NUMBER
  telefone tp_array_telefone,
  FINAL MEMBER FUNCTION mediaIdade RETURN NUMBER,
  MEMBER PROCEDURE detalhesPessoa (SELF tp_pessoa)
) NOT FINAL NOT INSTANTIABLE;
/
  
CREATE OR REPLACE TYPE BODY tp_pessoa AS
  FINAL MEMBER FUNCTION mediaIdade RETURN NUMBER IS
  BEGIN
    RETURN AVG(idade);
  END;

  MEMBER PROCEDURE detalhesPessoa (SELF tp_pessoa) IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Detalhes da Pessoa:');
		DBMS_OUTPUT.PUT_LINE('CPF:'|| cpf);
		DBMS_OUTPUT.PUT_LINE('Nome: '|| nome);
		DBMS_OUTPUT.PUT_LINE('Idade: '||to_char(idade));
  END;

End;
/


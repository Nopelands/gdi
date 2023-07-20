DROP TABLE pessoa;
DROP TABLE telefone;
DROP TABLE funcionario;
DROP TABLE cliente;
DROP TABLE produto;
DROP TABLE fornecedor;
DROP TABLE dependente;
DROP TABLE produtoFornecido;
DROP TABLE reabastece;
DROP TABLE vende;

CREATE TABLE pessoa (
  cpf VARCHAR2(11) NOT NULL,
  nome VARCHAR2(50) NOT NULL,
  rua VARCHAR2(40) NOT NULL,
  numero NUMBER NOT NULL,
  complemento VARCHAR2(30), NOT NULL,
  cep VARCHAR2(8) NOT NULL,
  idade NUMBER NOT NULL
  CONSTRAINT pessoa_pk PRIMARY KEY (cpf)
);

CREATE TABLE telefone (
  cpf VARCHAR2(11) NOT NULL,
  telefone VARCHAR2(11) NOT NULL,
  CONSTRAINT telefone_pk PRIMARY KEY (cpf,telefone),
  CONSTRAINT telefone_cpf_fk FOREIGN KEY (cpf) REFERENCES pessoa(cpf)
);

CREATE TABLE funcionario (
  
);

CREATE TABLE cliente (
  
);

CREATE TABLE produto (
  
);

CREATE TABLE fornecedor (
  
);

CREATE TABLE dependente (
  nome_completo VARCHAR2(50),
  cpf_empr VARCHAR2(11),
  CONSTRAINT dependente_pk PRIMARY KEY (cpf_empr,nome_completo),
  CONSTRAINT dependente_fk FOREIGN KEY (cpf_empr) REFERENCES funcionario(cpf)
);

CREATE TABLE produtoFornecido (
  
);

CREATE TABLE reabastece (
  
);

CREATE TABLE vende (
  
);

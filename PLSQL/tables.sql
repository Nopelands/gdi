DROP TABLE vende;
DROP TABLE reabastece;
DROP TABLE produtoFornecido;
DROP TABLE dependente;
DROP TABLE fornecedor;
DROP TABLE produto;
DROP TABLE cliente;
DROP TABLE funcionario;
DROP TABLE telefone;
DROP TABLE pessoa;

-- Pessoa
CREATE TABLE pessoa (
  cpf VARCHAR2(11) NOT NULL,
  nome VARCHAR2(50) NOT NULL,
  rua VARCHAR2(40) NOT NULL,
  numero NUMBER NOT NULL,
  complemento VARCHAR2(30),
  cep VARCHAR2(8) NOT NULL,
  idade NUMBER NOT NULL,
  CONSTRAINT pessoa_pk PRIMARY KEY (cpf)
);

-- Telefone
CREATE TABLE telefone (
  cpf VARCHAR2(11) NOT NULL,
  telefone VARCHAR2(11) NOT NULL,
  CONSTRAINT telefone_pk PRIMARY KEY (cpf,telefone),
  CONSTRAINT telefone_cpf_fk FOREIGN KEY (cpf) REFERENCES pessoa(cpf)
);

-- Funcionário
CREATE TABLE funcionario (
  cpf VARCHAR2(11),
  cargo VARCHAR2(10),
  cpf_supervisor VARCHAR2(11),
  CONSTRAINT funcionario_pk PRIMARY KEY (cpf),
  CONSTRAINT funcionario_pessoa_fk FOREIGN KEY (cpf) REFERENCES pessoa(cpf),
  CONSTRAINT funcionario_funcionario_fk FOREIGN KEY (cpf_supervisor) REFERENCES funcionario(cpf),
  CONSTRAINT funcionario_ck CHECK (cargo IN ('gerente','supervisor','atendente'))
);

-- Cliente
CREATE TABLE cliente (
  cpf VARCHAR2(11),
  id_pontos NUMBER,
  pontos NUMBER,
  CONSTRAINT cliente_pk PRIMARY KEY (cpf),
  CONSTRAINT cliente_pessoa_fk FOREIGN KEY (cpf) REFERENCES pessoa(cpf)
);

-- Produto
CREATE TABLE produto (
  codigo NUMBER NOT NULL,
  nome VARCHAR2(30) NOT NULL,
  lote VARCHAR2(30) NOT NULL,
  CONSTRAINT produto_pk PRIMARY KEY (codigo)
);

-- Fornecedor
CREATE TABLE fornecedor (
  cnpj VARCHAR2(14) NOT NULL,
  nome_da_empresa VARCHAR2(50) NOT NULL,
  CONSTRAINT fornecedor_pk PRIMARY KEY (cnpj)
);

-- Dependente
CREATE TABLE dependente (
  nome_completo VARCHAR2(50) NOT NULL,
  cpf_empr VARCHAR2(11) NOT NULL,
  CONSTRAINT dependente_pk PRIMARY KEY (cpf_empr,nome_completo),
  CONSTRAINT dependente_fk FOREIGN KEY (cpf_empr) REFERENCES funcionario(cpf)
);

-- Produto Fornecido
CREATE TABLE produtoFornecido (
  cnpj VARCHAR2(14) NOT NULL,
  codigo NUMBER NOT NULL,
  CONSTRAINT produtoFornecido_pk PRIMARY KEY (cnpj,codigo),
  CONSTRAINT produtoFornecido_fornecedor_fk FOREIGN KEY (cnpj) REFERENCES fornecedor(cnpj),
  CONSTRAINT produtoFornecido_produto_fk FOREIGN KEY (codigo) REFERENCES produto(codigo)
);

-- Reabastece
CREATE TABLE reabastece (
  cnpj VARCHAR2(14),
  codigo NUMBER,
  cpf VARCHAR2(11),
  CONSTRAINT reabastece_pk PRIMARY KEY (cnpj,codigo,cpf),
  CONSTRAINT reabastece_fornecedor_fk FOREIGN KEY (cnpj) REFERENCES fornecedor(cnpj),
  CONSTRAINT reabastece_produto_fk FOREIGN KEY (codigo) REFERENCES produto(codigo),
  CONSTRAINT reabastece_funcionario_fk FOREIGN KEY (cpf) REFERENCES funcionario(cpf)
);

-- Vende
CREATE TABLE vende (
  cpf VARCHAR2(11) NOT NULL,
  cpf_cliente VARCHAR2(11) NOT NULL,
  codigo NUMBER NOT NULL,
  data_e_hora DATE NOT NULL,
  CONSTRAINT vende_pk PRIMARY KEY (codigo,data_e_hora),
  CONSTRAINT vende_funcionario_fk FOREIGN KEY (cpf) REFERENCES funcionario(cpf),
  CONSTRAINT vende_cliente_fk FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf),
  CONSTRAINT vende_produto_fk FOREIGN KEY (codigo) REFERENCES produto(codigo)
);

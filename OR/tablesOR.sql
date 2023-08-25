-- Funcionario
CREATE TABLE funcionario OF tp_funcionario (
  cpf PRIMARY KEY,
  cargo NOT NULL
) NESTED TABLE dependente STORE AS dependente;
/

-- Cliente
CREATE TABLE cliente OF tp_cliente (
  cpf PRIMARY KEY,
  id_pontos NOT NULL,
  pontos NOT NULL
);
/

-- Produto
CREATE TABLE produto OF tp_produto (
  codigo PRIMARY KEY,
  nome NOT NULL,
  lote NOT NULL
);
/

-- Fornecedor
CREATE TABLE fornecedor OF tp_fornecedor (
  cnpj PRIMARY KEY,
  nome_da_empresa NOT NULL
);
/

-- ProdutoFornecido
CREATE TABLE produtoFornecido OF tp_produtoFornecido (
  cnpj WITH ROWID REFERENCES fornecedor,
  codigo WITH ROWID REFERENCES produto
);
/

-- Reabastece
CREATE TABLE reabastece OF tp_reabastece (
  cpf WITH ROWID REFERENCES funcionario
);
/

-- Vende
CREATE TABLE vende OF tp_vende (
  cpf WITH ROWID REFERENCES funcionario,
  cpf_cliente SCOPE IS cliente,
  codigo WITH ROWID REFERENCES produto,
  data_e_hora NOT NULL
);
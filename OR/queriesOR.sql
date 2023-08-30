/* Checklist
      SELECT REF 
      SELECT DEREF 
      CONSULTA À VARRAY 
      CONSULTA À NESTED TABLE
*/

-- Consultas padrão --

-- retorna os dados dos funcionários supervisores
SELECT cpf, nome, idade, cep, numero
FROM funcionario
WHERE cargo = 'supervisor';

-- Retorna os dados do cliente que possui mais de 9 pontos
SELECT cpf, nome, id_pontos AS id, pontos AS quantidade_pontos
FROM cliente
WHERE pontos >= 10;

-- Retorna o nome e o lote do produto com os códigos especificados
SELECT nome, lote
FROM produto
WHERE codigo IN (3, 7);

-- Retorna a quantidade de funcionários que moram na mesma rua
SELECT COUNT(rua)
FROM funcionario
WHERE rua = 'Rua A';

-- Consultas com DEREF --

-- Retorna as vendas feitas pelo funcionário especificado
SELECT DEREF(V.cpf).cpf AS funcionario, DEREF(V.cpf_cliente).cpf AS cliente, DEREF(V.codigo).codigo AS produto, data_e_hora
FROM vende V
WHERE DEREF(V.cpf).cpf = '09000676401';

-- Retorna o nome da empresa que fornece o produto especificado
SELECT nome_da_empresa
FROM fornecedor
WHERE cnpj IN 
(SELECT DEREF(P.cnpj).cnpj FROM produtoFornecido P WHERE DEREF(P.codigo).codigo = 08);

-- Consulta à VARRAY --

-- Retorna o nome, cpf e os telefones de cada funcionário
SELECT nome, cpf, T.* FROM funcionario A, TABLE(A.telefone) T;

-- Retorna o cpf e os telefones de cada cliente
SELECT cpf, T.* FROM cliente A, TABLE(A.telefone) T;

-- Consulta à NESTED TABLE --

-- Retorna os dependentes de um funcionário
SELECT * FROM TABLE (SELECT D.dependente FROM funcionario D WHERE D.cpf = '44718993415');

-- Consulta às funções --

-- FINAL MEMBER FUNCTION quantidadeTelefones
SELECT A.quantidadeTelefones() AS quantidade_de_Telefones 
FROM funcionario A WHERE A.cpf = '09000676401';

SELECT B.quantidadeTelefones() AS quantidade_de_Telefones 
FROM funcionario B WHERE B.cpf = '20442555024';

-- MAP MEMBER FUNCTION anoDeNascimento

-- MEMBER PROCEDURE detalhesPessoa

-- ORDER MEMBER FUNCTION ordenaDependente

-- CONSTRUCTOR FUNCTION tp_produtoFornecido
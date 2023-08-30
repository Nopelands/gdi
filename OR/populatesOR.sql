-- Funcionario
INSERT INTO funcionario VALUES (
  '68493475009',
  'Maria Souza',
  'Avenida B',
  87,
  'Apt 154',
  '22715320',
  28,
  (tp_array_telefone(tp_telefone('51445667415'))),
  'supervisor',
  NULL,
  NULL
);
/

INSERT INTO funcionario VALUES (
  '11111111111',
  'Rafael',
  'Rua A',
  16,
  NULL,
  '55534356',
  35,
  (tp_array_telefone(tp_telefone('51515676741'), tp_telefone('51515676744'))),
  'atendente',
  (SELECT REF(F) FROM funcionario F WHERE F.cpf = '68493475009'), 
  nt_dependente_funcionario(tp_dependente('Rafaela'))
);
/

INSERT INTO funcionario VALUES (
  '00698199049',
  'João da Silva',
  'Rua A',
  34,
  NULL,
  '55158530',
  35,
  (tp_array_telefone(tp_telefone('48762903004'))),
  'atendente',
  (SELECT REF(F) FROM funcionario F WHERE F.cpf = '68493475009'),
  nt_dependente_funcionario(tp_dependente('Jorge'), tp_dependente('João'))
);
/

INSERT INTO funcionario VALUES (
  '20442555024',
  'Ana Oliveira',
  'Rua B',
  90,
  NULL,
  '29100181',
  51,
  (tp_array_telefone(tp_telefone('81934325747'), tp_telefone('81935331027'))),
  'gerente',
  NULL,
  NULL
);
/

INSERT INTO funcionario VALUES (
  '67575259090',
  'Pedro Santos',
  'Rua A',
  958,
  'Casa 2',
  '55158530',
  37,
  (tp_array_telefone(tp_telefone('81928243556'))),
  'supervisor',
  (SELECT REF(F) FROM funcionario F WHERE F.cpf = '20442555024'),
  nt_dependente_funcionario(tp_dependente('Raissa'))
);
/

INSERT INTO funcionario VALUES (
  '32034627024',
  'Guilherme',
  'Rua C',
  56,
  NULL,
  '68373150',
  23,
  (tp_array_telefone(tp_telefone('87924483636'))),
  'atendente',
  (SELECT REF(F) FROM funcionario F WHERE F.cpf = '67575259090'),
  NULL
);
/

INSERT INTO funcionario VALUES (
  '09000676401',
  'Bruno',
  'Rua D',
  60,
  'apt 45',
  '68373150',
  36,
  (tp_array_telefone(tp_telefone('87937905287'), tp_telefone('87928580059'), tp_telefone('87938124751'))),
  'atendente',
  (SELECT REF(F) FROM funcionario F WHERE F.cpf = '20442555024'),
  NULL
);
/

INSERT INTO funcionario VALUES (
  '44718993415',
  'Luiz',
  'Rua A',
  37,
  NULL,
  '55158530',
  27,
  (tp_array_telefone(tp_telefone('81922623925'))),
  'atendente',
  (SELECT REF(F) FROM funcionario F WHERE F.cpf = '68493475009'),
  nt_dependente_funcionario(tp_dependente('Michel'))
);
/

-- Cliente
-- Joaquin
INSERT INTO cliente VALUES (
  '7777777777', 
  'Joaquin', 
  'Rua Joaquin Nabuco', 
  128, 
  'Casa', 
  '12345123', 
  29,
  (tp_array_telefone(tp_telefone('81111111111'))), 
  01, 
  10
);
/
    
-- Rebeca
INSERT INTO cliente VALUES (
  '6666666666', 
  'Rebeca', 
  'Rua das Flores', 
  123, 
  'Apartamento 4A', 
  '12345678', 
  20,
  (tp_array_telefone(tp_telefone('12345678900'))), 
  02, 
  0
);
/
    
-- Fernanda
INSERT INTO cliente VALUES (
  '5555555555', 
  'Fernanda', 
  'Avenida dos Girassóis', 
  128, 
  'Casa', 
  '12345123', 
  25,
  (tp_array_telefone(tp_telefone('98765432100'))), 
  03, 
  5
);
/
    
-- João Victor
INSERT INTO cliente VALUES (
  '4444444444', 
  'João Victor', 
  'Travessa das Palmeiras', 
  128, 
  'Casa', 
  '12345123', 
  28,
  (tp_array_telefone(tp_telefone('55555588888'))), 
  04, 
  15
);
/


-- Silvio
INSERT INTO cliente VALUES (
  '1212121212',
  'Silvio',
  'Rua do Comércio',
  42,
  'Loja 5',
  '98765432',
  35,
  (tp_array_telefone(tp_telefone('55555555555'))),
  15,
  100
);
/

-- Produto
-- Produto Sabão
INSERT INTO produto VALUES (
  01,
  'Sbone Dove',
  'Lote12345'
);
/

-- Produto 02
INSERT INTO produto VALUES (
  02,
  'Shampoo Anticaspa Clear',
  'Lote23456'
);
/

-- Produto 03
INSERT INTO produto VALUES (
  03,
  'Condicionador Pantene Pro-V',
  'Lote34567'
);
/

-- Produto 04
INSERT INTO produto VALUES (
  04,
  'Creme Hidratante Nivea Soft',
  'Lote45678'
);
/

-- Produto 05
INSERT INTO produto VALUES (
  05,
  'Creme Dental Colgate Total 12',
  'Lote56789'
);
/

-- Produto 06
INSERT INTO produto VALUES (
  06,
  'Desodorante Axe Dark Temptation',
  'Lote67890'
);
/

-- Produto 07
INSERT INTO produto VALUES (
  07,
  'Saboneteira de Parede',
  'Lote78901'
);
/

-- Produto 08
INSERT INTO produto VALUES (
  08,
  'Barbeador Elétrico Philips Series 5000',
  'Lote89012'
);
/

-- Produto 09
INSERT INTO produto VALUES (
  09,
  'Secador de Cabelo Taiff',
  'Lote90123'
);
/

-- Produto 10
INSERT INTO produto VALUES (
  10,
  'Fone de Ouvido Bluetooth JBL',
  'Lote10101'
);
/

-- Produto 11
INSERT INTO produto VALUES (
  11,
  'Óculos de Sol Ray-Ban Aviador',
  'Lote11111'
);
/

-- Produto 12
INSERT INTO produto VALUES (
  12,
  'Tênis Adidas Ultraboost',
  'Lote12121'
);
/

-- Produto 13
INSERT INTO produto VALUES (
  13,
  'Máquina de Café Nespresso',
  'Lote13131'
);
/

-- Produto 14
INSERT INTO produto VALUES (
  14,
  'Bolsa Louis Vuitton Neverfull',
  'Lote14141'
);
/

-- Fornecedor
INSERT INTO fornecedor VALUES (
  '33855174000195',
  'Fornecedores de Achocolatado ltda'
);
/

INSERT INTO fornecedor VALUES (
  '65109579000170',
  'Louis Vuitton'
);
/

INSERT INTO fornecedor VALUES (
  '37149315000105',
  'Ray-Ban'
);
/

INSERT INTO fornecedor VALUES (
  '77502515000114',
  'GourmetVista Distributors'
);
/

INSERT INTO fornecedor VALUES (
  '87875915000129',
  'FreshHarvest Suppliers'
);
/

INSERT INTO fornecedor VALUES (
  '49601591000141',
  'SilkSymphony Textiles'
);
/

INSERT INTO fornecedor VALUES (
  '66646430000193',
  'VitaWell Pharma'
);
/

-- ProdutoFornecido
INSERT INTO produtoFornecido VALUES (
  (SELECT REF(F) FROM fornecedor F WHERE F.cnpj = '33855174000195'),
  (SELECT REF(P) FROM produto P WHERE P.codigo = 13)
);
/

INSERT INTO produtoFornecido VALUES (
  (SELECT REF(F) FROM fornecedor F WHERE F.cnpj = '37149315000105'),
  (SELECT REF(P) FROM produto P WHERE P.codigo = 11)
);
/

INSERT INTO produtoFornecido VALUES (
  (SELECT REF(F) FROM fornecedor F WHERE F.cnpj = '66646430000193'),
  (SELECT REF(P) FROM produto P WHERE P.codigo = 05)
);
/

INSERT INTO produtoFornecido VALUES (
  (SELECT REF(F) FROM fornecedor F WHERE F.cnpj = '66646430000193'),
  (SELECT REF(P) FROM produto P WHERE P.codigo = 04)
);
/

INSERT INTO produtoFornecido VALUES (
  (SELECT REF(F) FROM fornecedor F WHERE F.cnpj = '87875915000129'),
  (SELECT REF(P) FROM produto P WHERE P.codigo = 02)
);
/

INSERT INTO produtoFornecido VALUES (
  (SELECT REF(F) FROM fornecedor F WHERE F.cnpj = '87875915000129'),
  (SELECT REF(P) FROM produto P WHERE P.codigo = 01)
);
/

INSERT INTO produtoFornecido VALUES (
  (SELECT REF(F) FROM fornecedor F WHERE F.cnpj = '65109579000170'),
  (SELECT REF(P) FROM produto P WHERE P.codigo = 14)
);
/

INSERT INTO produtoFornecido VALUES (
  (SELECT REF(F) FROM fornecedor F WHERE F.cnpj = '77502515000114'),
  (SELECT REF(P) FROM produto P WHERE P.codigo = 08)
);
/

INSERT INTO produtoFornecido VALUES (
  (SELECT REF(F) FROM fornecedor F WHERE F.cnpj = '77502515000114'),
  (SELECT REF(P) FROM produto P WHERE P.codigo = 09)
);
/

INSERT INTO produtoFornecido VALUES (
  (SELECT REF(F) FROM fornecedor F WHERE F.cnpj = '49601591000141'),
  (SELECT REF(P) FROM produto P WHERE P.codigo = 10)
);
/

-- Reabastece
INSERT INTO reabastece VALUES (
  tp_produtoFornecido( (SELECT REF(F) FROM fornecedor F WHERE F.cnpj = '49601591000141'), (SELECT REF(P) FROM produto P WHERE P.codigo = 10)),
  (SELECT REF(F) FROM funcionario F WHERE F.cpf = '00698199049')
);
/

INSERT INTO reabastece VALUES (
  tp_produtoFornecido( (SELECT REF(F) FROM fornecedor F WHERE F.cnpj = '77502515000114'), (SELECT REF(P) FROM produto P WHERE P.codigo = 08)),
  (SELECT REF(F) FROM funcionario F WHERE F.cpf = '00698199049')
);
/

INSERT INTO reabastece VALUES (
  tp_produtoFornecido( (SELECT REF(F) FROM fornecedor F WHERE F.cnpj = '66646430000193'), (SELECT REF(P) FROM produto P WHERE P.codigo = 05)),
  (SELECT REF(F) FROM funcionario F WHERE F.cpf = '32034627024')
);
/

INSERT INTO reabastece VALUES (
  tp_produtoFornecido( (SELECT REF(F) FROM fornecedor F WHERE F.cnpj = '33855174000195'), (SELECT REF(P) FROM produto P WHERE P.codigo = 13)),
  (SELECT REF(F) FROM funcionario F WHERE F.cpf = '09000676401')
);
/

-- Vende
INSERT INTO vende VALUES (
  (SELECT REF(F) FROM funcionario F WHERE F.cpf = '11111111111'),
  (SELECT REF(C) FROM cliente C WHERE C.cpf = '5555555555'),
  (SELECT REF(P) FROM produto P WHERE P.codigo = 03),
  to_date('25/05/2023', 'dd/mm/yy')
);
/

INSERT INTO vende VALUES (
  (SELECT REF(F) FROM funcionario F WHERE F.cpf = '11111111111'),
  (SELECT REF(C) FROM cliente C WHERE C.cpf = '6666666666'),
  (SELECT REF(P) FROM produto P WHERE P.codigo = 07),
  to_date('28/06/2023', 'dd/mm/yy')
);
/

INSERT INTO vende VALUES (
  (SELECT REF(F) FROM funcionario F WHERE F.cpf = '00698199049'),
  (SELECT REF(C) FROM cliente C WHERE C.cpf = '6666666666'),
  (SELECT REF(P) FROM produto P WHERE P.codigo = 13),
  to_date('14/07/2023', 'dd/mm/yy')
);
/

INSERT INTO vende VALUES (
  (SELECT REF(F) FROM funcionario F WHERE F.cpf = '32034627024'),
  (SELECT REF(C) FROM cliente C WHERE C.cpf = '7777777777'),
  (SELECT REF(P) FROM produto P WHERE P.codigo = 12),
  to_date('18/07/2023', 'dd/mm/yy')
);
/

INSERT INTO vende VALUES (
  (SELECT REF(F) FROM funcionario F WHERE F.cpf = '09000676401'),
  (SELECT REF(C) FROM cliente C WHERE C.cpf = '4444444444'),
  (SELECT REF(P) FROM produto P WHERE P.codigo = 04),
  to_date('23/07/2023', 'dd/mm/yy')
);
/

INSERT INTO vende VALUES (
  (SELECT REF(F) FROM funcionario F WHERE F.cpf = '09000676401'),
  (SELECT REF(C) FROM cliente C WHERE C.cpf = '1212121212'),
  (SELECT REF(P) FROM produto P WHERE P.codigo = 05),
  to_date('10/08/2023', 'dd/mm/yy')
);
/

INSERT INTO vende VALUES (
  (SELECT REF(F) FROM funcionario F WHERE F.cpf = '44718993415'),
  (SELECT REF(C) FROM cliente C WHERE C.cpf = '1212121212'),
  (SELECT REF(P) FROM produto P WHERE P.codigo = 11),
  to_date('25/08/2023', 'dd/mm/yy')
);
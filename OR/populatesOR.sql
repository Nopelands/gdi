-- Joaquin
INSERT INTO cliente VALUES (
  '7777777777', 
  'Joaquin', 
  'Rua Joaquin Nabuco', 
  128, 
  'Casa', 
  '12345123', 
  29, -- Idade 29 anos
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
  20, -- Idade 20 anos
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
  25, -- Idade 25 anos
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
  28, -- Idade 28 anos
  (tp_array_telefone(tp_telefone('55555588888'))), 
  04, 
  15
);
/


-- Cliente Silvio
INSERT INTO cliente VALUES (
  '1212121212',
  'Silvio',
  'Rua do Comércio',
  42,
  'Loja 5',
  '98765432',
  35, -- Idade 35 anos
  (tp_array_telefone(tp_telefone('55555555555'))),
  15,
  100
);
/

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
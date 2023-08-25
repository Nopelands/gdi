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

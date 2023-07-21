CREATE SEQUENCE id_pontos INCREMENT by 1 START WITH 1;

-- pessoas
INSERT INTO pessoa (cpf,nome,rua,numero,complemento,cep,idade) VALUES ('00698199049','João da Silva','Rua A',34,NULL,'55158530',35);
INSERT INTO pessoa (cpf,nome,rua,numero,complemento,cep,idade) VALUES ('68493475009','Maria Souza','Avenida B',87,'Apt 154','22715320',28);
INSERT INTO pessoa (cpf,nome,rua,numero,complemento,cep,idade) VALUES ('48762903004','Hackerman','rainbow road',3735928559,'x86 mov is turing complete','43805610',42);
INSERT INTO pessoa (cpf,nome,rua,numero,complemento,cep,idade) VALUES ('20442555024','Ana Oliveira','Rua B',90,NULL,'29100181',51);
INSERT INTO pessoa (cpf,nome,rua,numero,complemento,cep,idade) VALUES ('29909148030','Perry o ornitorrinco','maple drive',2308,'casinha no quintal','69309660',5);
INSERT INTO pessoa (cpf,nome,rua,numero,complemento,cep,idade) VALUES ('29909148031','Agente P','maple drive',2308,'subsolo','69309660',5);
INSERT INTO pessoa (cpf,nome,rua,numero,complemento,cep,idade) VALUES ('49804012014','Luiza Pereira','Avenida A',36,NULL,'69316006',12);
INSERT INTO pessoa (cpf,nome,rua,numero,complemento,cep,idade) VALUES ('67575259090','Pedro Santos','Rua A',958,'Casa 2','55158530',37);
INSERT INTO pessoa (cpf,nome,rua,numero,complemento,cep,idade) VALUES ('18878090077','Alma Armas','va',11,'hall-A','68373150',29);
INSERT INTO pessoa (cpf,nome,rua,numero,complemento,cep,idade) VALUES ('82322846090','Julianne Natalie Stingray','va',11,'hall-A','68373150',27);
INSERT INTO pessoa (cpf,nome,rua,numero,complemento,cep,idade) VALUES ('39564815002','Anna Graem','va',11,'hall-A','68373150',21);
INSERT INTO pessoa (cpf,nome,rua,numero,complemento,cep,idade) VALUES ('82523784041','Dana Zane','va',11,'hall-A','68373150',0);
INSERT INTO pessoa (cpf,nome,rua,numero,complemento,cep,idade) VALUES ('32034627024','Gillian','va',11,'hall-A','68373150',0);
INSERT INTO pessoa (cpf,nome,rua,numero,complemento,cep,idade) VALUES ('85132578004','Dorothy Haze','va',11,'hall-A','68373150',24);

-- telefones
INSERT INTO telefone (cpf, telefone) VALUES ('00698199049','81935331027');
INSERT INTO telefone (cpf, telefone) VALUES ('68493475009','81934167150');
INSERT INTO telefone (cpf, telefone) VALUES ('48762903004','81934325747');
INSERT INTO telefone (cpf, telefone) VALUES ('20442555024','81930286451');
INSERT INTO telefone (cpf, telefone) VALUES ('29909148030','81931652167');
INSERT INTO telefone (cpf, telefone) VALUES ('29909148031','81928243556');
INSERT INTO telefone (cpf, telefone) VALUES ('49804012014','81921557886');
INSERT INTO telefone (cpf, telefone) VALUES ('67575259090','81922623925');
INSERT INTO telefone (cpf, telefone) VALUES ('18878090077','81923399602');
INSERT INTO telefone (cpf, telefone) VALUES ('82322846090','87937864447');
INSERT INTO telefone (cpf, telefone) VALUES ('39564815002','87938124751');
INSERT INTO telefone (cpf, telefone) VALUES ('82523784041','87928580059');
INSERT INTO telefone (cpf, telefone) VALUES ('32034627024','87937905287');
INSERT INTO telefone (cpf, telefone) VALUES ('85132578004','87924483636');

-- funcionarios
INSERT INTO funcionario (cpf,cargo,cpf_supervisor) VALUES ('82523784041','gerente','82523784041');
INSERT INTO funcionario (cpf,cargo,cpf_supervisor) VALUES ('32034627024','supervisor','82523784041');
INSERT INTO funcionario (cpf,cargo,cpf_supervisor) VALUES ('82322846090','supervisor','82523784041');
INSERT INTO funcionario (cpf,cargo,cpf_supervisor) VALUES ('18878090077','atendente','82322846090');
INSERT INTO funcionario (cpf,cargo,cpf_supervisor) VALUES ('29909148031','atendente','32034627024');
INSERT INTO funcionario (cpf,cargo,cpf_supervisor) VALUES ('67575259090','atendente','32034627024');

-- clientes
INSERT INTO cliente (cpf,id_pontos,pontos) VALUES ('39564815002',id_pontos.NEXTVAL,326);
INSERT INTO cliente (cpf,id_pontos,pontos) VALUES ('85132578004',id_pontos.NEXTVAL,426);
INSERT INTO cliente (cpf,id_pontos,pontos) VALUES ('48762903004',id_pontos.NEXTVAL,999999);
INSERT INTO cliente (cpf,id_pontos,pontos) VALUES ('49804012014',id_pontos.NEXTVAL,0);
INSERT INTO cliente (cpf,id_pontos,pontos) VALUES ('29909148030',id_pontos.NEXTVAL,10);
INSERT INTO cliente (cpf,id_pontos,pontos) VALUES ('67575259090',id_pontos.NEXTVAL,5);
INSERT INTO cliente (cpf,id_pontos,pontos) VALUES ('82523784041',id_pontos.NEXTVAL,56);

-- produtos
INSERT INTO produto (codigo,nome,lote) VALUES (60649, 'achocolatado', '453ytu2-243');
INSERT INTO produto (codigo,nome,lote) VALUES (46494, 'loja de conveniencia', '7yw34yr873-4387');
INSERT INTO produto (codigo,nome,lote) VALUES (60554, 'peroxido de oxigenio', 'd9s0h2-548');
INSERT INTO produto (codigo,nome,lote) VALUES (64199, 'cesio-137', 'cdi9767ws-099');
INSERT INTO produto (codigo,nome,lote) VALUES (01380, 'persona 5', '12wdguiju765edf-111');
INSERT INTO produto (codigo,nome,lote) VALUES (61727, 'sonhos', '43ue83j4ujtr-7833');
INSERT INTO produto (codigo,nome,lote) VALUES (20914, 'esperancas', 'oijhgfgj8h798-475');
INSERT INTO produto (codigo,nome,lote) VALUES (70527, 'loja de conveniencia 2', 'p2iki3jm4ni2j-8463');
INSERT INTO produto (codigo,nome,lote) VALUES (67948, 'carteira_bitcoin.wcry', '5xc4787v6cx7c-1337');
INSERT INTO produto (codigo,nome,lote) VALUES (64868, 'maquiagem de palhaco', 'voucoringar-666');
INSERT INTO produto (codigo,nome,lote) VALUES (48234, 'lista de produtos', 'dewd433f5-3284');
INSERT INTO produto (codigo,nome,lote) VALUES (42589, '42.zip', '4443f5f3f3t6gfgh6-4923');
INSERT INTO produto (codigo,nome,lote) VALUES (04379, 'sociedade', 're8g7re8gre8-2814');
INSERT INTO produto (codigo,nome,lote) VALUES (13030, 'botao de auto-destruicao', '7e8rfyregfyref-2314');
INSERT INTO produto (codigo,nome,lote) VALUES (64697, 'atendente', 'x8eyw7dhuewd-9546');
INSERT INTO produto (codigo,nome,lote) VALUES (04000, 'meta-referencia', 'xdwded87wged-43');
INSERT INTO produto (codigo,nome,lote) VALUES (50273, '50273', 'wuee87dg8-000');
INSERT INTO produto (codigo,nome,lote) VALUES (93280, 'prova de que P=NP', '985ueiwr3trwq65wt-2');

-- fornecedores
INSERT INTO fornecedor (cnpj,nome_da_empresa) VALUES ('33855174000195','A Empresa do Malvado Doofenshmirtz');
INSERT INTO fornecedor (cnpj,nome_da_empresa) VALUES ('88944414000110','Loja de Conveniencia 0');
INSERT INTO fornecedor (cnpj,nome_da_empresa) VALUES ('04161171000153','Fornecedores de Achocolatado ltda');
INSERT INTO fornecedor (cnpj,nome_da_empresa) VALUES ('13993089000186','Toby Fox');
INSERT INTO fornecedor (cnpj,nome_da_empresa) VALUES ('97170639000157','Evil Corp');
INSERT INTO fornecedor (cnpj,nome_da_empresa) VALUES ('76994489000126','Zaibatsu Corp');
INSERT INTO fornecedor (cnpj,nome_da_empresa) VALUES ('96104203000105','[object Object]');

-- dependentes
INSERT INTO dependente (cpf_empr,nome_completo) VALUES ('82322846090','Fore');
INSERT INTO dependente (cpf_empr,nome_completo) VALUES ('67575259090','Chris');
INSERT INTO dependente (cpf_empr,nome_completo) VALUES ('29909148031','Phineas');
INSERT INTO dependente (cpf_empr,nome_completo) VALUES ('29909148031','Ferb');

-- produtos fornecidos
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('33855174000195',60649);
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('33855174000195',60554);
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('33855174000195',64868);
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('33855174000195',13030);
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('33855174000195',04379);
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('88944414000110',46494);
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('88944414000110',70527);
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('88944414000110',64697);
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('04161171000153',60649);
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('04161171000153',64199);
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('13993089000186',61727);
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('13993089000186',20914);
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('97170639000157',67948);
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('97170639000157',42589);
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('97170639000157',93280);
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('76994489000126',01380);
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('76994489000126',64199);
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('96104203000105',48234);
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('96104203000105',04000);
INSERT INTO produtoFornecido (cnpj,codigo) VALUES ('96104203000105',50273);

-- reabastecimentos
INSERT INTO reabastece (cnpj, codigo, cpf) VALUES ('33855174000195',60554,'18878090077');
INSERT INTO reabastece (cnpj, codigo, cpf) VALUES ('88944414000110',01380,'67575259090');
INSERT INTO reabastece (cnpj, codigo, cpf) VALUES ('04161171000153',64199,'29909148031');
INSERT INTO reabastece (cnpj, codigo, cpf) VALUES ('13993089000186',67948,'18878090077');
INSERT INTO reabastece (cnpj, codigo, cpf) VALUES ('97170639000157',42589,'29909148031');
INSERT INTO reabastece (cnpj, codigo, cpf) VALUES ('76994489000126',13030,'67575259090');
INSERT INTO reabastece (cnpj, codigo, cpf) VALUES ('96104203000105',50273,'18878090077');

-- vendas
INSERT INTO vende (cpf,cpf_cliente,codigo,data_e_hora) VALUES ('18878090077','48762903004',48234,to_date('2023-06-21','yyyy-mm-dd'));
INSERT INTO vende (cpf,cpf_cliente,codigo,data_e_hora) VALUES ('67575259090','39564815002',20914,to_date('2023-06-30','yyyy-mm-dd'));
INSERT INTO vende (cpf,cpf_cliente,codigo,data_e_hora) VALUES ('29909148031','85132578004',46494,to_date('2023-07-02','yyyy-mm-dd'));
INSERT INTO vende (cpf,cpf_cliente,codigo,data_e_hora) VALUES ('29909148031','82523784041',64199,to_date('2023-07-08','yyyy-mm-dd'));
INSERT INTO vende (cpf,cpf_cliente,codigo,data_e_hora) VALUES ('67575259090','48762903004',64868,to_date('2023-07-16','yyyy-mm-dd'));
INSERT INTO vende (cpf,cpf_cliente,codigo,data_e_hora) VALUES ('18878090077','67575259090',13030,to_date('2023-07-23','yyyy-mm-dd'));

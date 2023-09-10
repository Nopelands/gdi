// Selecionar o banco de dados

use("agencia");

// Retorna o roteiro de viagem do país especificado

db.roteiro.find({paisId: db.pais.findOne({nome: "China"})._id}, 
{_id: 0, nome: 1, descricao: 1}).pretty();

//


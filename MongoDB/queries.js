// Selecionar o banco de dados

use("agencia");

// Retorna o roteiro de viagem do país especificado

db.roteiro.find({paisId: db.pais.findOne({nome: "China"})._id}, 
{_id: 0, nome: 1, descricao: 1}).pretty();

// Retorna todas as atrações em que o preço de entrada é maior ou igual a 40

db.atracao.find({precoEntrada: {$gte: 40.00}}).pretty();

// Retorna a media das avaliações de cada roteiro

db.avaliacaoRoteiro.aggregate([{ 
    $group: {_id: "$roteiroId", avaliacao: {$avg: "$classificacao"}}
}]);

// Retorna o nome e quantidade dos países que falam determinada lingua

db.pais.mapReduce(
    function(){
        for (var i = 0; i < this.idiomaOficial.length; i++) {
            emit(this.idiomaOficial[i], 1);
        }
    },
    function(key, values) {
        return Array.sum(values)
    },
    {
        'out': 'pais_por_idioma'
    }
)

db.pais_por_idioma.find();

//


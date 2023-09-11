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
);

db.pais_por_idioma.find();

// Retorna todas atrações que começam as 8 da manhã

db.atracao.find({ $text: { $search: "\"08:00\"" } }).pretty();

// Retorna todos os pontos turísticos que são museus

db.pontoTuristico.aggregate([
    {$match: {tipo: "Museu"}},
    {$sort: {_id: 1}},
    {$project: {_id: 0, nome: 1, descricao: 1, tipo: 1}},
]).pretty();

// Retorna todos os roteiros que possuem avaliação

db.avaliacaoRoteiro.aggregate([
    {$lookup: {
        from: "roteiro",
        localField: "roteiroId",
        foreignField: "_id",
        as: "roteiro_info"
    }},
    {$unwind: "$roteiro_info"},
    {$group: {
        _id: "$roteiro_info.nome"
    }},
    {$project: {
        _id:0,
        nome: "$_id",
    }}
]).pretty();

// Retorna todos os países que falam inglês

db.pais.find({ idiomaOficial: { $exists: true, $all: ["Inglês"] }});

// Retorna a quantidade de avaliações totais

db.avaliacaoRoteiro.aggregate([
    {$count: "quantidade"}
])

// Retorna as 3 atrações mais baratas

db.atracao.find().sort({ precoEntrada: 1 }).limit(3);

// Retorna todos os países que tem 2 idiomas oficiais

db.pais.find({ idiomaOficial: {$size: 2} }).pretty();

// Função que retorna a quantidade de semanas do roteiro

db.roteiro.aggregate([
    {
        $addFields: {
            semanas: {
                $function: {
                    body: function(duracao){
                        if(duracao >= 7){
                            return Math.floor(duracao / 7)
                        }
                        else{
                            return 0
                        }
                    },
                    args: ["$duracao"],
                    lang: "js"
                }
            }
        }
    }
]).pretty();

// Retorna o id da avalicao, o id do roteiro 
// e se a avaliação foi feita depois do dia 08 de setembro retorna true se não false

db.avaliacaoRoteiro.aggregate([
    {
        $project: {
            roteiroId: 1,
            avaliacaoRecente: {
                $cond: { if: {$gte: ["$dataAvaliacao", ISODate("2023-09-08")]}, then: true, else:false}
            }
        }
    }
]);

// Retorna o maior preço de entrada das atrações

db.atracao.aggregate([
    { $group: {
        _id: 0, precoMax: {$max: "$precoEntrada"}
    }},
    { $project: {
        _id: 0
    }}
]);

// Atualiza a duração do roteiro dado o id dele

db.roteiro.updateOne({ _id: 9 }, { $set: { duracao: 10 }});

// Adicionando espanhol aos idiomas oficiais do pais

db.pais.updateOne({ _id: 1 }, { $addToSet: { idiomaOficial: "Espanhol" }})

// Retorna todos os pontos turísticos que são palácios

db.pontoTuristico.find({
    $where: function() {
        return((this.tipo) == "Palácio")
    }
});

// Inserindo um avaliação

db.avaliacaoRoteiro.insertOne({
    _id: 6,
    roteiroId: 5,
    classificacao: 4,
    comentario: "Paris é fenomenal!",
    dataAvaliacao: new Date("2023-09-10"),
    nomeAvaliador: "José Roberto"
});

// Retorna a quantidade de avaliações de cada roteiro

db.avaliacaoRoteiro.aggregate([
    { $group: {_id: "$roteiroId", qtdAvaliações: { $sum: 1}}}
]).pretty();

// Filtra os países que tem como idioma oficial o japonês

db.pais.aggregate([
    {
        $project: {
            idiomaOficial: {
                $filter: {
                    input: "$idiomaOficial",
                    as: "idioma",
                    cond: { $eq: ["$$idioma","Japonês"]}
                }
            }
        }
    }
])

// Mudar o nome do collection roteiro para roteiros

db.roteiro.renameCollection("roteiros");
db.avaliacaoRoteiro.insertMany([
    {
        _id: 1,
        roteiroId: 1,
        classificacao: 5,
        comentarios: "Excelente roteiro, adorei a experiência!",
        dataAvaliacao: new Date("2023-09-09"),
        nomeAvaliador: "João da Silva"
    },
    {
        _id: 2,
        roteiroId: 2,
        classificacao: 4,
        comentarios: "Nova York é uma cidade incrível, vale a pena conhecer!",
        dataAvaliacao: new Date("2023-09-08"),
        nomeAvaliador: "Maria Santos"
    },
    {
        _id: 3,
        roteiroId: 5,
        classificacao: 3,
        comentarios: "Paris é sempre encantadora, mas o clima estava chuvoso.",
        dataAvaliacao: new Date("2023-09-07"),
        nomeAvaliador: "Pedro Souza"
    },
    {
        _id: 4,
        roteiroId: 1,
        classificacao: 4,
        comentarios: "Rio de Janeiro é maravilhoso, mas o trânsito estava congestionado.",
        dataAvaliacao: new Date("2023-09-06"),
        nomeAvaliador: "Ana Pereira"
    },
    {
        _id: 5,
        roteiroId: 4,
        classificacao: 5,
        comentarios: "Berlim é cheia de história, adorei cada museu!",
        dataAvaliacao: new Date("2023-09-05"),
        nomeAvaliador: "Lucas Oliveira"
    }
]);
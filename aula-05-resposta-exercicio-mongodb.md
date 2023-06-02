```
db.editoras.insert([
    {_id:9, nome:"Seguinte", endereco: "Travessa Antônio Ferreira, 125 - Igrejinha / Capanema - PA 68700216", telefone:"(58) 92587-5686"}, 
    {_id:10, nome:"Paralela", endereco: "Rua Frederico Moura, 37 - Cidade Nova / Franca - SP 14401150", telefone:"(52) 92035-3387"}    
])


db.autores.insertMany([
    {_id:11, nome:"Rick Riordan", email:"rickriordan@gmail.com", telefone:"(92) 98825-0225"}, 
    {_id:12, nome:"J. K. Rowling", email:"jkrowling@gmail.com", telefone:"(22) 98325-4585"}, 
    {_id:13, nome:"Shelby Mahurin", email:"shelbymahurin@gmail.com", telefone:"(85) 93845-6276"}
])


db.livros.insertMany([
    {_id:12, titulo:"É Assim que Acaba", isbn:"9788501112514", codigo:"8501112518", ano:2018, paginas:368, categoria_id:1, editora_id:3, autor_id:2}, 
    {_id:13, titulo:"É assim que começa", isbn:"9786559811397", codigo:"6559811395", ano:2022, paginas:336, categoria_id:1, editora_id:3, autor_id:2}, 
    {_id:14, titulo:"Percy Jackson e o ladrão de raios", isbn:"9788580575392", codigo:"8580575397", ano:2014, paginas:400, categoria_id:3, editora_id:4, autor_id:11}, 
    {_id:15, titulo:"Pássaro e serpente", isbn:"9786555872347", codigo:"6555872349", ano:2021, paginas:504, categoria_id:2, editora_id:3, autor_id:13}
])



db.categorias.insertOne({nome:"Terror"})



db.livros.find({paginas: {$gt:350}})


db.livros.find({categoria_id:3}).sort({titulo:1})


db.editoras.find({nome: /Collins/ })


db.livros.find({autor_id:2}).count()
db.livros.count({autor_id:2})
db.livros.aggregate([
    { $match: { autor_id: { $eq: 2 } } },
    { $count: "autor_id" }
])



db.categorias.find()
// categoria: 2
db.autores.find()
// autor: 3

db.livros.find({
    $or: [
        { categoria_id: 2 },
        { autor_id: 3 },
    ]
})



db.livros.find({
    ano: {$gte: 2020, $lte: 2022}
})
```
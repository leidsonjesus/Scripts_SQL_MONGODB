```
// Listando banco de dados
show dbs

// Criando banco de dados
use livraria

// Criando coleções
db.createCollection("categorias")
db.createCollection("editoras")
db.createCollection("autores")
db.createCollection("livros")


// Renomeando coleção
db.categoria.renameCollection("categorias")


// Excluíndo coleção e banco de dados
db.categorias.drop()
db.dropDatabase()

// Criando banco de dados novamente
use livraria

// Listando banco de dados novamente
show dbs


// Inserindo categorias
db.categorias.insertOne({_id:1, nome:"Romance"})
db.categorias.insertMany([{_id:2, nome:"Fantasia"},{_id:3, nome:"Ficção"}])


// Inserindo editoras
db.editoras.insertMany([
    {_id:1, nome:"Martin Claret",endereco:"Rua Alegrete, 62 - Sumaré / São Paulo - SP 1254-010",telefone:"(67) 2600-8963"},
    {_id:2, nome:"Principis",endereco:"Rua Simplício Dias, 917 - Nossa Senhora do Carmo / São Paulo - SP 64200-055",telefone:"(67) 99770-1390"},
    {_id:3, nome:"Galera",endereco:"Rua Colonizador Ênio Pipino, 958 - Residencial Pérola / Sinop - MT 78558-099",telefone:"(69) 2859-6853"},
    {_id:4, nome:"Intrínseca",endereco:"Rua Caviana, 562 - Floresta Sul / Rio Branco - AC 69912-497",telefone:"(69) 99420-7385"},
    {_id:5, nome:"Rocco",endereco:"Rua Fortaleza, 404 - Santa Isabel / Várzea Grande - MT 78150-374",telefone:"(47) 3791-2313"},
    {_id:6, nome:"HarperCollins",endereco:"Rua 12 de Outubro, 327 - São Joaquim / Teresina - PI 64004-070",telefone:"(47) 98957-7895"},
    {_id:7, nome:"Editora Aleph",endereco:"Beco Um, 426 - Aberta dos Morros / Porto Alegre - RS 91751-356",telefone:"(86) 3950-8740"},
    {_id:8, nome:"Editora Arqueiro",endereco:"Rua das camelias, 25 - Centro / Fortaleza - CE",telefone:"(88) 8185-0259"}
])


// Inserindo autores
db.autores.insertMany([
    {_id:1, nome:"Jane Austen",email:"jane.austen@gmail.com",telefone:"(92) 3709-1345"},
    {_id:2, nome:"Colleen Hoover",email:"colleen@hotmail.com",telefone:"(92) 99973-021"},
    {_id:3, nome:"Jenny Han",email:"jenny.han@gmail.com",telefone:"(91) 3869-343"},
    {_id:4, nome:"Jojo Moyes",email:"jojo.moyes@outlook.com",telefone:"(91) 98917-5631"},
    {_id:5, nome:"Christopher Paolini",email:"Christopher.Paolini@gmail.com",telefone:"(68) 2837-1753"},
    {_id:6, nome:"Sarah J. Maas",email:"sara.mass@gmail.com",telefone:"(68) 98195-3278"},
    {_id:7, nome:"Richelle Mead",email:"richelle.mead@hotmail.com",telefone:"(41) 2842-2743"},
    {_id:8, nome:"Agatha Christie",email:"agatha.christie@gmail.com",telefone:"(41) 98786-8124"},
    {_id:9, nome:"Frank Herbert",email:"frank.herbert@outlook.com",telefone:"(68) 2762-1218"},
    {_id:10, nome:"Ali Hazelwood",email:"ali@outlook.com",telefone:"(68) 3185-7856"}
])


// Inserindo livros
db.livros.insertMany([
    {_id:1, titulo:"Orgulho e Preconceito",isbn:"978-8544001820",codigo:"8544001823",ano:2018,paginas:424,categoria_id:1,editora_id:1,autor_id:1},
    {_id:2, titulo:"Razão e sensibilidade",isbn:"978-6555520712",codigo:"655552071",ano:2020,paginas:288,categoria_id:1,editora_id:1,autor_id:1},
    {_id:3, titulo:"Persuasão",isbn:"978-6550970277",codigo:"655097027",ano:2019,paginas:240,categoria_id:1,editora_id:2,autor_id:1},
    {_id:4, titulo:"Todas as suas (im)perfeições",isbn:"978-8501117687",codigo:"8501117684",ano:2019,paginas:304,categoria_id:1,editora_id:3,autor_id:2},
    {_id:5, titulo:"Para todos os garotos que já amei",isbn:"978-8580577266",codigo:"8580577268",ano:2015,paginas:320,categoria_id:1,editora_id:4,autor_id:3},
    {_id:6, titulo:"Como eu era antes de você",isbn:"978-8580579246",codigo:"8580579244",ano:2016,paginas:320,categoria_id:1,editora_id:4,autor_id:4},
    {_id:7, titulo:"Eragon",isbn:"9788532518484",codigo:"8532518486",ano:2005,paginas:468,categoria_id:2,editora_id:5,autor_id:5},
    {_id:8, titulo:"Trono de vidro",isbn:"978-8501401380",codigo:"8501401382",ano:2013,paginas:392,categoria_id:2,editora_id:3,autor_id:6},
    {_id:9, titulo:"Academia de vampiros",isbn:"978-8501401380",codigo:"6555112875",ano:2022,paginas:448,categoria_id:2,editora_id:6,autor_id:7},
    {_id:10, titulo:"Um mistério no Caribe",isbn:"978-8595085909",codigo:"8595085900",ano:2020,paginas:208,categoria_id:3,editora_id:6,autor_id:8},
    {_id:11, titulo:"Duna",isbn:"978-8576573135",codigo:"857657313",ano:2017,paginas:680,categoria_id:3,editora_id:7,autor_id:9},
    {_id:12, titulo:"A hipótese do amor",isbn:"9786555653304",codigo:"6555653302",ano:2022,paginas:336,categoria_id:1,editora_id:8,autor_id:10}
])



// Atualizando um autor
db.autores.updateOne({_id:10},{$set:{email:"ali.hazelwood@outlook.com"}})


// Excluíndo um livro
db.livros.deleteOne({_id:12})


// SELECT * FROM livros;
db.livros.find({})

// SELECT titulo, paginas FROM livros;
db.livros.find({}, {titulo:1,paginas:1})
// 0 = falso
// 1 = verdadeiro


// SELECT titulo, paginas FROM livros WHERE ano > 2018
db.livros.find({ano:{$gt:2018}}, {titulo:1,paginas:1,ano:1})


// SELECT titulo, paginas FROM livros WHERE ano > 2018 ORDER BY titulo
db.livros.find({ano:{$gt:2018}}, {titulo:1,paginas:1}).sort("titulo")




// Agrupando documentos e usando função AVG
db.livros.aggregate({
    $group:{
        _id:"_id",
        "Média de páginas":{
            $avg: "$paginas"
        }
    }
})


// Agrupando documentos e usando função AVG e removendo "_id" do resultado
db.livros.aggregate({
    $group:{
        _id:"_id",
        "Média de páginas":{
            $avg: "$paginas"
        }
    }
}, {$project:{_id:0}})


// Agrupando documentos e usando função AVG, SUM e COUNT
db.livros.aggregate({
    $group:{
        _id:"_id",
        "Média de páginas":{
            $avg: "$paginas"
        },
        "Total de páginas":{
            $sum: "$paginas"
        },
        "Contagem de livros":{
            $count:{}
        }
    }
}, {$project:{_id:0}})



// Junção à externa esquerda: No caso, só podemos juntar os valores da direta (lookup) aos documentos da esquerda
// SELECT * FROM livros l LEFT JOIN editoras e ON l.editora_id = e.id;
db.livros.aggregate([{
    $lookup:{
        from:"editoras",
        localField:"editora_id",
        foreignField:"_id",
        as:"editora"
    }},
    {$lookup:{
        from:"autores",
        localField:"autor_id",
        foreignField:"_id",
        as:"autor"
    }}
])
```
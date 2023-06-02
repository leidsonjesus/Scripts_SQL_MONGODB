# Aula 05 - Projeto Livraria com SQL

## Preparando ambiente

1 - Criando ambiente virtual:
```sh
python -m venv venv
```

2 - Ativar ambiente virtual

No Linux/Mac use o seguinte comando:
```sh
source venv/bin/activate
```

No Windows:
```sh
venv\Scripts\activate
```

3 - Instalando `psycopg2-binary`
```sh
pip install psycopg2-binary
```

## Conexão com o banco de dados

- Crie um novo arquivo com o nome `conexao_db.py` e adicione o código:
```python
import psycopg2


if __name__ == '__main__':
    conexao = psycopg2.connect(host='localhost', database='livraria', user='postgres', password='postgres')
    print('Conectado!')
    conexao.close()
```

- Agora use o padrão Factory, alterando o nome de `conexao_db.py` para `conexao_factory.py`

- Altere o código para:
```python
import psycopg2


class ConexaoFactory:

    def get_conexao(self):
        return psycopg2.connect(host='localhost', database='livraria', user='postgres', password='postgres')
```

- Por fim crie uma camada (pasta) `database` e coloque o `conexao_factory.py` dentro.

## Adicionando categorias no banco de dados

- Remover id do construtor da categoria e adicionar valor inicial zero (`0`):
```python
class Categoria:

    def __init__(self, nome: str): # alterado
        self.__id: int = 0 # alterado
        self.__nome: str = nome

    def __str__(self):
        return f'{self.__id} | {self.__nome}'

    @property
    def id(self) -> int:
        return self.__id
    
    @id.setter
    def id(self, id: int):
        self.__id = id

    @property
    def nome(self) -> str:
        return self.__nome

    @nome.setter
    def nome(self, nome: str):
        self.__nome = nome
```

- Agora no `CategoriaDAO` altere o método `adicionar` para salvar no banco:
```python
class CategoriaDAO:

    # ...

    def adicionar(self, categoria: Categoria) -> None:
        conexao = self.__conexao_factory.get_conexao()
        cursor = conexao.cursor()
        cursor.execute("""
            INSERT INTO categorias (nome) VALUES (%(nome)s)
            """, 
            ({'nome': categoria.nome, }))
        conexao.commit()
        cursor.close() # novo
        conexao.close() # novo
```

- No `CategoriaService` no método `adicionar()` remova o Id:
```python
def adicionar(self):
    print('\nAdicionando categoria...')

    try:
        # ultimo id removido
        nome = input('Digite o nome da categoria: ')
        nova_categoria = Categoria(nome) # alterado
        self.__categoria_dao.adicionar(nova_categoria)
        print('Categoria adicionada com sucesso!')
    except Exception as e:
        print(f'Erro ao inserir categoria! - {e}')
        return

    input('Pressione uma tecla para continuar...')
```

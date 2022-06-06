# Getting Started

## Configurar SMTP (opcional)

Para configurar o envio de e-mail, altere no arquivo `development.rb` os parâmetros `user_name` e `password` com os dados do seu gmail.

## Servidor
Para instalar todas as dependências, execute os comandos:

```bash
docker-compose build
docker-compose run app rails db:create
docker-compose run app rails db:migrate
docker-compose run app rails db:seed
```

Levantar a aplicação em modo de desenvolvimento:

```bash
docker-compose up
```

Para acessar o sistema acesse a página:

```
http://localhost:3001
```

## Testes

Para executar os testes, execute o comando:

```bash
docker-compose run app rspec
```

## Para acessar

- no arquivo `db/seeds.rb` existem os e-mails dos usuários cadastrados;
- o usuário administrador possui permissão para importar o arquivo de transações e visualizar as transações de todos os produtos;
- os usuários do tipo normal possuem permissão para criar, visualizar, editar e excluir seus produtos, visualizar suas próprias transações e visualizar os seus afiliados;

# Desafio de programação

O intuito desse teste é avaliar os seus conhecimentos técnicos em programação.

---

# Instruções para entrega do desafio

1. Faça o fork desse repositório para a sua conta no GitHub
2. Implemente o projeto em seu clone local
3. Envie o link do seu repositório para seu contato Tech Recruiter na Hubla

---

# Descrição do projeto

Surgiu uma nova demanda urgente e precisamos de uma área exclusiva para fazer o upload de um arquivo das transações
feitas na venda de produtos por nossos produtores.

Nossa plataforma trabalha no modelo produtor-afiliado, sendo assim um produtor pode vender seus produtos e ter 1 ou N
afiliados também vendendo esses produtos, desde que seja paga uma comissão por venda.

Sua tarefa é construir uma interface web que possibilite o upload de um arquivo de transações de produtos vendidos,
normalizar os dados e armazená-los em um banco de dados relacional.

Você deve utilizar este [arquivo](PRODUCTS.txt)

# Sua aplicação deve

1. Ter uma tela (via formulário) para fazer o upload do arquivo
2. Fazer o parser do arquivo recebido, normalizar os dados e armazená-los em um banco de dados relacional, seguindo as
   definições de interpretação do arquivo
3. Exibir a lista das transações de produtos importadas por produtor/afiliado, com um totalizador do valor das
   transações realizadas
4. Pode ser escrito na sua linguagem de preferência
5. Ser simples de configurar e rodar, compatível com ambiente Unix (utilizar apenas bibliotecas grauitas ou livres)
6. Git com commits bem descritos
7. Pode usar qualquer banco de dados relacional
8. Testes unitários
9. README descrevendo o projeto e como fazer o setup
10. Descrever como consumir as APIs

# Sua aplicação não precisa

1. Lidar com autenticação ou autorização (mas você ganha pontos extras se fizer)
2. Ser escrita usando algum framework específico (mas não tem problema usar)
3. Documentação da API (mas você ganha pontos extras se fizer)
4. Utilizar docker e docker-compose (mas você ganha pontos extras se fizer)
5. Ter testes integrados/end-to-end (mas você ganha pontos extras se fizer)

# Documentação do arquivo de cadastro

| Campo    | Início | Fim | Tamanho | Descrição                                       |
|----------|--------|-----|---------|-------------------------------------------------|
| Tipo     | 1      | 1   | 1       | Tipo da transação                               |
| Data     | 2      | 26  | 25      | Data - ISO Date + GMT                           |
| Produto  | 27     | 56  | 30      | Descrição do produto                            |
| Valor    | 57     | 66  | 10      | Valor da transação (precisa ser divido por 100) |
| Vendedor | 67     | 86  | 20      | Nome do vendedor                                |

# Documentação dos tipos de transação

| Tipo | Descrição         | Natureza | Sinal |
|------|-------------------|----------|-------|
| 1    | Venda produtor    | Entrada  | +     |
| 2    | Venda afiliado    | Entrada  | +     |
| 3    | Comissão paga     | Saída    | -     |
| 4    | Comissão recebida | Entrada  | +     |

# Avaliação

Seu projeto será avaliado de acordo com os seguintes critérios:

1. Desenvolvimento dos [requisitos básicos](#Sua-aplicação-deve)
2. Documentação correta do setup do ambiente e execução da aplicação
3. Cobertura de testes

# Boa sorte!!!

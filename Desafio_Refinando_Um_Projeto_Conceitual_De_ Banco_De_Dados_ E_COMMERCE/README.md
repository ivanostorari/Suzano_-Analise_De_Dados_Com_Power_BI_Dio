IVAN WAGNER

<img align="right" height="500em" 
src="https://github.com/fernandodatagrind/bootcamp_database_experience_dio/blob/main/Banco%20de%20Dados%20SQL/desafio-ecommerce/diagrama_ecomerce.png"/>


<p align="left"> <img src="https://komarev.com/ghpvc/?username=desafio-ecommerce&color=yellow" alt="Profile views" /> </p>

# Bootcamp Database Experience.


### Refinando um Projeto Conceitual de Banco de Dados E-COMMERCE:

### Descrição do Desafio
O esquema deverá ser adicionado a um repositório do Github para futura avaliação do desafio de projeto. Adicione ao Readme a descrição do projeto conceitual para fornecer o contexto sobre seu esquema.

### Objetivo:
Refine o modelo apresentado acrescentando os seguintes pontos:

- Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
- Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
- Entrega – Possui status e código de rastreio;



## Feramentas utilizadas
 
<h3 align="left">Languages and Tools:</h3>
<p align="left"> <a href="https://www.mysql.com/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/mysql/mysql-original-wordmark.svg" alt="mysql" width="40" height="40"/> </a> <a href="https://www.postgresql.org" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/postgresql/postgresql-original-wordmark.svg" alt="postgresql" width="40" height="40"/> </a> </p>



## Respostas do Desafio

- Para o Cliente foram criadas duas novas entidades Pessoa_PJ e Pessoa_PF contendo as informações de forma detalhada e intensificada por CNPJ(Pessoa_PJ) e CPF(Pessoa_PF).
- No caso de Pagamento a entidade esta atribuída a outras duas entidades afim de detalhar as formas de pagamento : Cartão e Boleto.
- Entrega foi criada para armazenar as informações de envio de cada pedido detalhar como data do pedido, data de envio e data de entrega.

#Configurar Produto
 #cenario usando contexto

Funcionalidade: Configuração do Produto
Cenário: Selecionar cor, tamanho e quantidade

Dado que o cliente está na página de configuração do produto
Quando ele seleciona uma cor, tamanho e quantidade
Então o sistema deve validar as seleções
E exibir o produto configurado com as opções selecionadas
Cenário: Seleção de cor obrigatória

Dado que o cliente está na página de configuração do produto
Quando ele tenta adicionar o produto ao carrinho sem selecionar uma cor
Então o sistema deve impedir a adição do produto
E exibir uma mensagem de erro informando que a seleção de cor é obrigatória
Cenário: Seleção de tamanho obrigatória

Dado que o cliente está na página de configuração do produto
Quando ele tenta adicionar o produto ao carrinho sem selecionar um tamanho
Então o sistema deve impedir a adição do produto
E exibir uma mensagem de erro informando que a seleção de tamanho é obrigatória
Cenário: Seleção de quantidade obrigatória

Dado que o cliente está na página de configuração do produto
Quando ele tenta adicionar o produto ao carrinho sem selecionar uma quantidade
Então o sistema deve impedir a adição do produto
E exibir uma mensagem de erro informando que a seleção de quantidade é obrigatória
Cenário: Limite de 10 produtos por venda

Dado que o cliente está na página de configuração do produto
Quando ele tenta adicionar mais de 10 unidades do mesmo produto ao carrinho
Então o sistema deve impedir a adição do produto
E exibir uma mensagem de aviso informando que o limite máximo por venda é de 10 unidades
Cenário: Botão "Limpar" redefine as seleções

Dado que o cliente selecionou uma cor, tamanho e quantidade
Quando ele clica no botão "Limpar"
Então o sistema deve redefinir todas as seleções para os valores iniciais
E exibir o produto em seu estado original

#cenarios usando esquema do cenario

Funcionalidade: Configuração do Produto
Esquema do Cenário:

| Cor	   | Tamanho	| Quantidade	       |         Resultado esperado                                                                 |
| cor	   | tamanho	| quantidade	       | O sistema deve validar as seleções e exibir o produto configurado                          |
|  -	   | tamanho	| quantidade	       | O sistema deve impedir a adição do produto e exibir mensagem de erro para cor              |
| cor	-  |            | quantidade	       | O sistema deve impedir a adição do produto e exibir mensagem de erro para tamanho          |
| cor	   | tamanho	| -	                   | O sistema deve impedir a adição do produto e exibir mensagem de erro para quantidade       |
| cor	   | tamanho	| quantidade_excedente | O sistema deve impedir a adição do produto e exibir mensagem de aviso de limite excedido   |
| cor      | tamanho	| quantidade	       | O sistema deve redefinir as seleções e exibir o produto no estado original                 |

#cenario usando tabela de dados

Funcionalidade: Configuração do Produto
Cenário: Selecionar cor, tamanho e quantidade

Dado que o cliente está na página de configuração do produto "Camisa X"
E o produto possui as opções:
| Cor       | Tamanho   | Quantidade máxima |
| Vermelho  | P, M, G   | 10                |
| Azul      | P, M, G   | 10                |
| Verde     | P, M, G   | 10                |

Quando ele seleciona as opções da tabela abaixo:

| Cor | Tamanho | Quantidade |
| cor | tamanho | quantidade |

Então o sistema deve validar as seleções
E exibir o produto configurado com as opções selecionadas:

| Cor | Tamanho | Quantidade |
| cor | amanho  | quantidade |

#----------------------------------------------------------------------------------------------------------------------------------------
#Login na Plataforma
 #cenario usando contexto

 Funcionalidade: Login
Cenário: Login com sucesso
Dado que o cliente esteja na página de login da EBAC-SHOP
Quando o cliente digita um e-mail e senha válidos
E clica no botão "Entrar"
Então o sistema deve direcioná-lo para a tela de checkout
E o sistema deve exibir seus pedidos

Cenário: Login falho com e-mail inválido
Dado que o cliente esteja na página de login da EBAC-SHOP
Quando o cliente digita um e-mail inválido e uma senha válida
E clica no botão "Entrar"
Então o sistema deve exibir a mensagem de alerta "Usuário ou senha inválidos"
E o sistema deve permanecer na página de login

Cenário: Login falho com senha inválida
Dado que o cliente esteja na página de login da EBAC-SHOP
Quando o cliente digita um e-mail válido e uma senha inválida
E clica no botão "Entrar"
Então o sistema deve exibir a mensagem de alerta "Usuário ou senha inválidos"
E o sistema deve permanecer na página de login

Cenário: Login falho com e-mail e senha inválidos
Dado que o cliente esteja na página de login da EBAC-SHOP
Quando o cliente digita um e-mail inválido e uma senha inválida
E clica no botão "Entrar"
Então o sistema deve exibir a mensagem de alerta "Usuário ou senha inválidos"
E o sistema deve permanecer na página de login

#cenarios usando esquema do cenario
Funcionalidade: Login
Cenário: Login com credenciais válidas | Login com credenciais inválidas
Dado que o cliente esteja na página de login da EBAC-SHOP
Quando o cliente digita o e-mail e a senha
E clica no botão "Entrar"
Então o sistema deve direcioná-lo para a tela de checkout | exibir a mensagem de alerta "Usuário ou senha inválidos"
E o sistema deve exibir seus pedidos | permanecer na página de login

| e-mail	                | senha	        | Resultado                         |
| yuranremane51@gmail.com	| senha123	    | Login com sucesso                 |
| yuranremane51@gmail.com   | senha123	    | Login com credenciais inválidas   |
| yuranremane51@gmail.com	| senhainvalida	| Login com credenciais inválidas   |  
| yuranremane51@gmail.com	| senhainvalida	| Login com credenciais inválidas   |


#cenario usando tabela de dados
Funcionalidade: Login
Cenário: Login com credenciais

Dado que o cliente esteja na página de login da EBAC-SHOP
Quando o cliente insere as credenciais da seguinte tabela:

| E-mail                  | Senha           | Resultado                       |
| yuranremane51@gmail.com | senha123        | Login com sucesso               |
| yuranremane51@gmail.com | senha123        | Login com credenciais inválidas |
| yuranremane51@gmail.com | senhainvalida   | Login com credenciais inválidas |
| yuranremane51@gmail.com | senhainvalida   | Login com credenciais inválidas |

Então o sistema deve direcionar o cliente para a tela de checkout **ou** exibir a mensagem de alerta "Usuário ou senha inválidos"

#-----------------------------------------------------------------------------------------------------------------------------------------------
 
 #Tela de cadastro - Checkout
 #cenario usando contexto

 Funcionalidade: Finalização de Cadastro
Cenário: Cadastro Completo e Válido
Dado que o cliente acessa a página de cadastro da EBAC-SHOP
Quando ele preenche todos os campos obrigatórios com dados válidos
E confirma o cadastro
Então o sistema deve cadastrar o cliente com sucesso
E exibir uma mensagem de confirmação de cadastro

Cenário: Campo de E-mail Inválido
Dado que o cliente acessa a página de cadastro da EBAC-SHOP
Quando ele preenche todos os campos obrigatórios, exceto o campo de e-mail, com dados válidos
E informa um e-mail no formato inválido
E confirma o cadastro
Então o sistema deve exibir uma mensagem de erro informando o formato correto do e-mail

Cenário: Campos Obrigatórios Vazios
Dado que o cliente acessa a página de cadastro da EBAC-SHOP
Quando ele tenta cadastrar sem preencher nenhum campo obrigatório
E confirma o cadastro
Então o sistema deve exibir uma mensagem de alerta informando quais campos precisam ser preenchidos

#cenarios usando esquema do cenario
Funcionalidade: Finalização de Cadastro
Esquema do Cenário:

| Nome do Cenário	            | Dados	                                | Quando	                                                                                                                                            | Então                                                                                             |
| Cadastro Completo e Válido	| O cliente acessa a página de cadastro	| Ele preenche todos os campos obrigatórios com dados válidos e confirma o cadastro	                                                                    | O sistema deve cadastrar o cliente com sucesso e exibir uma mensagem de confirmação de cadastro   |
| Campo de E-mail Inválido	    | O cliente acessa a página de cadastro	| Ele preenche todos os campos obrigatórios, exceto o campo de e-mail, com dados válidos e informa um e-mail no formato inválido e confirma o cadastro	| O sistema deve exibir uma mensagem de erro informando o formato correto do e-mail                 |
| Campos Obrigatórios Vazios	| O cliente acessa a página de cadastro	| Ele tenta cadastrar sem preencher nenhum campo obrigatório e confirma o cadastro	                                                                    | O sistema deve exibir uma mensagem de alerta informando quais campos precisam ser preenchidos     |


#cenario usando tabela de dados
Funcionalidade: Finalização de Cadastro
Cenário: Cadastro Completo e Válido com Dados Variados

Dado que o cliente acessa a página de cadastro da EBAC-SHOP
Quando ele preenche os campos obrigatórios com os seguintes dados:

    | Nome          | Email                   | Data de Nascimento  | Senha     | Telefone | Localidade      | Número | Bairro |  Cidade | Sexo |
    | João Silva    | yuranremane51@gmail.com | 01/01/1980          | senha1234 | 9999-9999 | Rua das Flores | 123    | Centro | Matola  | M    |
    | Maria Gomes   | yuranremane51@gmail.com | 02/02/1990          | senha4321 | 8888-8888 | Avenida Angola | 456    | Jardim | Maputo  |  F   |

E confirma o cadastro
Então o sistema deve cadastrar o cliente com sucesso
E exibir uma mensagem de confirmação de cadastro


Cenário: Campo de E-mail Inválido com Dados Variados
Dado que o cliente acessa a página de cadastro da EBAC-SHOP
Quando ele preenche os campos obrigatórios com os seguintes dados, exceto o campo de e-mail, e informa um e-mail no formato inválido:

    | Nome          | Email                   | Data de Nascimento  | Senha     | Telefone | Localidade      | Número | Bairro |  Cidade | Sexo |
    | João Silva    | yuranremane51@gmail.com | 01/01/1980          | senha1234 | 9999-9999 | Rua das Flores | 123    | Centro | Matola  | M    |
    | Maria Gomes   | yuranremane51@gmail.com | 02/02/1990          | senha4321 | 8888-8888 | Avenida Angola | 456    | Jardim | Maputo  |  F   |

    E confirma o cadastro
Então o sistema deve exibir uma mensagem de erro informando o formato correto do e-mail


Cenário: Campos Obrigatórios Vazios
Dado que o cliente acessa a página de cadastro da EBAC-SHOP
Quando ele tenta cadastrar sem preencher nenhum campo obrigatório
E confirma o cadastro
Então o sistema deve exibir uma mensagem de alerta informando quais campos precisam ser preenchidos
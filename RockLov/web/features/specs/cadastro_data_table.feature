#language: pt

Funcionalidade: Cadastro

    Sendo um músico que possui equipamentos musicais
    Quero fazer o meu cadastro no RockLov
    Para que eu possa disponibilizá-los para locação

    @realizar_cadastro
    Cenario: Fazer cadastro
    #Cenario em tipo data table do cucumber 

        Dado que acesso a pagina de cadastro
        Quando submeto o meu formulario de cadastro completo:
        |nome    |email                  |senha|
        |Jonathan|eshopmundial@gmail.com|857224|
        Entao sou redirecionado para o Dashboard
    
    @tentativa_cadastro
    Cenario: Submeter cadastro sem nome

        Dado que acesso a pagina de cadastro
        Quando submeto o meu formulario de cadastro completo:
        |nome    |email                  |senha|
        |        |eshopmundial@gmail.com|857224|
        Entao eu vejo a mensagem de alerta "Oops. Informe seu nome completo!"
    @tentativa_cadastro
    Cenario: Submeter cadastro sem o email

        Dado que acesso a pagina de cadastro
        Quando submeto o meu formulario de cadastro completo:
        |nome    |email                  |senha|
        |Jonathan|                      |857224|
        Entao eu vejo a mensagem de alerta "Oops. Informe um email válido!"
    @tentativa_cadastro
    Cenario: Submeter cadastro com um email incorreto

        Dado que acesso a pagina de cadastro
        Quando submeto o meu formulario de cadastro completo:
        |nome    |email                  |senha|
        |Jonathan|eshopmundial!gmail.com|857224|
        Entao eu vejo a mensagem de alerta "Oops. Informe um email válido!"
    @tentativa_cadastro
    Cenario: Submeter o cadastro sem informar a senha

        Dado que acesso a pagina de cadastro
        Quando submeto o meu formulario de cadastro completo:
        |nome    |email                  |senha|
        |Jonathan|eshopmundial@gmail.com|      |
        Entao eu vejo a mensagem de alerta "Oops. Informe sua senha secreta!"


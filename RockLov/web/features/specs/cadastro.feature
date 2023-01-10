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
            | nome     | email                  | senha  |
            | Jonathan | eshopmundial@gmail.com | 857224 |
        Entao sou redirecionado para o Dashboard

    Esquema do Cenario: Tentativa de Cadastro

        Dado que acesso a pagina de cadastro
        Quando submeto o meu formulario de cadastro completo:
            | nome         | email         | senha         |
            | <nome_input> | <email_input> | <senha_input> |
        Entao eu vejo a mensagem de alerta "<mensagem_output>"

        Exemplos:
            | nome_input | email_input            | senha_input | mensagem_output                  |
            |            | eshopmundial@gmail.com | 857224      | Oops. Informe seu nome completo! |
            | Jonathan   |                        | 857224      | Oops. Informe um email válido!   |
            | Jonathan   | big!gmail.com          | 857224      | Oops. Informe um email válido!   |
            | Jonathan   | eshopmundial@gmail.com |             | Oops. Informe sua senha secreta! |





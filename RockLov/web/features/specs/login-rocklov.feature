#language: pt

Funcionalidade: Login
    Sendo um usuário cadastrado
    Quero acessar o sistema da Rocklov
    Para que eu possa anunciar meus equipamentos musicais

    @login_usuario
    Cenario: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais válidas "eshopmundial@gmail.com" e "857224"
        Então sou redirecionado para o Dashboard

    Esquema do Cenario: Tentar logar

        Dado que acesso a página principal
        Quando submeto minhas credenciais válidas "<email_input>" e "<senha_input>"
        Entao eu vejo a mensagem de alerta "<mensagem_output>"

        Exemplos:
            | email_input            | senha_input | mensagem_output                  |
            | eshopmundial@gmail.com | 857234      | Usuário e/ou senha inválidos.    |
            | kline16!gmail.com      | 857224      | Oops. Informe um email válido!   |
            |                        | 857224      | Oops. Informe um email válido!   |
           | eshopmundial@gmail.com |             | Oops. Informe sua senha secreta! |
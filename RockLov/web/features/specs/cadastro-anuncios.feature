#language: pt

Funcionalidade: Cadastro de anúncios
    Sendo usuario cadastrado no Rocklov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibiliza-los para locação

    Contexto: Login
        * Login com "eshopmundial@gmail.com" e "857224"
    #Cenario utilizando a forma de criacao chave valor do cucumber, nessa modalidadade
    #utilizamos quando temos o cadastro de apenas um item na tabela, diferente do data_table
    #onde podemos cadastrar varios itens na massa de dados
    Cenario: Novo equipo
        Dado que eu acesso o formulario de cadastro de anuncios
            E que eu tenho o seguinte equipamento:
            | nome      | Fender strato |
            | categoria | Cordas        |
            | preco     | 200           |
            | thumb      | fender-sb.jpg |
        Quando submeto o cadastro desse item
        Entao devo ver esse item no dashboard
    @sem_foto
    Esquema do Cenario: Tentativa de cadastro de anuncios
        Dado que eu acesso o formulario de cadastro de anuncios
            E que eu tenho o seguinte equipamento:
            | thumb     | <thumb>     |
            | nome      | <nome>      |
            | categoria | <categoria> |
            | preco     | <preco>     |

        Quando submeto o cadastro desse item
        Entao deve conter a mensagem de alerta "<saida>"

        Exemplos:
            | thumb     | nome            | categoria | preco | saida                                |
            |           | Violao de nylon | Cordas    | 150   | Adicione uma foto no seu anúncio!    |
            | amp.jpg   |                 | Cordas    | 150   | Informe a descrição do anúncio!      |
            | baixo.jpg | Bateria Heaven  |           | 150   | Informe a categoria                  |
            | mic.jpg   | Teclado casio   | Teclas    |       | Informe o valor da diária            |
            | conga.jpg | Conga           | Outros    | Abc   | O valor da diária deve ser numérico! |

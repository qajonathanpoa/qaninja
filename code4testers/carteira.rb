    #Programinha para capturar a idade e nome da pessoa e validar se ela pode tirar
    #a carteira
    
    puts "Qual o seu nome?"
    #O gets executa a mesma função do leia (entrada de dados)
    # e utilizando o chomp para não executar quebra de linha
    nome = gets.chomp
    #Convertendo string do terminal que recebo pelo método to_i
    #para inteiro
    puts "Informe a sua idade"
    idade = gets.chomp.to_i
    # puts idade.class
    
    #Abaixo estou fazendo uma condicional em Ruby..se o valor da condicional
    #retornar Verdadeiro ele executa o que está na condicional, se retornar falso
    #ele não executa
    #E utilizando a interpolação de strings com os parâmetros '#{nome_variavel}'
    if (idade >= 18)
        puts "#{nome} você tem #{idade} anos e portanto pode tirar sua carteira de motorista :)"
    elsif (idade >= 7) 
        puts "#{nome} você tem #{idade} anos e portanto só pode andar de bicicleta ;)"  
    #Também posso utilizar o 'else' se ele retornar falso executa o que está no else
    else
        puts "#{nome} você tem #{idade} anos portanto é muito jovem e só pode andar de motoquinha =D"
    
    end
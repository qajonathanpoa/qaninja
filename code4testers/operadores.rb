# #Operadores matematicos

# def soma(n1, n2)
#     puts n1 + n2

#     end
#     soma(2,3)


    # def subtrai(n1, n2)
    # puts n1 - n2
    
    # end
    # subtrai(2,3)

    # def multiplica(n1, n2)
    #     puts n1 * n2

    # end
    # multiplica(2,4)

    # def divide (n1 , n2)
    #     puts n1 / n2

    # end 
    # divide (4,2)

    #Abaixo estou utilizando o método nativo do ruby 'to_f'para converter inteiro em float e
    #o "round" para concatenar as casas decimais
    def divide(n1,n2)
        resultado = (n1.to_f / n2.to_f).round(2)
        puts resultado
        puts resultado.class
    end
    
    divide(10,3)
    

    #Operadores de comparação

    def maior_que(v1, v2)
        puts v1 > v2

    end
    # #Retorna "true" porque 10 é maior que 5
    maior_que(10,5)

    #Retorna false porque 5 é menor que 10
    #maior_que (5,10)

    # #Retorna false porque 10 é igual a 10
    # maior_que(10, 10)

    #Retorna true porque 5 é menor que 10
    def menor_que (v1, v2)
        puts v1 < v2
    end
    menor_que(5,10)

  
    def maior_ou_igual_que(v1,v2)
        puts v1 >= v2
    end
    #   #Retorna true porque 10 é igual a 10
    # # maior_ou_igual_que(10,10)

    # #Retorna true porque 15 é maior que 10
    # maior_ou_igual_que(15,10)

    def menor_ou_igual_que(v1,v2)
        puts v1 <= v2 
    end
    #Retorna true, porque  5 é igual a 5
    # #menor_ou_igual_que(5,5)

    # #Retorna true porque 5 é menor que 10
    # #menor_ou_igual_que(5, 10)

    # #Retorna false porque 10 não é menor que 5
    # menor_ou_igual_que(10,5)

    
    def igual(v1, v2)
        puts v1 == v2
        
    end
    #Deve retornar true porque 10 realmente é igual a 10
    #igual(10,10)

    #Deve retornar false porque os tipos de dados são diferentes, um é inteiro e o outro
    #é string
    #igual(10,"10")

    #Deve retornar false porque 10 é diferente de 9
    #igual(10,9)

    def diferente(v1,v2)
        puts v1 != v2

    end
    #Deve retornar true pq de fato 10(inteiro) é diferente de 10(string)
    #diferente (10,"10")
    #diferente(10,"10")

    #Deve retornar false porqe ambos são iguais
    #diferente(10,10)

    # #Deve retornar true porque de fato eles são diferentess
    # diferente(10,5)





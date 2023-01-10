# Na classe Carro nós temos as caracteríticas que podemos atribuir a ele como: Nome,Marca,Modelo,Cor e etc
# Como função podemos pensar que tem - Ligar, buzinar, Parar...e etc

#Uma classe no Ruby é um ojbeto que tem características e funções 
# As características de uma classe dentro do Ruby podem ser definidas dentro
# de uma propriedade  - "attr_accessor"

# Criada a classe veículo para definir tudo o que é em comum entre as classes carro e moto 
#através da herança conforme exemplos abaixo
class Veiculo
    attr_accessor :nome, :marca, :ano, :cor
    #Criando o método construtor "initialize" para que seja obrigado a informar as características
    # de nossa classe...Quando criamos um método initialize dentro de uma classe ruby, ele é executado
    # toda vez que uma classe é instanciada
    
    def initialize(nome, marca, ano)
        @nome = nome
        @marca = marca
        @ano = ano
       
    end

    def define_cor(cor)
        @cor = cor
            
    end
    
end

class Carro < Veiculo
    
    def ligar 
       puts "O #{@nome} #{@marca} #{@ano}  está pronto #{@cor} para iniciar o trajeto"
    end

    def dirigir
        puts "O #{@nome} #{@marca} #{@ano} está #{@cor} iniciando o trajeto" 
    end
   
        
    

end

class Moto < Veiculo
    
    def ligar 
       puts "A #{@nome} #{@ano} #{@cor} está pronta para iniciar o trajeto"
    end
    def pilotar
        puts "A #{@nome} #{@cor} está iniciando o trajeto" 
    end
  
end

# cg = Moto.new("CG", "Honda")
# cg.define_cor("Vermelha")
# cg.ligar

#Para utilizarmos a classe nós devemos instanciar a mesma, utilizando o comando nome da classe + new
# e podemos guardar essa instancia em uma variável...

chevette = Carro.new("Chevette", "GM", "1958")
chevette.ligar
chevette.dirigir
chevette.define_cor("Azul")

# chevette.define_cor("rosa")

# chevette.nome = "Chevettinho (Conteúdo da característica nome)"
# chevette.marca = "GM"
# chevette.cor ="Bege"
# chevette.ano ="1988"

# Chamando uma função do meu carro
# chevette.ligar
# chevette.dirigir

# # Chamando uma função do meu carro
# fusca = Carro.new
# # fusca.nome = "Fusca"
# # fusca.marca = "VW"
# # fusca.cor ="Preto"
# fusca.ligar

ninja = Moto.new("Ninja", "Kawasaki", "2001")
# ninja.nome = "Ninja"
# ninja.marca = "Kawasaki"
# ninja.cor ="Verde"
ninja.ligar
ninja.pilotar


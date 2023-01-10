#Hashes são conjuntos de dados em que acessamos 
#as posições endereçadas através 
#de uma chave! Diferente do array em que o acesso as informações é por posições numéricas
#através de números inteiros [1], [2]...

fernando = {nome: "Fernando", email: "fernando@gmail.com", legal: true}

#Abaixo eu estou pedindo a exibição do conteúdo da variável "fernando"
#que no caso é um objeto do tipo hash
# puts fernando [:nome]
# puts fernando [:email]
# puts fernando [:legal]

joao = {nome: "Jonathan", email: "jonathan@gmail.com", legal: true}

# puts joao [:nome]
# puts joao [:email]
# puts joao [:legal]

#Manipulando informações criei um array de nome pessoas1 onde consigo dizer como parametro
#que as variaveis "fernando" e "joao" são posicoes do meu array 
#consigo manipular as informações dos hashes criados, acessando suas chaves
#como  :nome,:email e etc..
# puts pessoas = [fernando, joao].class
pessoas1 = [fernando, joao]
puts pessoas1 [0][:nome]
puts pessoas1 [1]
# puts pessoas1 [0][:email]
# puts pessoas1 [1][:nome]

# puts pessoas [0][:nome]
# puts pessoas [1][:email]
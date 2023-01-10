#Array é um conjunto de dados acessado através de seu índice que sempre o primeiro indice é 0
#a posição do array é acessada através do número inteiro,
#no array abaixo temos 3 informações de bandas

bandas = ["AC-DC", "Black Sabbath", "Queen", "Os Travessos"]
# tamanhos = [1.80, 2.20, 3.50]

bandas.push("Legiao urbana", "Iron Maiden")

#Filtro dizendo "contains" onde eu faço uma pesquisa se dentro do array
#existe um item que contem o parametro que preciso
bandas.delete('Queen')
bandas.delete("Iron Maiden")
pesquisa_bandas = bandas.find { |item_array| item_array.include?('Travessos') }

puts pesquisa_bandas
#Inserindo .class para ver o conteúdo do indice do array 2, quando é nulo
#o ruby retorna "Nilclass"
# puts bandas [2].class;

#Para adicionar conteúdos ao array utilizamos o método .push
# bandas.push("U2")
# # puts bandas

# #Para deletar um item basta utilziar o metodo .delete
#   bandas.delete("Queen")


#   #Utilizando o método find e o operador de comparação ==
#   pagode = bandas.find { |item_array| item_array == 'U2' }

#   pagode = bandas.find { |item_array| item_array.include?('U2') }
  
#   puts pagode
#   puts bandas
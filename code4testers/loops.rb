#Utilizando o times para executar loopings no Ruby

# i = 1
# 5.times do
#     puts "O i vai incrementar #{i}"
#     i = i + 1
# end

 bandas = ["Aerosmith", "So pra contrariar", "Claudinho e Bochecha", "Guns n roses","Anitta"]

#No laço abaixo estou executando o times a quantidade de itens 
# que tem no meu array iniciando a variavel 'i' com o valor zero
#para incrementar a cada laço o nome das bandas
# i = 0
# bandas.size.times do
#     puts bandas [i]
#     i = i + 1

#     end

#O foreach faz o mesmo trabalho do times, a diferença é que não
#preciso me preocupar com o tamanho das informações.
#Ele percorre automatico e é mais performático
bandas.each do |banda|
     puts banda

end
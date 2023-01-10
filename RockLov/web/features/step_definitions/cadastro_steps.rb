#Cenario @realizar_cadastro

Dado("que acesso a pagina de cadastro") do
  @cadastro_page.abrir_pagina_cadastro
end

Quando("submeto o meu formulario de cadastro completo:") do |table|

  #Objeto user que transforma os dados da massa de dados chave/valor em um objeto Ruby
  user = table.hashes.first
  MongoDB.new.remove_user(user[:email])
  @cadastro_page.cadastrar(user)
end

Dado("Login com {string} e {string}") do |email, password|
  @email = email
  @login_page.abrir
  @login_page.logar(email, password)
end

Dado("que eu acesso o formulario de cadastro de anuncios") do
  @dash_page.vai_para_pagina_equipos
end

Dado("que eu tenho o seguinte equipamento:") do |table|
  #convertendo os dados da tabela para um hash, um objeto ruby
  @anuncio = table.rows_hash
  MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end

Quando("submeto o cadastro desse item") do
  @equipos_page.criar_anuncio(@anuncio)
end

Entao("devo ver esse item no dashboard") do
  #Fazendo a validação através dos elementos da dash_page para separar de fato do page objects o expect
  # e na camada dos métodos aí sim validando devidamente com o rspec
  expect(@dash_page.lista_de_equipamentos).to have_content @anuncio[:nome]
  expect(@dash_page.lista_de_equipamentos).to have_content "R$#{@anuncio[:preco]}/dia"
end

Entao("deve conter a mensagem de alerta {string}") do |expect_alert|
  expect(@alert.dark).to have_text expect_alert
end

Entao("sou redirecionado para o Dashboard") do
  #Utilizando o expect do rspec e page do capybara para fazer a asserção do elemento em css na página que preciso
  expect(@dash_page.estou_no_dashboard?).to be true
end

Entao("eu vejo a mensagem de alerta {string}") do |expect_alert|
  expect(@alert.dark).to eql expect_alert
end

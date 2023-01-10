class CadastroPage
  include Capybara::DSL

  def abrir_pagina_cadastro
    visit "/signup"
  end

  def cadastrar(user)
    find("#fullName").set user[:nome]
    find("#email").set user[:email]
    find("#password").set user[:senha]

    click_button "Cadastrar"
  end
end

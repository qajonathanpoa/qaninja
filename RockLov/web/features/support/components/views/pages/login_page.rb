class LoginPage
  include Capybara::DSL

  def abrir
    visit "/"
  end

  #Organizado o método no formato AppActions, onde nós criamos os métodos e funções
  #mais orientado a funcionalidade, para facilitar a manutenabilidade do código
  def logar(email, password)
    find("input[placeholder='Seu e-email']").set email
    find("input[placeholder='Sua senha secreta']").set password
    click_button "Entrar"
  end
end

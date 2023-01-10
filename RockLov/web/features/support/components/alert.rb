#Criada a classe Alert para organizar os elementos que são componentes compartilhados no projeto
#como o exemplo do componente alert dark que é compartilhado no shared steps em cadastro de anuncios e usuarios
class Alert 
include Capybara::DSL

def dark

    return find(".alert-dark").text
end
end
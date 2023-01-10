class DashPage
include Capybara::DSL
    def vai_para_pagina_equipos
        click_button "Criar anúncio" 

    end

    def lista_de_equipamentos
    
        #Validado com rspec se o nome do equipamento cadastrado existe na tela, encapsulando pela dash page
        return find(".equipo-list")
   
    end

    def estou_no_dashboard?
     return page.has_css?(".dashboard")
    end
end
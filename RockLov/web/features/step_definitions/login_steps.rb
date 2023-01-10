                                                                                     
Dado('que acesso a página principal') do                                             
    
    @login_page.abrir
  end                                                                                  
                                                                                       
  Quando('submeto minhas credenciais válidas {string} e {string}') do |email, password|
  
    @login_page.logar(email, password) 
end                                                                                  
require_relative "base_api"

class Signup < BaseApi
  def create(payload)

    #passando a rota com o HTTParty já convertendo do hash do Ruby para o formato que a API aceita que é Json
    #e utilizando o recurso self.class que é para termos acesso a todas as propriedades da classe
    return self.class.post(
             "/signup",
             body: payload.to_json,
             headers: {
               #Passando o cabeçalho/Header da requisição
               "Content-type": "application/json",
             },
           )
  end
end

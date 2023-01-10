require_relative "base_api"

class Equipos < BaseApi
  def create(payload, user_id)

    #passando a rota com o HTTParty já convertendo do hash do Ruby para o formato que a API aceita que é Json
    #e utilizando o recurso self.class que é para termos acesso a todas as propriedades da classe
    return self.class.post(
             "/equipos",
             body: payload,
             headers: {
               #Passando o cabeçalho/Header da requisição
               "user_id": user_id,
             },
           )
  end

  def find_by_id(equipo_id, user_id)
    return self.class.get(
             "/equipos/#{equipo_id}",
             headers: {
               "user_id": user_id,
             },
           )
  end

  def remove_by_id(equipo_id, user_id)
    return self.class.delete(
             "/equipos/#{equipo_id}",
             headers: {
               "user_id": user_id,
             },
           )
  end
end

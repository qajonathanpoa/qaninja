#encoding: utf-8
#Acima foi utilizado o encoding utf-8 para poder trabalhar com acentuações no código
# e na implementação foi invocado o método do ruby para se tornar compatival com o formato do httparty

#1-Cria o describe
describe "DELETE /equipos/{equipo_id}" do
  #Before para passar o id do usuario na autenticacao
  before(:all) do
    @payload = { email: "eshopmundial@gmail.com", password: "857224" }
    result = Sessions.new.login(@payload)
    @user_id = result.parsed_response["_id"]
  end

  #2-Cria o context ou seja o cenario
  context "obter unico equipo" do

    #3-Cria o Before
    before(:all) do
      #Dado que eu tenho um novo equipamento
      @payload = {
        thumbnail: Helpers::get_thumb("clarinete.jpg"),
        name: "Clarinete",
        category: "Áudio e Tecnologia".force_encoding("ASCII-8BIT"),
        price: 199,
      }

      MongoDB.new.remove_equipo(@payload[:name], @user_id)
      #alterado o nome da variavel para "@equipo" pois o contexto é pegar o id do equipamento
      equipo = Equipos.new.create(@payload, @user_id)
      @equipo_id = equipo.parsed_response["_id"]

      # quando faco uma requisicao delete por id
      @result = Equipos.new.remove_by_id(@equipo_id, @user_id)
    end
    it ("deve retornar 204") do
      expect(@result.code).to eql 204
    end
  end

  context "equipo não existe" do
    before(:all) do
      @result = Equipos.new.remove_by_id(MongoDB.new.get_mongo_id, @user_id)
    end

    it "deve retornar 204" do
      expect(@result.code).to eql 204
    end
  end
end

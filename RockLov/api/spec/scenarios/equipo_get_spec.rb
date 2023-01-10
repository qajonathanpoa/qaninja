#1-Cria o describe
describe "GET /equipos/{equipo_id}" do
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
        thumbnail: Helpers::get_thumb("sanfona.jpg"),
        name: "Sanfona",
        category: "Outros",
        price: 499,
      }

      MongoDB.new.remove_equipo(@payload[:name], @user_id)
      #alterado o nome da variavel para "@equipo" pois o contexto é pegar o id do equipamento
      equipo = Equipos.new.create(@payload, @user_id)
      @equipo_id = equipo.parsed_response["_id"]

      # quando faco uma requisicao get por id
      @result = Equipos.new.find_by_id(@equipo_id, @user_id)
    end
    it ("deve retornar 200") do
      expect(@result.code).to eql 200
    end
    it ("retorna o nome do equipamento cadastrado") do
      #   expect(@result.parsed_response).to include("name" => @payload[:name])
      # it ("deve retornar o nome") do
      expect(@result.parsed_response).to include("name" => @payload[:name])
      # end
    end
  end

  context "equipo não existe" do
    before(:all) do
      @result = Equipos.new.find_by_id(MongoDB.new.get_mongo_id, @user_id)
    end

    it "deve retornar 404" do
      expect(@result.code).to eql 404
    end
  end
end

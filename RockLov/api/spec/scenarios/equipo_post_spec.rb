describe "POST /equipos" do
  #Criado um before dentro do describe para invocar o metodo login e a rota sessions,
  #a fim de pegar o _id do usuario.
  before(:all) do
    payload = { email: "eshopmundial@gmail.com", password: "857224" }
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end
  context "novo equipo" do
    before(:all) do
      payload = {
        thumbnail: Helpers::get_thumb("Kramer.jpg"),
        name: "Kramer Edie van halen",
        category: "Cordas",
        price: 299,
      }

      MongoDB.new.remove_equipo(payload[:name], @user_id)

      @result = Equipos.new.create(payload, @user_id)
    end
    it "deve retornar 200" do
      expect(@result.code).to eql 200
    end
  end

  context "nao autorizado" do
    before(:all) do
      payload = {
        thumbnail: Helpers::get_thumb("Baixo.jpg"),
        name: "Contra baixo",
        category: "Cordas",
        price: 49,
      }

      @result = Equipos.new.create(payload, nil)
    end
    it "deve retornar 401" do
      expect(@result.code).to eql 401
    end
  end
end

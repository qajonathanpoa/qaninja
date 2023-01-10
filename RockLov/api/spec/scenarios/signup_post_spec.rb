
describe "POST /signup" do
  context "novo usuario" do
    before(:all) do
      payload = { name: "Pitty", email: "pity@bol.com.br", password: "857224" }
      MongoDB.new.remove_user(payload[:email])
      @result = Signup.new.create(payload)
    end

    it "valida status code do post retorna" do
      expect(@result.code).to eql 200
    end
    it "devolveu a situação da requisição" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  context "usuario ja existe" do
    before(:all) do
      #Dado que eu tenho um novo usuario
      payload = { name: "Joao da silva", email: "joao@ig.com.br", password: "857224" }
      MongoDB.new.remove_user(payload[:email])

      #E o email desse usuario ja esta cadastrado no sistema
      Signup.new.create(payload)

      #Quando faco uma requisição para a rota Signup
      @result = Signup.new.create(payload)
    end
    #entao deve retornar 409
    it "Deve retornar 409" do
      expect(@result.code).to eql 409
    end
    it "deve retornar a seguinte mensagem" do
      #Parsed reponse para pegar o nome do campo que a requisição devolve na Api
      expect(@result.parsed_response["error"]).to eql "Email already exists :("
    end
  end

  context "validar nome obrigatorio" do
    before(:all) do
      #Dado que eu tenho um novo usuario
      payload = { name: "", email: "joana@ig.com.br", password: "857224" }
      @result = Signup.new.create(payload)
    end
    it "Deve retornar 412" do
      expect(@result.code).to eql 412
    end
    it "deve retornar a seguinte mensagem" do
      expect(@result.parsed_response["error"]).to eql "required name"
    end
  end
  context "validar email obrigatorio" do
    before(:all) do
      #Dado que eu tenho um usuario sem email
      payload = { name: "Joana Darc", email: "", password: "857224" }
      #Quando faço a requisicao para a rota signup
      @result = Signup.new.create(payload)
    end
    #entao deve retornar 412
    it "Deve retornar 412" do
      expect(@result.code).to eql 412
    end
    it "deve retornar a seguinte mensagem required email" do
      expect(@result.parsed_response["error"]).to eql "required email"
    end
  end
  context "validar senha obrigatoria" do
    before(:all) do
      #Dado que eu tenho um usuario sem email
      payload = { name: "Joana Darc", email: "priscila.fantini@ig.com.br", password: "" }
      #Quando faço a requisicao para a rota signup
      @result = Signup.new.create(payload)
    end
    it "Deve retornar 412" do
      expect(@result.code).to eql 412
    end
    it "deve retornar a seguinte mensagem required email" do
      expect(@result.parsed_response["error"]).to eql "required password"
    end
  end
end

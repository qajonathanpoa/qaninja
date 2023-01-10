#Criação da suite
describe "POST /sessions" do

  o it é como se fosse o cenário do rspec
  context "login com sucesso" do
    before(:all) do
      @result = Sessions.new.login(e[:payload])
    end

    it "valida status code do post retorna 200" do
      expect(@result.code).to eql 200
    end
    it "valida se o id do usuario é igual a 24" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end
  examples = [
    {
      title: "login com sucesso",
      payload: { email: "eshopmundial@gmail.com", password: "857224" },
      code: 200,

    },
    {
      title: "senha invalida",
      payload: { email: "eshopmundial@gmail.com", password: "857226" },
      code: 401,
      error: "Unauthorized",

    },
    {
      title: "senha em branco",
      payload: { email: "eshopmundial@gmail.com", password: "" },
      code: 412,
      error: "required password",

    },
    {
      title: "usuario nao existe",
      payload: { email: "malumodas@gmail.com", password: "857799" },
      code: 401,
      error: "Unauthorized",

    },
    {
      title: "email invalido",
      payload: { email: "malumodas#gmail.com", password: "857799" },
      code: 412,
      error: "wrong email",

    },
    {
      title: "email nao informado",
      payload: { email: "", password: "857799" },
      code: 412,
      error: "required email",

    },

  ]

  examples = Helpers::get_fixture("login")

  # puts examples.to_json
  examples.each do |e|
    context "#{e[:title]}" do
      before(:all) do
        @result = Sessions.new.login(e[:payload])
      end

      it "valida status code do post retorna #{e[:code]}" do
        expect(@result.code).to eql e[:code]
      end
      it "devolveu a situação da requisição #{e[:error]}" do
        expect(@result.parsed_response["error"]).to eql e[:error]
      end
    end
  end
end

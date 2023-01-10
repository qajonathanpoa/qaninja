require "mongo"

#Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB
  attr_accessor :users, :equipos

  def initialize
    client = Mongo::Client.new("mongodb://rocklov-db:27017/rocklov")
    @users = client[:users]
    @equipos = client[:equipos]
  end

  def remove_user(email)

    #Fazendo a conexão com a base mongo para poder deletar o email caso já exista cadastrado
    #Guardando na variável client a instancia do mongo que instancia a classe Client, onde passamos os parametros
    #da base que quero conectar

    #Acessando através da collection que no caso abaixo é a users

    @users.delete_many({ email: email })
  end

  def get_user(email)
    user = @users.find({ email: email }).first
    return user[:_id]
  end

  def remove_equipo(name, user_id)
    #necessario realizar a conversão da variavel user_id pois no mongo a collection que
    #armazena o _id do usuário é do tipo OjbjectId e aqui enviamos como string
    obj_id = BSON::ObjectId.from_string(user_id)
    @equipos.delete_many({ name: name, user: obj_id })
  end

  #Criado o método apenas para criar um id aleatório que ainda não existe no banco
  #para se tornar o possível o teste de equipamento não cadastrado no cenário
  def get_mongo_id
    return BSON::ObjectId.new
  end
end

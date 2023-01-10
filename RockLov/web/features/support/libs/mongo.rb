require "mongo"

#Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB
  attr_accessor :users, :equipos

  def initialize
    client = Mongo::Client.new(CONFIG["mongo"])
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

  def remove_equipo(name, email)
    user_id = get_user(email)
    @equipos.delete_many({ name: name, user: user_id })
  end
end

module Helpers
  #Criado o metodo get_fixture para utilizar a massa de dados através do arquivo yml
  #onde estão de fato os cenários
  def get_fixture(item)
    examples = YAML.load(File.read(Dir.pwd + "/spec/fixtures/#{item}.yml"), symbolize_names: true)
  end

  def get_thumb(file_name)
    return File.open(File.join(Dir.pwd, "spec/fixtures/images", file_name), "rb")
  end

  module_function :get_thumb
  module_function :get_fixture
end

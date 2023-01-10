#Definindo as dependencias importando o capybara
require "capybara"
require "capybara/cucumber"
require "allure-cucumber"

#Criada uma constante para receber as informações do caminho relativo do projeto
#e tambem pegar o caminho dos arquivos de configuração para escolha do ambiente!
#IMPORTANTE - Dir.pwd sempre pega o caminho do projeto + caminho relativo(o que vem depois do caminho do projeto)
#O ENV no Ruby acessa as variáveis de ambiente. No caso abaixo como criei a variável CONFIG no arquivo cucumber.yml
#foi possível acessar a variável através do ENV para montar o caminho relativo e guardar dentro da constante.
CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["CONFIG"]}"))

case ENV["BROWSER"]
when "firefox"
  @driver = :selenium
when "fire_headless"
  @driver = :selenium_headless
when "chrome"
  @driver = :selenium_chrome
else
  @driver = :selenium_chrome_headless
end

#Configurando o Capybara e definindo o chrome como navegador principal do projeto
Capybara.configure do |config|
  config.default_driver = @driver
  config.app_host = CONFIG["url"]
  #timeout implicito do capybara
  config.default_max_wait_time = 5
end

AllureCucumber.configure do |config|
  config.results_directory = "/logs"
  config.clean_results_directory = true
end



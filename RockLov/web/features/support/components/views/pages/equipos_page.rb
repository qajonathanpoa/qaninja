class EquiposPage
  include Capybara::DSL

  def criar_anuncio(equipo)

    #Isso é um checkpoint para garantir que de fato fomos encaminhados para a página de anuncios
    #Espero que página contenha o seguinte seletor Css de ID - Porém sem usar "expect" pois é
    #proibido usar "expect" dentro do PageObject - UM CHECKPOINT COM TIMEOUT EXPLICITO
    page.has_css?("#equipoForm")

    upload(equipo[:thumb]) if equipo[:thumb].length > 0

    find("input[placeholder$=equipamento]").set equipo[:nome]
    select_categoria(equipo[:categoria]) if equipo[:categoria].length > 0
    find("input[placeholder^=Valor]").set equipo[:preco]

    click_button "Cadastrar"
  end

  def select_categoria(cat)
    #Select do capybara para trazer o elemento desejado na combobox através do
    #texto que enviamos na tabela chave valor
    find("#category").find("option", text: cat).select_option
  end

  def upload(file_name)

    #Passando o caminho relativo com o método Dir.pwd + o caminho das imagens no projeto
    #para que o capybara encontre a imagem no projeto e envie na automação, por fim utilizando a variável
    #equipo que irá receber os dados da massa de dados da variavel @anuncio
    #em "anuncio_steps" e o nome do campo que criei lá na tabela chave valor
    thumb = Dir.pwd + "/features/support/fixtures/images/" + file_name

    find("#thumbnail input[type=file]", visible: false).set thumb
  end
end

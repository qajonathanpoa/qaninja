Before do
  @login_page = LoginPage.new
  @cadastro_page = CadastroPage.new
  @alert = Alert.new
  @dash_page = DashPage.new
  @equipos_page = EquiposPage.new
end

After do
  temp_shot = page.save_screenshot("logs/temp_screenshot.png")

  Allure.add_attachment(
    name: "Screenshot",
    type: Allure::ContentType::PNG,
    source: File.open(temp_shot),
  )
end

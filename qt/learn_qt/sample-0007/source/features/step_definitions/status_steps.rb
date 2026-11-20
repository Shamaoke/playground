
Step "приложение запущено" do
  @application.start
end

Step "я кликаю по кнопке" do
  @application.click_button('window/main/button')
end

Step "я нажимаю пробел на кнопке" do
  @application.press_key('window/main/button', 0x20, 0)
end

Step "статус равен {string}" do |expected|

  actual = @application.get('window/main', 'status')

  expect(actual).to(eq(expected))
end


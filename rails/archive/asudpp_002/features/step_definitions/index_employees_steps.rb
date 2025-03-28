
define "сотрудник {string}" do |name|
  Employee.create!(name: name)
end

define "я открываю страницу со списком сотрудников" do
  visit employees_path
end

define "должен быть отображен {string}" do |name|
  expect(page).to have_content(name)
end


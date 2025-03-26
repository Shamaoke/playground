
define 'I visit the Quotes index page' do
  visit quotes_path
end

define 'I click on {string}' do |element|
  click_on element
end

define 'I fill in {string} with {string}' do |name, value|
  fill_in name, with: value
end

define 'I should see {string}' do |message|
  expect(page).to have_content(message)
end


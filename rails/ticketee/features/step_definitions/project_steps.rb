
define 'I visit the root page' do
  visit '/'
end

define 'I create a new project with the name {string} and the description {string}' do |name, description|

  click_link 'New project'

  fill_in 'Name', with: name
  fill_in 'Description', with: description

  click_button 'Create project'
end

define 'I should see {string}' do |message|
  expect(page).to have_content 'Project has been created'
end


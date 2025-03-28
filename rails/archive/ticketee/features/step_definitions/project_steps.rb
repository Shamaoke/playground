
define 'I visit the root page' do
  visit '/'
end

define 'I create a new project with the name {string} and the description {string}' do |name, description|

  click_link 'New project'

  fill_in 'Name', with: name
  fill_in 'Description', with: description

  click_button 'Create project'
end

define 'I should be redirected to the {string} project page' do |name|

  project = Project.find_by(name: name)

  expect(page.current_path).to eq project_path(project)
end

define 'I should see the message {string}' do |message|
  expect(page).to have_content message
end

define 'the title of the page should be {string}' do |title|
  expect(page).to have_title title
end



define "I create a movie {string} in the {string} genre" do |movie, genre|
  visit movies_path
  click_link 'Add movie'
  fill_in 'Title', with: movie
  select '1980', from: 'Release year'
  check genre
  click_button 'Save'
end

define "{string} should be in the {string} genre" do |movie, genre|
  visit genres_path
  click_link genre

  expect(page).to have_content(movie)
end



define "a genre named {string}" do |name|
  @genre = Genre.create!(name: name)
end

define "I create a movie {string} in the {string} genre" do |movie, genre|
  visit movies_path
  click_link 'Add movie'
  # fill_in 'Title', with: movie
end


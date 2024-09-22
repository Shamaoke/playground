
define 'a movie' do
  @movie = Movie.create!
end

define "I set the showtime to {string} at {string}" do |date, time|
  @movie.update_attribute(:showtime_date, Date.parse(date))
  @movie.update_attribute(:showtime_time, time)
end

define "the showtime description should be {string}" do |showtime|
  expect(@movie.showtime).to eq(showtime)
end


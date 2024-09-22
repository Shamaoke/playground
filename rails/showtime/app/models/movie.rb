class Movie < ApplicationRecord

  def showtime
    "#{showtime_date.strftime("%B %d, %Y")} (#{showtime_time.strftime("%l:%M%p").strip.downcase})"
  end
end

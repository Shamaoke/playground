class Movie < ApplicationRecord

  has_and_belongs_to_many :genres

  def showtime = "#{format_date} (#{format_time})"

  private
    def format_date = showtime_date.strftime("%B %d, %Y")

    def format_time = (
      showtime_time.min.zero? \
        ? showtime_time.strftime("%l%P") \
        : showtime_time.strftime("%l:%M%P")
    )
end

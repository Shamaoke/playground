
class MoviesController < ApplicationController

  def index = ( )

  def new = (
    @movie, @genres = [ Movie.new, Genre.all ]
  )

  def create = Movie.new(movie_params) { _1.save and redirect_to movies_path }

  private
    def movie_params = (
      params
        .require(:movie)
        .permit(:title, :release_year, { genre_ids: [ ] })
    )
end


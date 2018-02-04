class MoviesController < ApplicationController
  def index
    
  end

  def new
    @movie = Movie.new
    @parser = OmdbapiService.new(params).call
  end

  def add
    
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to root_path
    end   
  end

  private
  ##############################################################################
  
  def movie_params
    params.require(:movie).permit(:title, :description, :imdb_id)
  end
end

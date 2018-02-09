class MoviesController < ApplicationController
  def index
    @movies = Movie.includes(:genres, :countries)
    # json_response(@movies)
    # render json: @movies
    respond_to do |format|
      format.html
      format.json { render json: @movies.to_json(:include =>[ :genres, :countries]) }
    end   
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

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end

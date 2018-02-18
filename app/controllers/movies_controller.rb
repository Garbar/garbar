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
    # TODO add redirict to movie
    if params[:imdb_id]
      movie = Movie.find_by imdb_id: params[:imdb_id]
      if movie
        flash[:warning] = 'TV show with this IMDB ID is already in the database'
        redirect_to add_movies_path
      end
    end
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
    params.require(:movie).permit(:title, :description, :imdb_id, :status,
    :years, :actors, { genre_ids:[], country_ids:[] })
  end

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end

class MoviesController < ApplicationController
  def index
    @movies = Movie.includes(:genres, :countries, :note)
    # json_response(@movies)
    # render json: @movies
    respond_to do |format|
      format.html
      format.json { render json: @movies.to_json(:include =>[ :genres, :countries, :note]) }
    end   
  end

  def new
    if params[:imdb_id]
      movie = Movie.find_by imdb_id: params[:imdb_id]
      if movie
        flash[:warning] = 'TV show with this IMDB ID is already in the database'
        redirect_to add_movies_path
      end
    end
    movie = Movie.new
    movie.build_note
    @form = MovieForm.new(movie)
    @parser = OmdbapiService.new(params).call
  end

  def add
    
  end

  def create
    movie = Movie.new
    movie.build_note
    @form = MovieForm.new(movie)
    if @form.validate(movie_params)
      @form.save
      redirect_to root_path
    else
      render :new
    end  
  end

  private
  ##############################################################################
  
  def movie_params
    params.require(:movie).permit(:title, :description, :imdb_id, :status, :years,
    :actors, { note_attributes: [:_destroy, :description, :bechdel, :characters], country_ids:[], genre_ids:[] })
  end

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end

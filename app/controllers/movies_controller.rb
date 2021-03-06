class MoviesController < ApplicationController
  def index
    @movies = Movie.includes(:genres, :countries, :note).order(updated_at: :desc)
    respond_to do |format|
      format.html
      format.json { render json: @movies.to_json(:include =>[ :genres, :countries, :note]) }
    end   
    authorize @movies
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
    authorize @form
  end

  def add
    authorize Movie
  end

  def show
    @movie = Movie.find(params[:id])
    authorize @movie
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
    authorize @form
  end

  def edit
    # Using composition form
    movie = Movie.find(params[:id])
    note = movie.note
    @form = MovieForm.new(movie)
    authorize @form
  end

  def update
    movie = Movie.find(params[:id])
    note = movie.note
    @form = MovieForm.new(movie)
    if @form.validate(params[:movie])
      @form.save
      redirect_to root_path
    else
      render :new, alert: 'Errors Found'
    end
    authorize @form
  end

  private
  ##############################################################################
  
  def movie_params
    params.require(:movie).permit(:title, :description, :imdb_id, :status,
    :years, :poster, :actors,
    { note_attributes:
    [:_destroy, :description, :bechdel, :characters], country_ids:[], genre_ids:[] })
  end
end

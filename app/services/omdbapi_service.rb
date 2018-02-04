require 'faraday'
require 'json'

class OmdbapiService
  BASE = 'http://www.omdbapi.com'

  def initialize(params)
    @title = params[:title]
    @year = params[:year]
    @imdb_id = params[:imdb_id]
  end

  def api_key
    ENV['omdbapi_key']
  end

  def call
    response, status = get_json
    status == 200 ? get_data_movie(response) : errors(response)
  end

  private
  #############################################################################

  def connection
    @connection ||= Faraday.new(url: BASE) do |faraday|
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
      faraday.headers['Content-Type'] = 'application/json'
      faraday.params[:apikey] = api_key
    end
  end

  def get_json
    response = connection.get do |req|
      req.url '/'
      req.params['t'] = @title
      req.params['y'] = @year
      req.params['i'] = @imdb_id
      req.params['plot'] = 'full'
    end
    [JSON.parse(response.body), response.status]
  end

  def get_data_movie(res)
    # create default responce from any source
    movie = {}
    if res['Error']
      movie[:error] = res['Error']
    else
      movie = {
        title: res['Title'],
        year: res['Year'],
        genres: res['Genre'],
        actors: res['Actors'],
        plot: res['Plot'],
        country: res['Country'],
        imdb_id: res['imdbID']
      }
    end
    movie
  end

  def errors(response)
    error = { errors: { status: response["status"], message: response["message"] } }
    response.merge(error)
  end
end
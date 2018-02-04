class CreateGenre

  def initialize(list_genres)
    @list_genres = list_genres
  end

  def call
    find_or_create_genres
  end

  private
  #############################################################################

  #TODO check if we get array or list of genres
  def find_or_create_genres
    ids = []
    @list_genres.split(',').each do |g|
      title = g.downcase.strip
      ids << Genre.find_or_create_by(title: title).id
    end 
    ids 
  end
end
class CreateCountry

  def initialize(list_countries)
    @list_countries = list_countries
  end

  def call
    find_or_create_countries
  end

  private
  #############################################################################

  #TODO check if we get array or list of genres
  def find_or_create_countries
    ids = []
    @list_countries.split(',').each do |c|
      title = c.downcase.strip
      p title
      ids << Country.find_or_create_by(title: title).id
    end 
    ids 
  end
end
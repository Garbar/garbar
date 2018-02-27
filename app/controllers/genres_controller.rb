class GenresController < ApplicationController
  #TODO auto list of ganres for index filter
  def index
    @genres = Genre.all.collect(&:title)
    respond_to do |format|
      format.html
      format.json { render json:  filters(@genres)}
    end 
  end

  def filters(items)
    items.map {|item| {'text': item, :value => item} }
  end
end

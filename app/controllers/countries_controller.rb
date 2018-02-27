class CountriesController < ApplicationController
  def index
    @cont = Country.all.collect(&:title)
    respond_to do |format|
      format.html
      format.json { render json:  filters(@cont)}
    end 
  end

  def filters(items)
    items.map {|item| {'text': item, :value => item} }
  end
end

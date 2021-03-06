# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  imdb_id     :string
#  description :text
#  released_at :datetime
#  status      :integer
#  actors      :text
#  years       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Movie < ApplicationRecord
  attribute :pretty_status, :string
  #TODO edit enum views
  validates :imdb_id, uniqueness: true
  enum status: [:indefined, :on_air, :dead, :pause] 

  has_one :note, dependent: :destroy
  has_many :country_movies, dependent: :destroy
  has_many :countries, through: :country_movies
  has_many :genre_movies, dependent: :destroy
  has_many :genres, through: :genre_movies

  def pretty_status
    if self.indefined?
      'N/A'
    elsif self.on_air?
      'On Air'
    elsif self.dead?
      'Dead'
    else
      'Pause'
    end
  end  
end

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
  validates :imdb_id, uniqueness: true
  enum status: [:indefined, :on_air, :dead, :pause] 

  has_one :note, dependent: :destroy
  has_many :country_movies, dependent: :destroy
  has_many :countries, through: :country_movies
  has_many :genre_movies, dependent: :destroy
  has_many :genres, through: :genre_movies
end

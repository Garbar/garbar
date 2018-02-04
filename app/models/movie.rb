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
  # TODO Add enum for status
  has_one :note
  has_many :country_movies
  has_many :countries, through: :country_movies
  has_many :genre_movies
  has_many :genres, through: :genre_movies
end

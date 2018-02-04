# == Schema Information
#
# Table name: country_movies
#
#  id          :integer          not null, primary key
#  country_id  :integer
#  movie_id    :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CountryMovie < ApplicationRecord
  belongs_to :country
  belongs_to :movie
end

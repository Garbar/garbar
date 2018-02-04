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

FactoryBot.define do
  factory :country_movie do
    country nil
    movie nil
    description "MyText"
  end
end

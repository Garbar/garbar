# == Schema Information
#
# Table name: genre_movies
#
#  id          :integer          not null, primary key
#  genre_id    :integer
#  movie_id    :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :genre_movie do
    genre nil
    movie nil
    description "MyText"
  end
end

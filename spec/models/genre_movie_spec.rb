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

require 'rails_helper'

RSpec.describe GenreMovie, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

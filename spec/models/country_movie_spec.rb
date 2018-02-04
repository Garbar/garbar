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

require 'rails_helper'

RSpec.describe CountryMovie, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

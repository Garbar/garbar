# == Schema Information
#
# Table name: notes
#
#  id           :integer          not null, primary key
#  bechdel_test :integer
#  description  :text
#  movie_id     :integer
#  characters   :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :note do
    bechdel_test 1
    description "MyText"
    movie nil
    characters "MyText"
  end
end

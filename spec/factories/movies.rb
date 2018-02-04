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

FactoryBot.define do
  factory :movie do
    title "MyString"
    imdb_id "MyString"
    description "MyText"
    released_at "2018-02-04 10:28:42"
    status 1
    actors "MyText"
    years "MyString"
  end
end

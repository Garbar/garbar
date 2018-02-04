# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :genre do
    title "MyString"
  end
end

# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :country do
    title "MyString"
  end
end

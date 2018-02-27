# == Schema Information
#
# Table name: notes
#
#  id           :integer          not null, primary key
#  bechdel :integer
#  description  :text
#  movie_id     :integer
#  characters   :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Note < ApplicationRecord
  #TODO edit enum views
  belongs_to :movie, dependent: :destroy
  enum bechdel: [:indefined, :yes, :no]
end

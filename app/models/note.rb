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
  belongs_to :movie
  enum bechdel: [:indefined, :yes, :no]
end

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
  attribute :pretty_bechdel, :string
  belongs_to :movie, dependent: :destroy
  enum bechdel: [:indefined, :yes, :no]

  def pretty_bechdel
    if self.indefined?
      'N/A'
    elsif self.yes?
      'Yes'
    else
      'No'
    end
  end 
end

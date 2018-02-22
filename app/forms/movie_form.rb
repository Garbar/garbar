require "reform/form/validation/unique_validator"

class MovieForm < Reform::Form
  property :title, validates: {presence: true}
  property :imdb_id, validates: {unique: true}
  property :description
  property :years
  property :actors
  property :status
  property :genre_ids
  property :country_ids

  property :note, populate_if_empty: Note do
    property :description
    property :characters
    property :bechdel
  end
end
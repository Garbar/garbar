class CreateCountryMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :country_movies do |t|
      t.references :country, foreign_key: true
      t.references :movie, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end

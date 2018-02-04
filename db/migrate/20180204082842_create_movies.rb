class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :imdb_id
      t.text :description
      t.datetime :released_at
      t.integer :status
      t.text :actors
      t.string :years

      t.timestamps
    end
  end
end

class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.integer :bechdel_test
      t.text :description
      t.references :movie, foreign_key: true
      t.text :characters

      t.timestamps
    end
  end
end

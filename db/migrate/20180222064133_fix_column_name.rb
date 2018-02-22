class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :notes, :bechdel_test, :bechdel
  end
end

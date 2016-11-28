class AddColumnToCovers < ActiveRecord::Migration[5.0]
  def change
    add_column :covers, :coverletter, :text
  end
end

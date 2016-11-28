class AddColumnToCoversYetAgain < ActiveRecord::Migration[5.0]
  def change
  	add_column :covers, :letter, :text
  end
end

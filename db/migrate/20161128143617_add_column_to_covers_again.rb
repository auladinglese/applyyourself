class AddColumnToCoversAgain < ActiveRecord::Migration[5.0]
  def change
  	add_column :covers, :commentable_type, :string
  end
end

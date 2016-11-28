class AddColumnsToCovers < ActiveRecord::Migration[5.0]
  def change
  	add_column :covers, :commentable_id, :integer
    add_column :covers, :commentable_type, :integer
  end
end

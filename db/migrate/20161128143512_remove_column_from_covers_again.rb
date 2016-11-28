class RemoveColumnFromCoversAgain < ActiveRecord::Migration[5.0]
  def change
  	remove_column :covers, :commentable_type
  end
end

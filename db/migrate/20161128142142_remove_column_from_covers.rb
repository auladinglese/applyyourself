class RemoveColumnFromCovers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :covers, :job_id
  end
end

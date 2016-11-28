class RemoveColumnFromCoversYetAGain < ActiveRecord::Migration[5.0]
  def change
  	remove_column :covers, :coverletter
  end
end

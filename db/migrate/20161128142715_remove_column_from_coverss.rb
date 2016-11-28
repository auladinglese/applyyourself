class RemoveColumnFromCoverss < ActiveRecord::Migration[5.0]
  def change
    remove_column :covers, :letter, :text
  end
end

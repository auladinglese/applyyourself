class CreateCovers < ActiveRecord::Migration[5.0]
  def change
    create_table :covers do |t|
      t.text :letter
      t.references :user, foreign_key: true
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end

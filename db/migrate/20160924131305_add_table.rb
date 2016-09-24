class AddTable < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps
    end
    add_index :reviews, [:commentable_id, :commentable_type]
  end
end

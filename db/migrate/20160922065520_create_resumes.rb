class CreateResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :resumes do |t|
      t.text :contact
      t.string :objective
      t.text :education
      t.text :experience
      t.text :skills
      t.text :references
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author_first_name
      t.string :author_last_name
      t.references :genre, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end

class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :editor
      t.string :genre
      t.text :description
      t.string :isbn
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

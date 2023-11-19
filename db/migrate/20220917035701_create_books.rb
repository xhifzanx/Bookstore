class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.references :author, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :isbn
      t.string :year
      t.string :price
      t.text :description
      t.string :format
      t.integer :pages

      t.timestamps
    end
  end
end

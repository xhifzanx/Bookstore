class AddBuyToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :buy, :string
  end
end

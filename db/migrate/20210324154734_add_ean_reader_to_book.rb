class AddEanReaderToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :ean_reader, :string
  end
end

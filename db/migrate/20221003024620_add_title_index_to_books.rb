class AddTitleIndexToBooks < ActiveRecord::Migration[6.1]
  def change
    add_index :books, :title
  end
end

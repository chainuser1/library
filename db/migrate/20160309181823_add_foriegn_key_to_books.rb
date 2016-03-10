class AddForiegnKeyToBooks < ActiveRecord::Migration
  def change
    add_column :books, :author_id, :integer
    add_foreign_key :books, :authors, column: :author_id, primary_key: 'id', on_delete: :cascade
  end
end

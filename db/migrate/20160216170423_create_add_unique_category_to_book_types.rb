class CreateAddUniqueCategoryToBookTypes < ActiveRecord::Migration
  def change
     add_index :book_types,:category, unique: true
  end
end

class CreateAddUniqueCategoryToBookTypes < ActiveRecord::Migration
  def change
    create_table :add_unique_category_to_book_types do |t|
        add_index :book_types,:category, unique: true
    end
  end
end

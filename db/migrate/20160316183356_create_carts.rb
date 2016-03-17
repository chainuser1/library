class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts, id: false do |t|
      t.string :book_isbn
      t.string :user_username
      t.timestamps null: false
    end
  end
end

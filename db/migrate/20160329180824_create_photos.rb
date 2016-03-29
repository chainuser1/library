class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :user_username
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end

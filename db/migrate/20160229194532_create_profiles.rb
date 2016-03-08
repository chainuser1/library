class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles , id: false do |t|

      t.string :user_username
      t.string :fname
      t.string :lname
      t.string :gender
      t.string :email
      t.string :address
      t.date :birthdate
      t.timestamps null: false
    end
  end
end

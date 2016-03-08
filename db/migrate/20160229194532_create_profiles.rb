class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles , id: false do |t|

      t.string :user_email
      t.string :fname
      t.string :lname
      t.string :gender
      t.string :address
      t.date :birthdate
      t.timestamps null: false
    end
  end
end

class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_keys: true
      t.string :email
      t.string :fname
      t.string :lname
      t.string :gender
      t.string :address
      t.date :birthdate
      t.timestamps null: false
    end
  end
end

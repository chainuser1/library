class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles , id: false do |t|
      t.belongs_to :user, index: true, foreign_keys: true
      t.string :fname
      t.string :lname
      t.string :gender
      t.string :address
      t.date :birthdate
      t.timestamps null: false
    end
  end
end

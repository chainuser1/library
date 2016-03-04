class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id:false  do |t|
      t.string :email
      t.timestamps null: false
    end
    #add_index :users, :email, unique:true
  end
end

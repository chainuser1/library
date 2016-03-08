class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id:false  do |t|
      t.string :username
      t.timestamps null: false
    end
    #add_index :users, :email, unique:true
  end
end

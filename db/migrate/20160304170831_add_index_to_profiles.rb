class AddIndexToProfiles < ActiveRecord::Migration
  def change
    add_foreign_key :profiles, :users, column: :user_username, primary_key: "username", on_delete: :cascade
  end
end

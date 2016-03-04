class AddIndexToProfiles < ActiveRecord::Migration
  def change
    add_foreign_key :profiles, :users, column: :user_email, primary_key: "email", on_delete: :cascade
  end
end

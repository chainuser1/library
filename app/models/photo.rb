class Photo < ActiveRecord::Base
  belongs_to :user,foreign_key: :user_username, primary_key: 'username', dependent: :destroy
end

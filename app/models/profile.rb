class Profile < ActiveRecord::Base
  belongs_to :user, :class_name => 'User',:foreign_key => 'email'
end

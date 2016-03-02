class Profile < ActiveRecord::Base
  belongs_to :user, :class_name => 'User',:foreign_key => 'user_id'
  validates :user_id, presence: true,
            uniqueness: true
  validates :fname, presence: true
  validates :lname, presence: true
  validates :gender, presence:true
  validates :address, presence:true
  validates :birthdate, presence: true
end

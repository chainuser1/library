class User < ActiveRecord::Base
  self.primary_key='username'
  has_one :profile, class_name: 'Profile',primary_key: 'username',
          foreign_key: 'user_username', inverse_of: :user
  has_many :carts, foreign_key: :user_username, primary_key: :username
  has_many :books, through: :carts, foreign_key: :user_username, primary_key: :username
  accepts_nested_attributes_for :profile
  validates :username ,presence:true,
                      uniqueness: true


  has_secure_password
  validates :password, presence:true,
                       length: {minimum: 8, maximum: 32 , message: ' must be between 8-32 characters.'}


end

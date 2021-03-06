class User < ActiveRecord::Base
  self.primary_key='username'
  has_one :profile, class_name: 'Profile',primary_key: 'username',
          foreign_key: 'user_username'
  has_many :photos, foreign_key: :user_username, primary_key: 'username'
  has_many :carts, foreign_key: :user_username, primary_key: :username,dependent: :destroy
  has_many :books, through: :carts, foreign_key: :user_username, primary_key: :username
  validates :username ,presence:true,
                      uniqueness: true,
                      format: {with: /\A[[:alnum:]]+(?:[-_\. ]?[[:alnum:]]+)*\Z/}
  has_secure_password
  validates :password, presence:true,
                       length: {minimum: 8, maximum: 32 , message: ' must be between 8-32 characters.'}
end

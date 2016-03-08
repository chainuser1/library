class Profile < ActiveRecord::Base
  belongs_to :user, class_name: 'User',foreign_key: 'user_username',primary_key: "username", dependent: :destroy,
             inverse_of: :user
  REGEX_EMAIL_PATTERN=/([a-z0-9_]|[a-z0-9_]+\.[a-z0-9_]+)@(([a-z0-9]|[a-z0-9]+\.[a-z0-9]+)+\.([a-z]{2,4}))/i

  validates :user_username, presence: true,
            uniqueness: true
  validates :fname, presence: true
  validates :lname, presence: true
  validates :gender, presence:true
  validates :email, presence:true,
                  format: {with: REGEX_EMAIL_PATTERN}
  validates :address, presence:true
  validates :birthdate, presence: true

  
end

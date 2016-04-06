class Profile < ActiveRecord::Base
  self.primary_key='user_username'
  #mutators
  def fname=(fname)
    self[:fname]=fname.capitalize
  end

  def lname=(lname)
    self[:lname]=lname.capitalize
  end

  def address=(address)
    self[:address]=address.capitalize
  end
  belongs_to :user, class_name: 'User',foreign_key: :user_username, primary_key: 'username', dependent: :destroy
  REGEX_EMAIL_PATTERN=/([a-z0-9_]|[a-z0-9_]+\.[a-z0-9_]+)@(([a-z0-9]|[a-z0-9]+\.[a-z0-9]+)+\.([a-z]{2,4}))/i

#validate form
  validates :fname, presence: true
  validates :lname, presence: true
  validates :gender, presence:true
  validates :email, presence:true,uniqueness:true,
                  format: {with: REGEX_EMAIL_PATTERN}
  validates :address, presence:true
  validates :birthdate, presence: true

end

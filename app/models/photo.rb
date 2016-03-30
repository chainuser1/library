class Photo < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader #Tells rails to use this uploader for this model
  belongs_to :user,foreign_key: :user_username, primary_key: 'username', dependent: :destroy
  validates :name, presence: true
  validates :attachment, presence: true
end

class Cart < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_username, :primary_key => 'username', dependent: :destroy
  belongs_to :book, foreign_key: :book_isbn, :primary_key => 'isbn', dependent: :destroy
end

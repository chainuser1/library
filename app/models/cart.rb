class Cart < ActiveRecord::Base
  self.primary_key='id'
  belongs_to :user, foreign_key: :user_username, :primary_key => 'username'
  belongs_to :book, foreign_key: :book_isbn, :primary_key => 'isbn'
end

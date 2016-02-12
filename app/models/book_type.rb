class BookType < ActiveRecord::Base
  validates :category, presence: true
end

class Book < ActiveRecord::Base
  self.primary_key=:isbn
  def to_param
    isbn
  end
  ISBN_REGEX_CHECKER=/(ISBN[-]*(1[03])*[ ]*(: ){0,1})*(([0-9Xx][- ]*){13}|([0-9Xx][- ]*){10})/
  AUTHOR_REGEX=/\A[A-z][A-z|\.|\s]+\z/
  validates :isbn, presence: true,
                   format: {with: ISBN_REGEX_CHECKER, message: ' is not a valid.'},
                   uniqueness: true
  validates :title, presence: true

  validates :category, presence: true
  validates :publisher, presence: true
  validates :copyright, presence: true
  validates :description, presence: true,
                         length: {minimum: 100, maximum: 2500}

  belongs_to :author, dependent: :destroy
  has_many :carts, foreign_key: :book_isbn, primary_key: :isbn
  has_many :users, through: :carts, foreign_key: :book_isbn, primary_key: :isbn
end

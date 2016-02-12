class Book < ActiveRecord::Base
  ISBN_REGEX_CHECKER=/(ISBN[-]*(1[03])*[ ]*(: ){0,1})*(([0-9Xx][- ]*){13}|([0-9Xx][- ]*){10})/
  AUTHOR_REGEX=/\A[A-z][A-z|\.|\s]+\z/
  validates :isbn, presence: true,
                   format: {with: ISBN_REGEX_CHECKER, message: ' is not a valid.'},
                   uniqueness: true
  validates :title, presence: true
  validates :author, presence:true,
                     format: {with: AUTHOR_REGEX, message: ' is not a valid.'}
  validates :category, presence: true
  validates :publisher, presence: true
  validates :copyright, presence: true
  validates :description, presence: true,
                         length: {minimum: 200, maximum: 1000}
end

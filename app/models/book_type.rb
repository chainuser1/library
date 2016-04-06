class BookType < ActiveRecord::Base
  def category=(category)#mutator
    self[:category]=category.capitalize
  end

  validates :category, presence: true,
                     uniqueness: true

end

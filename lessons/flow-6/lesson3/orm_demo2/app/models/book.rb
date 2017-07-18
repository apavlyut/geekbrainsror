class Book < ApplicationRecord
  belongs_to :author # books.author_id
  has_many :reviews

  validates :title, presence: true
  validates :isbn, uniqueness: true

  before_save :capitalize_title
  after_save :capitalize_author

  include Commentable
  
  def capitalize_title
    self.title = title.mb_chars.capitalize
  end

  def capitalize_author
    author.update name: author.name.mb_chars.capitalize
  end
end

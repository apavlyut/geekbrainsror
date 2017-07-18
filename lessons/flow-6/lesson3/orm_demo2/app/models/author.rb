class Author < ApplicationRecord
  has_many :books
  
  include Commentable
end

class Post < ApplicationRecord
  enum state: [:draft, :published]
end

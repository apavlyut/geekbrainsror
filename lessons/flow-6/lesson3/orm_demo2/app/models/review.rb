class Review < ApplicationRecord
  belongs_to :book
  validates :message, presence: true
  include Commentable
end

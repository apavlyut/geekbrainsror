class Link < ApplicationRecord
  validates :name, :url, presence: true
end

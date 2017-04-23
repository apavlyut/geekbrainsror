class SuperLink < ApplicationRecord
  validates :name, :url, presence: true
end

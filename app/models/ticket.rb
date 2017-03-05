class Ticket < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  enum status: [:opened, :closed, :rejected]
end

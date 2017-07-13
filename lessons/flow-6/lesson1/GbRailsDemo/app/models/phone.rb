require 'phone_fix'
class Phone < ApplicationRecord
  validates :vendor, presence: true
  validates :model, presence: true, uniqueness: true

  include PhoneFix
end

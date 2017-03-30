class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_many :guests
  belongs_to :user, optional: true
end

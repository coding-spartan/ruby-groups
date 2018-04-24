class Group < ApplicationRecord
  belongs_to :user
  has_many :users
  has_many :joins, dependent: :destroy
  has_many :users_joined, through: :joins, source: :user 
end

class Category < ApplicationRecord
  has_many :transactions
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :user
end

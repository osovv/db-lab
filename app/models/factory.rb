class Factory < ApplicationRecord
  validates_presence_of :name
  has_many :departments
  has_many :products
end

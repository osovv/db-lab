class Factory < ApplicationRecord
  validates_presence_of :name
  has_many :departments, dependent: :delete_all
  has_many :products, dependent: :delete_all
end

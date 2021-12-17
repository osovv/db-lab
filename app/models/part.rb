class Part < ApplicationRecord
  belongs_to :product
  belongs_to :vendor
  validates_presence_of :name
end

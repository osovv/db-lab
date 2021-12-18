class Vendor < ApplicationRecord
  validates_presence_of :name
  has_many :parts, dependent: :delete_all
end

class Department < ApplicationRecord
  belongs_to :factory
  validates_presence_of :chief_name
  has_many :products
end

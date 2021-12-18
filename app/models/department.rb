class Department < ApplicationRecord
  belongs_to :factory
  validates_presence_of :chief_name
  has_many :products, dependent: :delete_all
end

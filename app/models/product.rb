class Product < ApplicationRecord
  belongs_to :factory
  belongs_to :department
  belongs_to :technology
  validates_presence_of :name
  has_many :parts, dependent: :delete_all
end

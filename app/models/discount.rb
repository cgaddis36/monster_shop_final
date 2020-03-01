class Discount < ApplicationRecord
  belongs_to :item

  validates_presence_of :name

  validates_numericality_of :desired_quantity, greater_than: 0
  validates_numericality_of :percentage, greater_than: 0, less_than: 100
end

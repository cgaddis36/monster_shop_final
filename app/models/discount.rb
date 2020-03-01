class Discount < ApplicationRecord
  belongs_to :item

  validates_presence_of :name,
                        :desired_quantity,
                        :percentage
end

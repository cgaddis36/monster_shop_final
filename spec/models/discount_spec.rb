require 'rails_helper'

RSpec.describe Discount do
  describe 'Relationships' do
    it {should belong_to :merchant}
  end

  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_numericality_of(:desired_quantity).is_greater_than(0)}
    it {should validate_numericality_of(:percentage).is_greater_than(0).is_less_than(100)}
  end
end

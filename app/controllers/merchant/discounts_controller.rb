class Merchant::DiscountsController < Merchant::BaseController
  def index
    @discount = Discount.new
  end
end

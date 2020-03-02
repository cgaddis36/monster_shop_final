class Merchant::DiscountsController < Merchant::BaseController
  def index
    merchant = Merchant.find(current_user.merchant_id)
    @discounts = merchant.discounts
  end

  def create
    merchant = Merchant.find(current_user.merchant_id)
    discount =  merchant.discounts.new(discount_params)
    if discount.save
      redirect_to '/merchant/discounts'
    else
      flash[:error] = discount.errors.full_messages.to_sentence
      redirect_to '/merchant/discounts'
    end
  end

  private

    def discount_params
      params.permit(:name, :desired_quantity, :percentage)
    end
end

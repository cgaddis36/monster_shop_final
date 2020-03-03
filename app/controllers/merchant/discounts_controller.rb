class Merchant::DiscountsController < Merchant::BaseController
  def index
    merchant = Merchant.find(current_user.merchant_id)
    @discounts = merchant.discounts
  end

  def create
    create_discount
  end

  def edit
    merchant = Merchant.find(current_user.merchant_id)
    @discount = merchant.discounts.find(params[:discount_id])
  end

  def update
    update_discount
  end

  def destroy
    delete_discount
  end

  private

    def discount_params
      params.permit(:name, :desired_quantity, :percentage)
    end

    def create_discount
      merchant = Merchant.find(current_user.merchant_id)
      discount =  merchant.discounts.new(discount_params)
      if discount.save
        redirect_to '/merchant/discounts'
      else
        flash[:error] = discount.errors.full_messages.to_sentence
        redirect_to '/merchant/discounts'
      end
    end
    
    def update_discount
      merchant = Merchant.find(current_user.merchant_id)
      discount = merchant.discounts.find(params[:discount_id])
      discount.update(discount_params)
      if discount.save
        flash[:notice] = "Discount successfully updated"
        redirect_to '/merchant/discounts'
      else
        flash[:error] = discount.errors.full_messages.to_sentence
        redirect_to "/merchant/discounts/#{discount.id}/edit"
      end
    end

    def delete_discount
      Discount.find(params[:discount_id]).delete
      redirect_to '/merchant/discounts'
    end
end

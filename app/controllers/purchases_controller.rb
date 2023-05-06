class PurchasesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @purchases = Purchase.all
  end

  def show
    @purchase = Purchase.find(@purchases.orders.users == current_user)
  end

  def new
    # purchase is nested into products
    @product = Product.find(params[:id])
    # orders are not nested into products
    @order = Order.find(params[:order_id])
  end

  def create
    @user = current_user
    @product = Product.find(params[:product_id])
    order = Order.create!(total_price: @product.price, state: 'pending', user: current_user)
    @purchase = Purchase.create!(product: @product, order: order)
    redirect_to new_order_payment_path(@purchase.order)
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    # need to update and cancel from the payment/new page (just the view, not the product itself)
    @product = @purchase.product
    @product.availability = true
    @product.save!
    @purchase.destroy

    # need to refresh the page
    respond_to do |format|
      format.html { redirect_to new_order_payment_path(Order.find(params[:order_id])), notice: 'Product was successfully removed from your Shopping Cart.' }
      format.json { head :no_content }
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(:order_id, :product_id)
  end
end

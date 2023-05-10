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

  # def create
  #   @user = current_user
  #   @product = Product.find(params[:product_id])
  #   order = Order.create!(total_price: @product.price, state: 'pending', user: current_user)
  #   @purchase = Purchase.create!(product: @product, order: order)
  #   redirect_to new_order_payment_path(@purchase.order)
  # end

  def create
    @user = current_user
    # for every purchase, check if the user has a pending order
    if current_user&.orders&.last&.state == "pending"
      # create a purchase, new session Stripe, update order with a new session

      @purchase = Purchase.new
      @purchase.order = current_user.orders.where(state: "pending").last
      @purchase.product = Product.find(params[:product_id])
      @purchase.save!
      @product = Product.find(params[:product_id])
      @product.availability = false
      @product.save!
      line_items = []
      current_user.orders.where(state: "pending").last.products.each do |product|
        line_items << {
          price_data: {
            currency: 'eur',
            product_data: {
              name: product.description,
            },
            unit_amount: product.price,
          },
          quantity: 1,
        }
      end

      total = 0
      @purchase.order.purchases.each do |purchase|
        total += purchase.product.price
      end

      # session = Stripe::Checkout::Session.create(
      #   payment_method_types: ['card'],
      #   line_items: [{
      #     price_data: {
      #       currency: 'eur',
      #       product_data: {
      #         name: @purchase.product.description,
      #       },
      #       unit_amount: total,
      #     },
      #     quantity: 1,
      #   }],
      #   mode: 'payment',
      #   success_url: order_url(@purchase.order),
      #   cancel_url: order_url(@purchase.order)
      # )

      # @purchase.order.update(checkout_session_id: session.id, amount_cents: total)
      # redirect_to new_order_payment_path(@purchase.order)
      respond_to do |format|
        format.html { redirect_to new_order_payment_path(@purchase.order) }
        format.json { head :no_content }
      end
      flash[:notice] = "Product succesfully added"

     else
      # create an order, create the associated purchase and session stripe for the order
      # change order with checkout_id
      @product = Product.find(params[:product_id])
      order  = Order.create!(total_price: @product.price, state: 'pending', user: current_user)
      @purchase = Purchase.create!(product: @product, order: order)

      # redirect_to new_order_payment_path(@purchase.order)
      respond_to do |format|
        format.html { redirect_to new_order_payment_path(@purchase.order) }
        format.json { head :no_content }
      end
    end
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

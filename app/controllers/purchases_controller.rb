class PurchasesController < ApplicationController
  # skip_before_action :verify_authenticity_token

  # Lists all purchases (an order can have one or more purchases)
  def index
    @purchases = Purchase.all
  end

  # Displays the current user's purchases
  def show
    @purchase = Purchase.find(@purchases.orders.users == current_user)
  end

  # Creates a new purchase, that is made by a product and belongs to an order
  def new
    @product = Product.find(params[:id])
    @order = Order.find(params[:order_id])
  end

  def create
    @user = current_user
    # For every purchase, check if the user has a pending order
    if current_user&.orders&.last&.state == "pending"
      # Every user can buy maximum 2 boxes in every order
      if @current_user&.orders&.last&.products.size < 2
        # Create and save the purchase
        @purchase = Purchase.new
        @purchase.order = current_user.orders.where(state: "pending").last
        @purchase.product = Product.find(params[:product_id])
        @purchase.save!

        # Update the status of purchased products (not available anymore)
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

        # Compute totals
        total = 0
        @purchase.order.purchases.each do |purchase|
          total += purchase.product.price
        end

        # In case of need, Stripe is already integrated
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

        flash[:notice] = "Box aggiunta al carrello"
      else
        flash[:notice] = "Puoi ordinare al massimo 2 box"
      end

     else
      # If there's no pending order, create it and the associated purchase
      @product = Product.find(params[:product_id])
      order = Order.create!(total_price: @product.price, state: 'pending', user: current_user)
      @purchase = Purchase.create!(product: @product, order: order)
      @purchase.save!
      @product.availability = false
      @product.save!

      # Redirect_to new_order_payment_path(@purchase.order)
      respond_to do |format|
        format.html { redirect_to new_order_payment_path(@purchase.order) }
        format.json { head :no_content }
      end
    end
  end

  # Deletes an item from the basket and changes its availability status
  def destroy
    @purchase = Purchase.find(params[:id])
    @product = @purchase.product
    @product.availability = true
    @product.save!
    @purchase.destroy

    # Need to refresh the page
    respond_to do |format|
      format.html { redirect_to new_order_payment_path(Order.find(params[:order_id])), notice: 'The product was successfully removed from your basket.' }
      format.json { head :no_content }
    end
  end

  private
  # Allows to choose which attributes should be permitted for mass updating
  # and thus prevent accidentally exposing those ones that should be protected
  # in this case 'order_id' and 'product_id'
  def purchase_params
    params.require(:purchase).permit(:order_id, :product_id)
  end
end

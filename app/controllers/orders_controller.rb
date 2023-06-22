class OrdersController < ApplicationController
  # Lists all orders placed by the current user
  def index
    @user = current_user
    @orders = @user.orders
  end

  # Shows a specific instance of order place by the current user
  def show
    @user = current_user
    @order = current_user.orders.find(params[:id])

    # Adds a new QR code for the instance of order
    @qr_code = RQRCode::QRCode.new(@order.qr_code.to_s)
    @svg = @qr_code.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      standalone: true,
      module_size: 6
    )

    # Every order is made by one or more purchases
    # Here totals for the single order are computed
    @order.total_price = 0
    @order.total_co2e = 0
    @allpurchases = @order.purchases
    @allpurchases.each do |purchase|
      @order.total_price += purchase.product.price
      @order.total_co2e += purchase.product.co2e
    end

    # Once an order has been placed, it changes the status
    # from 'pending' into 'done' and it's saved
    @order.state = "done"
    @order.save
  end

  # Creates a new order for a specific purchase
  def new
    @user = current_user
    @order = Order.new
    @purchase = Purchase.find(params[:purchase_id])
  end

  # Once the order has been created, it's saved
  # and the page reirected is the "thank you" page
  # http://localhost:3000/orders/id
  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to order_path(@order)
  end

  # Allows to select a specific order and update it
  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to order_path(@order)
  end

  private
  # Allows to choose which attributes should be permitted for mass updating
  # and thus prevent accidentally exposing those ones that should be protected
  # in this case 'user_id' and 'qr_code'
  def purchase_params
    params.require(:order).permit(:user_id, :qr_code)
  end
end

class OrdersController < ApplicationController
  def index
    @user = current_user
    @orders = @user.orders
  end

  def show
    @user = current_user
    @order = current_user.orders.find(params[:id])

    @qr_code = RQRCode::QRCode.new(@order.qr_code.to_s)
    @svg = @qr_code.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      standalone: true,
      module_size: 6
    )

    @order.total_price = 0
    @order.total_co2e = 0
    @allpurchases = @order.purchases
    @allpurchases.each do |purchase|
      @order.total_price += purchase.product.price
      @order.total_co2e += purchase.product.co2e
    end

    @order.state = "done"
    @order.save
  end

  def new
    @user = current_user
    @order = Order.new
    @purchase = Purchase.find(params[:purchase_id])
  end

  def create
    @order = Order.new(list_params)
    @order.save
    redirect_to order_path(@order)
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to order_path(@order)
  end

  private

  def purchase_params
    params.require(:purchase).permit(:user_id, :qr_code)
  end
end

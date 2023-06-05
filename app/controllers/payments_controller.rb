class PaymentsController < ApplicationController
  # Creates an istance of order if the basket's empty
  # selects the order still pending if there are items in the basket
  def new
    if current_user.orders.where(state: 'pending').empty?
      @order = Order.create(user: current_user)
    else
      @order = current_user.orders.where(state: 'pending').find(params[:order_id])
    end
  end
end

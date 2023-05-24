class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def product_params
    params.require(:chatroom).permit(:name, :user_id)
  end
end

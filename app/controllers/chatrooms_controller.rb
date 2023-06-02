class ChatroomsController < ApplicationController

  def index
    @users = User.all_except(current_user)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def product_params
    params.require(:chatroom).permit(:name, :user_id)
  end
end

class ChatroomsController < ApplicationController
  # Lists all existing users except the current user
  # and it's dynamically updated when new users sign up
  def index
    @users = User.all_except(current_user)
  end

  # Instantiates messages in a specific chatroom
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    # Create a new chatroom based on the permitted parameters
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      # Handle successful chatroom creation
      redirect_to @chatroom, notice: 'Chatroom created successfully.'
    else
      # Handle failed chatroom creation
      render :new
    end
  end

  private
  # Allows to choose which attributes should be permitted for mass updating
  # and thus prevent accidentally exposing those ones that should be protected
  # in this case 'name' and 'user_id'
  def chatroom_params
    params.require(:chatroom).permit(:name, :user_id)
  end
end

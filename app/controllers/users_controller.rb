class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all_except(current_user)

    @chatroom = Chatroom.new
    @chatroom_name = get_name(@user, current_user)
    @single_room = Chatroom.where(name: @chatroom_name).first || Chatroom.create_private_room([@user, current_user], @chatroom_name)

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)
  end

  private

  def get_name(user1, user2)
    user = [user1, user2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end

end

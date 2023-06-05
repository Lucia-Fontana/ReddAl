class MessagesController < ApplicationController
  # Enables the message creation in a specific chatroom
  # for the current user
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    @message.save
    ChatroomChannel.broadcast_to(
      @chatroom,
      render_to_string(partial: "message", locals: {message: @message})
    )
    head :ok
  end

  private
  # Allows to choose which attributes should be permitted for mass updating
  # and thus prevent accidentally exposing those ones that should be protected
  # in this case 'content'
  def message_params
    params.require(:message).permit(:content)
  end
end

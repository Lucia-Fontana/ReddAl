# Class used to manage messages within direct chatrooms
# every message is created by a user within a specific chatroom

class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  # before_create :confirm_participant

  # def confirm_participant
  #   return unless chatroom.is_private
  #     is_participant = Participant.where(user_id: user.id, chatroom_id: chatroom.id).first
  #     throw :abort unless is_participant
  # end

  def sender?(a_user)
    # user.id == a_user.id
    user == a_user
  end

end

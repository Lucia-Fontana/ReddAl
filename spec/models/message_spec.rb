require 'rails_helper'

  # def confirm_participant
  #   return unless chatroom.is_private
  #     is_participant = Participant.where(user_id: user.id, chatroom_id: chatroom.id).first
  #     throw :abort unless is_participant
  # end

  # def sender?(a_user)
  #   user.id == a_user.id
  # end

  RSpec.describe Message, type: :model do
    it { should belong_to(:chatroom) }
    it { should belong_to(:user) }

  end
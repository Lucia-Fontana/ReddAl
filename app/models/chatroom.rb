# Class used to create direct Chatrooms between two users
# every chatroom has two participants and is linked to several messages
# the method broadcast_if_public is available for creating group-chats

class Chatroom < ApplicationRecord
  # scope :public_rooms, -> { where(is_private: false) }
  # after_create_commit { broadcast_if_public }
  has_many :messages
  has_many :participants, dependent: :destroy

  # def broadcast_if_public
  #   broadcast_append_to "rooms" unless self.is_private
  # end

  def self.create_private_room(users, chatroom_name)
    single_room = Chatroom.create(name: chatroom_name, is_private: true)
    users.each do |user|
      Participant.create(user_id: user.id, chatroom_id: single_room.id)
    end
    single_room
  end

end

require 'rails_helper'

RSpec.describe Chatroom, type: :model do
  it { should have_many(:messages) }
  it { should have_many(:participants).dependent(:destroy) }

  it 'creates a private room' do
    room = Chatroom.create(
      name: 'Room1',
      is_private: true
    )
    user1 = Participant.create(user_id: 1, chatroom_id: room.id)
    user2 = Participant.create(user_id: 2, chatroom_id: room.id)
    expect(Chatroom.create_private_room([user1, user2], room)).to be_valid
  end
end

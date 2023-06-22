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

    describe 'instance methods' do
      let(:user) { User.create(email: 'john@example.com') }
      let(:message) { Message.new(user: user) }

      describe '#sender?' do
        it 'returns true if the user is the sender' do
          expect(message.sender?(user)).to be true
        end

        it 'returns false if the user is not the sender' do
          another_user = User.create(email: 'jane@example.com')
          expect(message.sender?(another_user)).to be false
        end
      end
    end

  end

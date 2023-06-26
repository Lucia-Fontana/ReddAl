# Class used to identify the user that accesses a direct chatroom
# A participant is a user and accesses a chatroom

class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
end

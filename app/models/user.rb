# Class used to identify and manage users
# Every user can be either a business (Attività) or an end-user (Utente)
# it must have an email and if 'Utente' can chat, place oders or insert reviews

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true
  has_many :orders
  has_many :purchases, through: :orders
  has_one :business
  has_many :chatrooms
  has_many :reviews
  has_many :bots
  scope :all_except, ->(user) { where.not(id: user) }
  # acts_as_favoritor
end

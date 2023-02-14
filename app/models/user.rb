class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :alarms
  
  #friend_requests
  has_many :sent_friend_requests, class_name: 'FriendRequest', foreign_key: 'requestor_id'
  has_many :received_friend_requests, class_name: 'FriendRequest', foreign_key: 'acceptor_id'
  
  #friends
  has_many :confirmed_friends, class_name: 'Friend', foreign_key: 'acceptor_id'
  has_many :relationship_to_friends, class_name: 'Friend', foreign_key: 'requestor_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end

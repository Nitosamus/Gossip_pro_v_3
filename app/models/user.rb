class User < ApplicationRecord
	has_secure_password
	validates :password, presence: {message: "Faut remplir le maot ce champ"}, length: {minimum: 6}
	belongs_to :city, optional: true
	has_many :gossips
	has_many :comments
	has_many :likes
	has_many :sent_messages, foreign_key: "sender_id", class_name: "PrivateMessage"
	has_many :received_messages, foreign_key: "recipient_id", class_name: "PrivateMessage"
end

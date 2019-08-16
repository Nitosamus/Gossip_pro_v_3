class Gossip < ApplicationRecord
	validates :title, presence: {message: "you need to complete this field/the title must be at least 3 characters longue"},	length: {in: 3..14}
	validates :content, presence: {message: "Error : you need to complete this field"}
	has_many :tags, through: :types
	has_many :comments
	has_many :likes
	belongs_to :user
end

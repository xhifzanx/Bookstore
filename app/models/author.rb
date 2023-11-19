class Author < ApplicationRecord
	has_many :books
	validates :first_name, presence: true
	validates :last_name, presence: true
	has_one_attached :images
end

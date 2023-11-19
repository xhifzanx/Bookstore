class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  belongs_to :category
  belongs_to :user
  has_one_attached :images
end

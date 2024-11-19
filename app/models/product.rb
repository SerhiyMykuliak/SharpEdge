class Product < ApplicationRecord
  has_one_attached :image
  has_many :reviews
  has_many :orderables
  has_many :carts, through: :orderables
end

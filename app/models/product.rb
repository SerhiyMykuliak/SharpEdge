class Product < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :orderables, dependent: :destroy
  has_many :carts, through: :orderables
  has_rich_text :content
end

class Product < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :orderables, dependent: :destroy
  has_many :carts, through: :orderables
  has_many :order_items
  has_many :orders, through: :order_items
  
  has_rich_text :content

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true

  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :stock_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :blade_length, numericality: { greater_than: 0 }, allow_nil: true
  validates :blade_thickness, numericality: { greater_than: 0 }, allow_nil: true
  validates :handle_length, numericality: { greater_than: 0 }, allow_nil: true
  validates :weight, numericality: { greater_than: 0 }, allow_nil: true

  validates :blade_material, presence: true
  validates :handle_material, presence: true
  validates :knife_type, presence: true
  validates :brand, presence: true

  validates :image, presence: true 
  validates :content, presence: true 

  def self.ransackable_attributes(auth_object = nil)
    ["name", "price"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["carts", "image_attachment", "image_blob", "order_items", "orderables", "orders", "reviews", "rich_text_content"]
  end
  
end

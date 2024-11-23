class Order < ApplicationRecord
  has_many :orderables
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  accepts_nested_attributes_for :orderables

  DELIVERY_METHODS = ["NovaPoshta", "UkrPoshta", "Courier"].freeze
  PAYMENT_METHODS = ["Cash on Delivery", "Bank card"].freeze

  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :phone, presence: true, length: { minimum: 10, maximum: 15 }, numericality: { only_integer: true }
  validates :address, presence: true, length: { maximum: 255 }
  validates :total, presence: true, numericality: { greater_than: 0 }
  validates :delivery_method, presence: true, inclusion: { in: DELIVERY_METHODS, message: "%{value} is not a valid delivery method" }
  validates :payment_method, presence: true, inclusion: { in: PAYMENT_METHODS, message: "%{value} is not a valid payment method" }

end

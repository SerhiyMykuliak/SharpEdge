class Order < ApplicationRecord
  has_many :orderables, dependent: :destroy
  accepts_nested_attributes_for :orderables

  DELIVERY_METHODS = ["NovaPoshta", "UkrPoshta", "Courier"].freeze
  PAYMENT_METHODS = ["Cash on Delivery", "Bank card"].freeze


end

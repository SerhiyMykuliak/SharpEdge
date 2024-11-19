class Cart < ApplicationRecord
  has_many :orderables
  has_many :products, through: :orderables

  def total
    orderables.to_a.sum{ |orderables| orderables.total }
  end
end

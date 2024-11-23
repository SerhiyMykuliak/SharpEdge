class Cart < ApplicationRecord
  has_many :orderables
  has_many :products, through: :orderables
  belongs_to :user, optional: true

  def total
    orderables.to_a.sum{ |orderables| orderables.total }
  end
end

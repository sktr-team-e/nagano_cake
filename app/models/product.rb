class Product < ApplicationRecord
  attachment :image

  belongs_to :category

  has_many :orders
  has_many :order_products, through: :orders

  has_many :cart_products

end

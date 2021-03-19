class Product < ApplicationRecord
  attachment :image

  belongs_to :category

  has_many :orders
  has_many :order_products, through: :orders

  # cart_product カート内商品のアソシエーションを追加する

end

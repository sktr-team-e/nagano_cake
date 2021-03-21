class Product < ApplicationRecord
  attachment :image

<<<<<<< HEAD
  belongs_to :category, optional: true #(ジャンル作ったら削除optional)
=======
  belongs_to :category, optional: true
>>>>>>> 843614490c52d77cded644af8e3846bd7fd3d7f5

  has_many :orders
  has_many :order_products, through: :orders

  has_many :cart_products

end

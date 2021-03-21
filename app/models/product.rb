class Product < ApplicationRecord
  attachment :image

<<<<<<< HEAD
  belongs_to :category, optional: true #(ジャンル作ったら削除optional)
=======
  belongs_to :category, optional: true
>>>>>>> 51cc295fb7b7bd03ce9f4998a70d7d0aecc90c53

  has_many :orders
  has_many :order_products, through: :orders

  has_many :cart_products

end

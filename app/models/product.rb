class Product < ApplicationRecord
  attachment :image
  
  belongs_to :category
  
  # order_product 注文商品のアソシエーション追加する
  
  # cart_product カート内商品のアソシエーションを追加する
  
end

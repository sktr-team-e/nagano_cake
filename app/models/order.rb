class Order < ApplicationRecord
  
  belongs_to :customer
  
  # order_products とのアソシエーションを追加する
  
  
end

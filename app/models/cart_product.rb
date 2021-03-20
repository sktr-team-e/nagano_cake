class CartProduct < ApplicationRecord
<<<<<<< HEAD
  belongs_to :product
	belongs_to :customer

	validates :customer_id, :product_id, :amount, presence: true
	validates :amount, numericality: { only_integer: true }
=======

  belongs_to :customer

  belongs_to :products

>>>>>>> d634eb1b4124ce99e1a131f49f820db7cda5e250
end

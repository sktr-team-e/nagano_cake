class AddDetailsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :customer_id, :integer
    add_column :orders, :postcode, :string
    add_column :orders, :address, :string
    add_column :orders, :name, :string
    add_column :orders, :total_price, :integer
    add_column :orders, :shipping_cost, :integer
    add_column :orders, :payment_method, :integer
    add_column :orders, :status, :integer
  end
end

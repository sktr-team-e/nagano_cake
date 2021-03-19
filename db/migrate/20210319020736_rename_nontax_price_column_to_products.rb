class RenameNontaxPriceColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :nontax_price, :nontaxed_price
  end
end

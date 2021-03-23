class Address < ApplicationRecord

  belongs_to :customer

  # order/newで使用　インスタンスメソッド
  def concat_address_info
    # self = 呼び出しもと(receiver)
    self.postcode + self.address + self.name
  end
end

class Customers::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
    @customer = current_customer
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to customers_addresses_path
  end

  def destroy
  end

  def edit
  end

  def update
  end

private
  def address_params
    params.require(:address).permit(:name, :postcode, :address, :customer_id)
  end

end

class Customers::CustomersController < ApplicationController
  def show
   @customer = Customer.find(current_customer.id)
  end

  def quit
  end

  def out
  end

  def edit
  end

  def update
  end
end

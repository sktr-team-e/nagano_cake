class Customers::ProductsController < ApplicationController
  def top
    @products = Product.all
  end

  def about
  end

  def index
  end

  def show
  end
end

class CartsController < ApplicationController
  def index
  	@cart = cart_from_session
  end

  def clear_cart
  	session[:cart_items] = nil
  end
  
  private

  def cart_from_session
  	Cart.new(session[:cart_items])
  end

end
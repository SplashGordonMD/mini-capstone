class CartedProductsController < ApplicationController
  def create 
    cart = Cart.new(
      cart.quantity = params["quantity"],
      cart.user_id = current_user.id,
      cart.product_id = Product.find_by(id:order.product_id)
      )
  end
  def index
    
    index
  end

end
class CartedProductsController < ApplicationController
  def create 
    cart = CartedProduct.new(
      quantity: params["quantity"],
      user_id: current_user.id,
      product_id: params["product_id"],
      status: "carted"
      )
    cart.save
    flash[:sucess] = "Added to Cart"
    redirect_to '/lemonaids'
  end
  
  def index
    index
  end

end
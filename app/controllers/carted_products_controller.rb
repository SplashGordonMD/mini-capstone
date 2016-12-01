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
    # @carted_products = CartedProduct.all
    @carted_products = current_user.carted_products.where(status: "carted")
    render "index.html.erb"
  end

end
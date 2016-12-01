class CartedProductsController < ApplicationController
  def create 
    cart = CartedProduct.new(
      quantity: params["quantity"],   #belongs_to :user
      user_id: current_user.id,         #belongs_to :product
      product_id: params["product_id"],   #belongs_to :order
      status: "carted"
      )
    cart.save
    flash[:sucess] = "Added to Cart"
    redirect_to '/lemonaids'
  end
  
  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    render "index.html.erb"
  end

end
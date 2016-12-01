class CartedProductsController < ApplicationController
  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    if @carted_products.lenght > 0
      render "index.html.erb"
    else
      flash[:warning] = "You have no items in the cart"
      redirect_to '/'
    end
  end

  def create 
    @carted_prodoct = CartedProduct.new(
      quantity: params[:quantity],   #belongs_to :user
      user_id: current_user.id,         #belongs_to :product
      product_id: params[:product_id],   #belongs_to :order
      status: "carted"
      )
    cart.save
    flash[:sucess] = "Added to Cart"
    redirect_to '/lemonaids'
  end

  def destroy
    carted_product = CrtedProduct.find_by(id: params[:id])
    carted_product.status = "removed"
    carted_product.save
    flash[:sucess] = "Product removed"
    redirect_to '/carted_products'
  end
end


class LemonaidsController < ApplicationController
 
  def index
    if session[:count] == nil
       session[:count] = 0
    end  
    session[:count] +=1
    @visit_count = session[:count]

    only_show_discount = params[:discount] == "true"
    if only_show_discount
      @lemonaids = Lemonaid.where("price < ?", 10)
    else 
      sort_attribute = params[:sort] || "name"
      sort_order = params[:sort_order] || "asc"
      @lemonaids = Lemonaid.order(sort_attribute => sort_order)
    end
    render 'index.html.erb'
  end 

  def new
    unless current_user && current_user.admin
      redirect_to "/"
      return
    end
    @lemonaid = Lemonaid.new
    render 'new.html.erb'
  end

  def create
    @lemonaid = Lemonaid.new(
      name: params[:name], 
      discription: params[:discription], 
      image: params[:image],
      price: params[:price]
    )
    if @lemonaid.save
      redirect_to "/lemonaids/#{@lemonaid.id}"
    else 
      render :new
    end
  end
  
  def show
    lemonaid_id = params[:id]
    @lemonaid = Lemonaid.find_by(id: lemonaid_id)
    render "show.html.erb" 
  end

  def edit
    lemonaid_id = params[:id]
    @lemonaid = Lemonaid.find_by(id: lemonaid_id)
  end

  def update  
    @lemonaid = Lemonaid.find_by(id: params[:id])
    @lemonaid.name=params[:name]
    @lemonaid.discription=params[:discription]
    @lemonaid.image=params[:image]
    @lemonaid.price=params[:price]
    if @lemonaid.save
      flash[:success] = "Product Updated"
      redirect_to "/lemonaids/#{@lemonaid.id}"
    else 
      flash[:warning] = "Product did not update" 
      render "edit.html.erb"
    end
  end
  
  def destroy
    lemonaid_id = params[:id]
    unless current_user && current_user.admin
      redirect_to "/lemonaids"
      return
    end

    @lemonaid = Lemonaid.find_by(id: lemonaid_id)
    @lemonaid.destroy
    flash[:warning] = "Product Destroyed"
    redirect_to "/lemonaids"
  end

  def search
    search_term = params[:search]
    @lemonaids = Lemonaid.where("name LIKE ?", '%' + search_term + '%')
    render 'index.html.erb'
  end

end


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
  #   sort_price = params[:sort_price]
  #   puts "attribute: #{sort_attribute}"
  #   puts "order: #{sort_order}"
        
  #   if sort_attribute && sort_order
  #     @lemonaids = Lemonaid.order("#{sort_attribute} #{sort_order}")
  #   elsif sort_attribute
  #     if sort_price 
  #       # "price = ?", "1.00"
  #       # @lemonaids=Lemonaid.where(sort_attribute <= sort_price)
  #       @lemonaids=Lemonaid.where("#{sort_attribute} <= ?", "#{sort_price}")
  #     else
  #       @lemonaids = Lemonaid.order("#{sort_attribute}")
  #     end
  #   else 
  #     @lemonaids = Lemonaid.all
  #   end

  #   render "index.html.erb"
  # end 

  def new
    if current_user && current_user.admin
      render 'new.html.erb'
    else
      redirect_to "/"
  end

  def create
    @lemonaid=Lemonaid.new(
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
    lemonaid = Lemonaid.find_by(id: params[:id])
    lemonaid.name=params[:name]
    lemonaid.discription=params[:discription]
    lemonaid.price=params[:price]
    lemonaid.save
    redirect_to "/lemonaids/#{lemonaid.id}"
  end

  def destroy
    lemonaid_id = params[:id]
    lemonaid = Lemonaid.find_by(id: lemonaid_id)
    lemonaid.destroy
    redirect_to "/lemonaids"
  end
end
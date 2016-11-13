class LemonaidsController < ApplicationController
  
  def index
    @lemonaid = Lemonaid.all
    render "lemonaid_stand_offerings.html.erb"
  end 

  def new
    render 'new.html.erb'
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
    recipe.save
    render 'update.html.erb'
  end

  def destroy
    lemonaid_id = params[:id]
    lemonaid = Lemonaid.find_by(id: lemonaid_id)
    lemonaid.destroy
    render 'destroy.html.erb'
  end
end

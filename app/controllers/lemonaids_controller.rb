class LemonaidsController < ApplicationController
  def index
    @lemonaid = Lemonaid.all
    render "lemonaid_stand_offerings.html.erb"
  end 

end

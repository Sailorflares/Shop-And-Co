class HomeController < ApplicationController
  def index

  end

  def stocks
  	render json: Stock.all
  end
end

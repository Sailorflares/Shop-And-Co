class StocksController < ApplicationController

  def index
    render json: Stock.all
  end

  def create
    stock = Stock.new(name: params[:name], quantity: params[:quantity], price: params[:price])
    if stock.save
      render json: stock
    else
      render json: "Sorry, something went wrong. Please try again."
    end
  end

end
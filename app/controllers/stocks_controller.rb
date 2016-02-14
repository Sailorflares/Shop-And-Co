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

  def purchase
    params['lineItems'].each do |key, value|
      stock = Stock.find(key)

      newQuantity = stock.quantity - value.to_i
      
      stock.update(quantity: newQuantity)
    end

    #in the real world, you wouldn't return all the stocks with some having new quantities, you might only return the ones that have been updated.
    render json: Stock.all
  end

end
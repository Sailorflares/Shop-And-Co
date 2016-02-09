class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    products = Product.all

    @products_array = products.map do |product|
        productHash = {}
        stock = Stock.where(:product_id => product.id).first

        if stock
          productHash[:price] = stock.price
        else
          productHash[:price] = 0.00          
        end        

        productHash[:name] = product.name
        productHash[:id] = product.id
        productHash
    end
  end

  def add_to_cart
    cart = Cart.new(session[:cart_items])
    binding.pry

    cart.add_item_to_cart(params[:product_name],params[:product_id],params[:stock_price], params[:quantity])

    session[:cart_items] = cart.items
    
    redirect_to cart_path
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :quantity)
    end

    def lineItem_params
      params.require(:lineItem).permit(:productId)
    end

end
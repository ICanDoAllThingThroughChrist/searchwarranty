class CartsController < ApplicationController
  def index
    @carts = Cart.all
    render carts_path
  end
  def new
    @cart = Cart.new
    # binding.pry
    # binding.pry

  end
  def create
    cart_number = carts_params[:cart_number]
    cart_number_i = cart_number.to_i
    a = Array(1...440383)
    b = Array(320458...383845)
      if a.include?(cart_number_i)
        @cart=Cart.new(carts_params)
      elsif b.include?(cart_number_i)
        @cart=Cart.new(carts_params)
      else
        flash[:notice] = "Cart not in warranty"
        carts_path
      end
        flash[:notice] = "Cart not in warranty"
        carts_path
  end

  def show
      @cart = Cart.find(params[:id])
  end

  private
  def carts_params
      params.require(:cart).permit(:id,:cart_number,:number)
  end
end

class CartsController < ApplicationController
  def index
    @carts = Cart.all
    render carts_path
  end
  def new
    @cart = Cart.new
  end
  def create
      #binding.pry
      cart_number = carts_params[:cart_number]
      cart_number_s = cart_number
      cart_number_i = cart_number.to_i
      b = Array(104466...397207)
      c = Array(410440...534479)
      d= Array(1...7021)
      b_1 = b.map{|i| i.to_s}

      array=cart_number.
      gsub(/\s+/m, ' ').
      gsub(/^\s+|\s+$/m, '').
      split(" ")
      # ar=array[1]
      # binding.pry #what is new_array,d?
      if b.include?(cart_number_i)
        WarrantyList.search_for_warranty2(cart_number_i)
            @request= Request.last
            i= carts_params["cart_number"]
            @cart= Cart.new(carts_params)
            # binding.pry
            @cart.save
      elsif c.include?(cart_number_i)
        WarrantyList.search_for_warranty2(cart_number_i)
            @request= Request.last
            i= carts_params["cart_number"]
            @cart= Cart.new(carts_params)
            @cart.save
      elsif d.include?(cart_number_i)
        WarrantyList.search_for_warranty2(cart_number_i)
            @request= Request.last
            i= carts_params["cart_number"]
            @cart= Cart.new(carts_params)
            @cart.save
      else
          flash[:notice] = "Cart not in warranty"
          carts_path
      end
  end
  def show
      @cart = Cart.find(params[:id])
  end

  private
  def carts_params
      params.require(:cart).permit(
        :id,:cart_number,:number,
        :replaced_body,
        :replaced_lid,
        :replaced_wheel,
        :repaired_body,
        :repaired_lid,
        :repaired_wheel,
        :consumption_type,
        :cart_service_location,
      )
  end
end

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
      b = Array(104465...397207)
      c = Array(410440...534479)
      b_1 = b.map{|i| i.to_s}

      array=cart_number.
      gsub(/\s+/m, ' ').
      gsub(/^\s+|\s+$/m, '').
      split(" ")
      ar=array[1]
      e =ar.to_i
      d= []
      d << e
      d.map {|i|
        if i <= 9
           d << "9GH 00000"+i.to_s
           d.shift
           d.save
        elsif i <= 99 && i >= 10
           d << "9GH 0000"+i.to_s
           d.shift
           d.save
        elsif i <= 999  && i >= 100
          # binding.pry
           d << "9GH 000"+i.to_s
           d.shift
           d.save
        elsif i <= 9999 && i >= 1000
          # binding.pry
           d << "9GH 00"+i.to_s
           d.shift
           d.save
        end
        # binding.pry
      }
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
      params.require(:cart).permit(:id,:cart_number,:number,
        :replaced_body,
        :replaced_lid,
        :replaced_wheel,
        :repaired_body,
        :repaired_lid,
        :repaired_wheel,
      )
  end
end

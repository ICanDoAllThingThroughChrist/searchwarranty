class CartsController < ApplicationController
  def index
    @carts = Cart.all
    render carts_path
  end
  def new
    @cart = Cart.new
  end
  def create
      cart_number = carts_params[:cart_number]
      cart_number_s = cart_number
      cart_number_i = cart_number.to_i
      b = Array(104465...534480)
      b_1 = b.map{|i| i.to_s}
      c= b.map{|i|
        if i < 104466
          then "SS0"+i.to_s
        elsif i < 999999
          then "SS0"+i.to_s
        end
      }
      # binding.pry
      array=cart_number.gsub(/\s+/m, ' ').gsub(/^\s+|\s+$/m, '').split(" ")
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
            #binding.pry
            @request= Request.last
            #what is carts_params?
            binding.pry
            i= carts_params["cart_number"]
            j= i.to_i
            if j > 104466 && j < 534480
              j= "SS0"+i.to_s
              carts_params["cart_number"]= j
            end
            binding.pry
            @cart= Cart.new(carts_params)
            # binding.pry
            # @cart=Cart.new(carts_params)
        # elsif c.include?(cart_number_s)
        #     @cart=Cart.new(carts_params)
        # elsif d.include?(cart_number_s)
        #     @cart=Cart.new(carts_params)
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
      params.require(:cart).permit(:id,:cart_number,:number)
  end
end

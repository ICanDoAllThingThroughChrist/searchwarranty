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
      a = Array(227091...383846)
      a_1 = a.map {|i| i.to_s}
      a_2 = a
      b = Array(1...440384)
      b_1 = b.map{|i| i.to_s}
      c= b.map{|i|
        if i < 9
          then "SS000000"+i.to_s
        elsif i < 99
          then  "SS00000"+i.to_s
        elsif i < 999
          then "SS0000"+i.to_s
        elsif i < 9999
          then "SS000"+i.to_s
        elsif i < 99999
          then "SS00"+i.to_s
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
        if a_1.include?(cart_number_s)
          @cart=Cart.new(carts_params)
        elsif a_2.include?(cart_number_i)
          @cart=Cart.new(carts_params)
        elsif c.include?(cart_number_s)
          @cart=Cart.new(carts_params)
        elsif d.include?(cart_number_s)
          @cart=Cart.new(carts_params)
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

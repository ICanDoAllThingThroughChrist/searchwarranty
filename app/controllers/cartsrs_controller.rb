class CartsrsController < ApplicationController
  def index
    @allcartsrs = Cartsr.where(warranty:'1')
    render 'index'
  end

  def new
    @cartsr= Cartsr.new
  end

  def create
    #binding.pry
    # flash[:notice] = "missing a picture attachment"
    case_number = cartsrs_params[:cart_sr_number]
    exit = Sr.search_address(case_number)
    cart_sr_number = cartsrs_params[:cart_sr_number]
    cart_number = cartsrs_params[:cart_number]
    cart_number_s = cart_number
    cart_number_i = cart_number.to_i
    b = Array(104466...397207)
    c = Array(410440...566280)
    d= Array(1...7021)
    b_1 = b.map{|i| i.to_s}
    # binding.pry
    array=cart_number.
    gsub(/\s+/m, ' ').
    gsub(/^\s+|\s+$/m, '').
    split(" ")
    # ar=array[1]
    # binding.pry #what is new_array,d?
    if b.include?(cart_number_i)
      WarrantyList.search_for_warranty2(cart_number_i)
          @request= Request.last
          @cartsr= Cartsr.new(cartsrs_params)
          @address = Address.last
          Cartsr.set_warranty(cartsrs_params)
          @cartsr= Cartsr.last
    elsif c.include?(cart_number_i)
      WarrantyList.search_for_warranty2(cart_number_i)
          @request= Request.last
          @address = Address.last
          Cartsr.set_warranty(cartsrs_params)
          @cartsr= Cartsr.last

    elsif d.include?(cart_number_i)
      WarrantyList.search_for_warranty2(cart_number_i)
          @request= Request.last
          @address= Address.last
          Cartsr.set_warranty(cartsrs_params)
          @cartsr= Cartsr.last
    else
          flash[:notice] = "!!!Please save this page onto your phone via print option!!!"
          @cartsr= Cartsr.new(cartsrs_params)
          @address = Address.last
          @cartsr.save
        carts_path
    end
  end
  def show
      @cartsr= Cartsr.find(params[:id])
      flash[:notice] = "cart image do not exist"
      @allcartsrs = Cartsr.where(warranty:'1')
  end


  private
  def cartsrs_params
    params.require(:cartsr).permit(
      :cart_number,
      :consumption_type,
      :cart_sr_number,
      :repair_replace,
      :part,
      :avatar,
      contracts: []
    )
  end
end
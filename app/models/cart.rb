class Cart < ApplicationRecord

  def self.unique
    carts = []
    carts = Cart.all
    carts.each.map {|cart|
      byebug
      cart.unique = cart.service_location + cart.tax_id1.to_s + " " + cart.client
      cart.cart_serviced
      cart.cart_delivered
      cart.cart_replaced_wheel_lid
      cart.cart_replaced
      cart.save
    }
  end

  def cart_replaced_wheel_lid
      if /replace/.match?(cart.case_note) == TRUE && if /wheel/.match?(cart.case_note) == TRUE ||
      elsif /replace/.match?(cart.case_note) == TRUE && if /lid/.match?(cart.case_note) == TRUE
      then
        cart.replace_wheel_lid = 1
      else
        cart.replace_wheel_lid = 0
      end
  end

  def cart_delivered
    if
      /deliver/.match?(cart.case_note) == TRUE
    then
      cart.delivered = 1
    else
      cart.delivered = 0
    end
  end

  def cart_serviced
      if
        /service/.match?(cart.serviced) == TRUE
      then
        cart.serviced = 1
      else
        cart.serviced = 0
    end
  end

  def cart_replaced
      if
        /replace/.match?(cart.case_note) == TRUE && if /cart/.match?(cart.case_note) == TRUE
      then
        cart.replaced_cart = 1
      else
        cart.replaced_cart = 0
      end
  end

end

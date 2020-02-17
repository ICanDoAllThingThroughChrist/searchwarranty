class Cart < ApplicationRecord
    def self.unique
      carts = []
      carts = Cart.all
      carts.each.map {|cart|
        # binding.pry
        cart.cart_taxid(cart)
        cart.cart_client(cart)
        cart.cart_service_location(cart)
        # binding.pry
        cart.unique = cart.service_location + cart.tax_id.to_s + cart.client
        cart.cart_serviced(cart)
        # binding.pry
        cart.cart_delivered(cart)
        # binding.pry
        cart.cart_replaced_wheel_lid(cart)
        # binding.pry
        cart.cart_replaced(cart)
        # binding.pry
        cart.save
        # binding.pry
      }
    end
    def cart_replaced_wheel_lid(cart)
        if /[r..R]eplace/.match?(cart.case_note) == TRUE && /wheel/.match?(cart.case_note) == TRUE
          cart.replace_wheel_lid = 1
        elsif /[r..R]eplace/.match?(cart.case_note) == TRUE && /lid/.match?(cart.case_note) == TRUE
          cart.replace_wheel_lid = 1
        else
          cart.replace_wheel_lid = 0
        end
    end
    def cart_delivered(cart)
      if /[d..D]eliver/.match?(cart.case_note) == TRUE
        cart.delivered = 1
      else
        cart.delivered = 0
      end
    end
    def cart_serviced(cart)
        # binding.pry
        if /[s..S]ervice/.match?(cart.case_note) == TRUE
          # binding.pry
          cart.serviced = 1
        else
          cart.serviced = 0
        end
    end
    def cart_replaced(cart)
        if /[r..R]eplace/.match?(cart.case_note) == TRUE &&  /[c..C]art/.match?(cart.case_note) == TRUE &&  cart.replace_wheel_lid = 0
          cart.replaced_cart = 1
        elsif /[r..R]eplacement/.match?(cart.case_note) == TRUE
          cart.replaced_cart = 1
        else
          cart.replaced_cart = 0
        end
    end

    def cart_taxid(cart)
      if cart.tax_id.nil? == TRUE
        cart.tax_id = 0
      else
        cart
      end
    end
    def cart_client(cart)
      if cart.client.nil? == TRUE
        # binding.pry
        cart.client = 0
        # binding.pry
      else
        cart
      end
    end
    def cart_service_location(cart)
      if cart.service_location.nil? == TRUE
        # binding.pry
        cart.service_location = 0
        # binding.pry
      else
        cart
      end
    end
end

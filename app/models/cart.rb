class Cart < ApplicationRecord
    def self.carts_compliance_list
      self.unique
      headers = %w[sr_number client service_location status client_str_no
         client_str_name client_zip_code phone_number email_address
          create_date due_date closed_date overdue agent_name
           super_neighborhood tax_id service_area district key_map
            management_district garbage_route garbage_day garbage_quad
             recycle_route recycle_day recycle_quad heavy_trash_day
              heavy_trash_day subject reason service_type queue sla
               container_problem container_damage case_note
                resolution_comment channel_type other_description title
                 x y latitude longitude tax_id1 unique cart_number
                  created_at updated_at delivered  replaced_cart
                   serviced replace_wheel_lid]
      CSV.open("C:/Users/e128289/Documents/carts-data.csv", "wb",
         write_headers: true, headers: headers) {|csv|
           Cart.find_by_sql("SELECT * FROM Carts WHERE replaced_cart = '1' OR delivered = '1' OR replace_wheel_lid = '1' OR serviced = '1'").
           pluck(:sr_number, :client, :service_location, :status,
              :client_str_no, :client_str_name, :client_zip_code,
               :phone_number, :email_address, :create_date, :due_date,
                :closed_date, :overdue, :agent_name, :super_neighborhood,
                 :tax_id, :service_area, :district, :key_map,
                  :management_district, :garbage_route, :garbage_day,
                   :garbage_quad, :recycle_route, :recycle_day,
                    :recycle_quad, :heavy_trash_day, :heavy_trash_day,
                     :subject, :reason, :service_type, :queue, :sla,
                      :container_problem, :container_damage, :case_note,
                       :resolution_comment, :channel_type, :other_description,
                        :title, :x, :y, :latitude, :longitude, :tax_id1,
                         :unique, :cart_number, :created_at, :updated_at,
                          :delivered, :replaced_cart, :serviced,
                           :replace_wheel_lid).each {|row|
                             csv << row }}
    end
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

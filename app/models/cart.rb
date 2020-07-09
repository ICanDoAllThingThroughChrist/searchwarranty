class Cart < ApplicationRecord
  def self.container_problem_not_nil_cases
    local_count= Cart.where.not(container_problem: [nil, " ", 'Unknown'],
      case_note:[nil, " ",'Unknown']).
    where(sr_create_date: [nil, " ", 'Unknown']).count
    local= Cart.where.not(container_problem: [nil, " ", 'Unknown']).
    where(sr_create_date: [nil, " ", 'Unknown'])
    local.each{|i|
      index= "#{i.container_problem}".index(/0[1-9]|1[012]/)
      #binding.pry
      if index != nil
        date_index= "#{i.container_problem}".index(/0[1-9]|1[012]/)
        l= "#{i.container_problem}"
        date_text= l.from(date_index)
        i.sr_create_date= date_text
        i.save
      else
        puts "#{i.container_problem}" + "index is nil"
      end
    }
  end
  def self.case_note_not_nil_cases
    local_count= Cart.where.not(case_note: [nil, " ", 'Unknown']).
    where(sr_create_date: [nil, " ", 'Unknown']).count
    local= Cart.where.not(case_note: [nil, " ", 'Unknown']).
    where(sr_create_date: [nil, " ", 'Unknown'])
    local.each{|i|
      index= "#{i.case_note}".index(/0[1-9]|1[012]/)
      #binding.pry
      if index != nil
        date_index= "#{i.case_note}".index(/0[1-9]|1[012]/)
        l= "#{i.case_note}"
        date_text= l.from(date_index)
        i.sr_create_date= date_text
        i.save
      else
        puts "#{i.case_note}" + "index is nil"
      end
    }
  end
  def self.set_sr_create_date_to_dates
    local=Cart.where(sr_create_date: [nil, " ", 'Unknown'])
    local.each{|i|
      if i.closed_date != nil
        date= DateTime.parse("#{i.closed_date}") - 10
        i.sr_create_date= date
        i.save
      elsif i.due_date != nil
        date= DateTime.parse("#{i.due_date}") - 10
        i.sr_create_date= date
        i.save
      elsif i.create_date != nil
        date= DateTime.parse("#{i.create_date}")
        if date < Date.parse('2020-09-01')
          i.sr_create_date= date - 60
          i.save
        elsif date > Date.parse('2020-09-01') && date < Date.parse('2020-10-01')
          i.sr_create_date= date - 90
          i.save
        elsif date > Date.parse('2020-10-01') && date < Date.parse('2020-11-01')
          i.sr_create_date= date - 120
          i.save
        elsif date > Date.parse('2020-11-01') && date < Date.parse('2020-12-07')
          i.sr_create_date= date - 150
          i.save
        else
          puts "#{i.sr_number}" + "source dates are not between September 2020 and Dec 2020"
        end
      else
        puts "#{i.sr_number}" + "closed date is nil"
      end
      }
  end
  def self.sr_create_date_null_list
    #self.multiple_delivered_list
    headers = %w[sr_number, client, service_location, status,
       client_str_no, client_str_name, client_zip_code,
        phone_number, email_address, create_date, due_date,
         closed_date, overdue, agent_name, super_neighborhood,
          tax_id, service_area, district, key_map,
          management_district, garbage_route, garbage_day,
            garbage_quad, recycle_route, recycle_day,
             recycle_quad, heavy_trash_day, heavy_trash_day,
              subject, reason, service_type, queue, sla,
               container_problem, container_damage, case_note,
                resolution_comment, channel_type, other_description,
                 title, x, y, latitude, longitude, tax_id1,
                  unique, cart_number, created_at, updated_at,
                   delivered, replaced_cart, serviced,
                    replace_wheel_lid]
    CSV.open("C:/Users/e128289/Documents/sr-create-date-null-list.csv", "wb",
       write_headers: true, headers: headers) {|csv|
         Cart.where(sr_create_date: [nil, " ", 'Unknown'],
           due_date: [nil, " ", 'Unknown'],
           closed_date: [nil, " ", 'Unknown']).
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
    def self.add_sr_create_date
      carts= Cart.where(sr_create_date: nil)
      carts.each{|i|
        if i.sr_number != nil
          l= Sr.find_by(case_number: "#{i.sr_number}")
            if l != nil
              i.sr_create_date= "#{l.sr_create_date}"
              i.save
            else
              puts "#{i.sr_number}"
            end
        else
          puts "#{i.sr_number}"
        end
      }
    end
    def self.multiple_delivered_list
      list_of_delivered_cans= Cart.where(delivered:'1')
      unique_list_of_delivered_cans= Cart.where(delivered: '1').distinct.pluck(:unique)
      list_of_delivered_cans.each{|can|
        # binding.pry
        if Cart.where('unique = ?', can['unique'])
          can.tally= 1
          can.save
          # binding.pry
        else
          puts "#{can}"
        end
        }
        # puts "#{duplicate.count}"
        #binding.pry
    end
    def self.carts_compliance_list
      self.unique
      #self.multiple_delivered_list
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
        if /[r..R]eplace/.match?(cart.case_note) == TRUE &&
           /wheel/.match?(cart.case_note) == TRUE
          cart.replace_wheel_lid = 1
        elsif /[r..R]eplace/.match?(cart.case_note) == TRUE &&
           /lid/.match?(cart.case_note) == TRUE
          cart.replace_wheel_lid = 1
        elsif /[r..R]eplace/.match?(cart.resolution_comment) == TRUE &&
             /wheel/.match?(cart.case_note) == TRUE
            cart.replace_wheel_lid = 1
        elsif /[r..R]eplace/.match?(cart.resolution_comment) == TRUE &&
             /lid/.match?(cart.case_note) == TRUE
            cart.replace_wheel_lid = 1
        else
          cart.replace_wheel_lid = 0
        end
    end
    def cart_delivered(cart)
      if /[d..D]eliver/.match?(cart.case_note) == TRUE
        cart.delivered = 1
      elsif /[d..D]eliver/.match?(cart.resolution_comment) == TRUE
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
        elsif /[s..S]ervice/.match?(cart.resolution_comment) == TRUE
            # binding.pry
            cart.serviced = 1
        else
          cart.serviced = 0
        end
    end
    def cart_replaced(cart)
        if /[r..R]eplace/.match?(cart.case_note)  &&
            /[c..C]art/.match?(cart.case_note) &&
          cart.replace_wheel_lid = 0 &&
           cart.replaced_cart = 1
        elsif /[r..R]eplacement/.match?(cart.case_note)
          cart.replaced_cart = 1
        elsif /[r..R]eplace/.match?(cart.resolution_comment)  &&
              /[c..C]art/.match?(cart.resolution_comment) &&
            cart.replace_wheel_lid = 0 &&
             cart.replaced_cart = 1
        elsif /[r..R]eplacement/.match?(cart.resolution_comment)
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
      if cart.service_location.nil?
        # binding.pry
        cart.service_location = 0
        # binding.pry
      else
        cart
      end
    end
end

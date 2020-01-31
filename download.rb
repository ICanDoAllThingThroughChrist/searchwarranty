
    require 'open-uri'
    require 'csvreader'
    require 'byebug'
    require 'csv'
    web2 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2019-clean.txt'){|f| f.read}
    web1 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-monthly-clean.txt'){|f| f.read}
    thing1 = web1.split(/\n/)
    things2 = web2.split(/\n/)
    columns = %i[case_number sr_location county district neighborhood tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day key_map management_district department division sr_type queue sla status sr_create_date due_date date_closed overdue title x y latitude longitude channel_type created_at updated_at]
    class Sr
      attr_accessor :case_number, :sr_location, :county, :district, :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day, :heavy_trash_day, :recycle_day, :key_map, :management_district, :department, :division, :sr_type, :queue, :sla, :status, :sr_create_date, :due_date, :date_closed, :overdue, :title, :x, :y, :latitude, :longitude, :channel_type, :created_at, :updated_at
      def initialize(h)
        h.each {|k,v| instance_variable_set("@#{k}",v)}
      end
    end 

    thing1.each {|sr|
       byebug
       b=sr.split('|')
       c=Hash[columns.zip(b)]
       Sr.new(c)
    }
    things2.each {|sr|
    byebug
    b=sr.split('|')
    c=Hash[columns.zip(b)]
    Sr.new(c)
 }

    # line_array_hash = Hash[line_array.map {|key, value| [key, value]}
    # Sr.new(line_array_hash) 
  #   File.open("users.txt", "r", '\r').each do |line|
  #     id, name, age, email = line.strip.split(',')
  #     u = User.new(:id => id, :name => name, :age => age, :email => email)
  #     u.save
  #   end
  # end"
  #https://github.com/csvreader/csvreader
#   What about tabular data packages with pre-defined types / schemas?
#     See the csvpack library »

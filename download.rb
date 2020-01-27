
    require 'open-uri'
    require 'csvreader'
    require 'pry-byebug'
    require 'csv'
    web2 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2019-clean.txt'){|f| f.read}
    web1 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-monthly-clean.txt'){|f| f.read}
    thing1 = web1.split(/\n/)
    records1 = CsvHash.parse(web1, :converters => :all, :header_converters => :symbol ) #turns web1 from string to hash
    things2 = web2.split(/\n/)
    columns = %i[case_number sr_location county district neighborhood tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day key_map management_district department division sr_type queue sla status sr_create_date due_date date_closed overdue title x y latitude longitude channel_type created_at updated_at]
    class Sr
      def initialize(case_number, sr_location, county, district, neighborhood, tax_id, trash_quad, recycle_quad, trash_day, heavy_trash_day, recycle_day, key_map, management_district, department, division, sr_type, queue, sla, status, sr_create_date, due_date, date_closed, overdue, title, x, y, latitude, longitude, channel_type, created_at, updated_at)
        @case_number=case_number 
        @sr_location=sr_location 
        @county=county 
        @district=district 
        @neighborhood=neighborhood 
        @tax_id=tax_id 
        @trash_quad=trash_quad 
        @recycle_quad=recycle_quad 
        @trash_day=trash_day 
        @heavy_trash_day=heavy_trash_day 
        @recycle_day=recycle_day 
        @key_map=key_map 
        @management_district=management_district 
        @department=department 
        @division=division 
        @sr_type=sr_type 
        @queue=queue 
        @sla=sla 
        @status=status 
        @sr_create_date=sr_create_date 
        @due_date=due_date 
        @date_closed=date_closed 
        @overdue=overdue 
        @title=title 
        @x=x 
        @y=y 
        @latitude=latitude 
        @longitude=longitude 
        @channel_type=channel_type 
        @created_at=created_at 
        @updated_at=updated_at
      end
    end 
    a =[]
    thing1.each {|sr|
      Csv.parse(sr, sep: '|')
    }
  
    line_array_hash = Hash[line_array.map {|key, value| [key, value]}
    Sr.new(line_array_hash) 
  #   File.open("users.txt", "r", '\r').each do |line|
  #     id, name, age, email = line.strip.split(',')
  #     u = User.new(:id => id, :name => name, :age => age, :email => email)
  #     u.save
  #   end
  # end"
  #https://github.com/csvreader/csvreader
#   What about tabular data packages with pre-defined types / schemas?
#     See the csvpack library »

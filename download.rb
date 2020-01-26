
    require 'open-uri'
    require 'cvsreader'
    require 'pry'
    web1 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2019-clean.txt'){|f| f.read}
    web2 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-monthly-clean.txt'){|f| f.read}
    thing1 = web1.split(/\n/)
    things2 = web2.split(/\n/)
    columns = %i[case_number sr_location county district neighborhood tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day key_map management_district department division sr_type queue sla status sr_create_date due_date date_closed overdue title x y latitude longitude channel_type created_at updated_at]
    thing1.each {|line|
     Sr.new(**CSV.parse( line, headers: columns, sep: "|"))  
    }
  #   File.open("users.txt", "r", '\r').each do |line|
  #     id, name, age, email = line.strip.split(',')
  #     u = User.new(:id => id, :name => name, :age => age, :email => email)
  #     u.save
  #   end
  # end"
  #https://github.com/csvreader/csvreader
  end

end
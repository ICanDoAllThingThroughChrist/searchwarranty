class SpatialOverdueHvy < ApplicationRecord
  def self.seed
    SpatialOverdueHvy.delete_all
    headers = %i[case_number longitude latitude Poly_ID SERVICE_DA]
    #import with Copy and Paste from into below file "spatial-join-quad-assignments2.csv"
    #"C:\Users\e128289\Documents\spatial-join-quad-monthly-quality.txt"
    CSV.foreach("hvy-trash-overdue-spatial-join.csv",
      {encoding: "iso-8859-1:utf-8", headers: true,
        header_converters: :symbol, converters: :all}) {|row|
      SpatialOverdueHvy.create(row.to_hash)
      # binding.pry
    }
  end
  def self.heavy_trash_map_data
    MissedHvy.delete_all
    missed_hvy_case_numbers=
    Sr.where(sr_type: 'Missed Heavy Trash Pickup',
    status: 'Open').distinct.pluck(:case_number)

    missed_hvy_case_numbers.each{|case_number|
      # binding.pry
      item= Sr.find_by case_number:  case_number.to_i
      if item!= nil
        item2= MissedHvy.new(sr_location: item['sr_location'],
          trash_quad: item['trash_quad'],
          case_number: item['case_number'],
          overdue: item['overdue'])
        item2.save
      else
        puts "#{case_number}"# binding.pry
      end
    }
    list=  MissedHvy.all.pluck(:sr_location, :trash_quad,
       :case_number, :overdue)

    headers= %w[sr_location trash_quad case_number overdue]

    CSV.open("../searchwarranty/missed_hvy_distinct_list.csv", "wb",
      write_headers: true, headers: headers) do |csv|
      list.each do |row|
        # binding.pry
          csv << row
        end
      end
  end

  def self.second_tuesday_js
    tally_values = SpatialOverdueHvy.where(service_da:['2nd Tuesday']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/2nd-Tues-OverdueHvy.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.first_monday_js
    tally_values = SpatialOverdueHvy.where(service_da:['1st Monday']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/1st-Monday-OverdueHvy.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.first_friday_js
    tally_values = SpatialOverdueHvy.where(service_da:['1st Friday']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/1st-Friday-OverdueHvy.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.third_wed_js
    tally_values = SpatialOverdueHvy.where(service_da:['3rd Wednesday']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/3rd-wed-OverdueHvy.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.second_thur_js
    tally_values = SpatialOverdueHvy.where(service_da:['2nd Thursday']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/second-thurs-OverdueHvy.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.second_wed_js
    tally_values = SpatialOverdueHvy.where(service_da:['2nd Wednesday']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/second-weds-OverdueHvy.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.second_monday_js
    tally_values = SpatialOverdueHvy.where(service_da:['2nd Monday']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/2nd-Monday-OverdueHvy.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.third_tues_js
    tally_values = SpatialOverdueHvy.where(service_da:['3rd Tuesday']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/third-tues-OverdueHvy.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)


    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/fourth-fri-OverdueHvy.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.first_tuesday_js
    tally_values = SpatialOverdueHvy.where(service_da:['1st Tuesday']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/first-tuesday-OverdueHvy.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.third_thursday_js
    tally_values = SpatialOverdueHvy.where(service_da:['3rd Thursday']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/third-thursday-OverdueHvy.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_tuesday_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Tuesday']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/fourth-tuesday-OverdueHvy.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.third_friday_js
    tally_values = SpatialOverdueHvy.where(service_da:['3rd Friday']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/third-friday-OverdueHvy.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_monday_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/fourth-monday-OverdueHvy.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.first_wed_js
    tally_values = SpatialOverdueHvy.where(service_da:['1st Wednesday']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/1st-wed-OverdueHvy.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.second_fri_js
    tally_values = SpatialOverdueHvy.where(service_da:['2nd Friday']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/2nd-fri-OverdueHvy.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_wed_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Wednesday']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-wed-OverdueHvy.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.first_thursday_js
    tally_values = SpatialOverdueHvy.where(service_da:['1st Thursday']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/1st-thursday-OverdueHvy.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.js_clusters
    SpatialOverdueHvy.second_tuesday_js
    SpatialOverdueHvy.first_monday_js
    SpatialOverdueHvy.first_friday_js
    SpatialOverdueHvy.third_wed_js
    SpatialOverdueHvy.second_monday_js
    SpatialOverdueHvy.second_thur_js
    SpatialOverdueHvy.second_wed_js
    SpatialOverdueHvy.third_tues_js
    SpatialOverdueHvy.fourth_fri_js
    SpatialOverdueHvy.first_tuesday_js
    SpatialOverdueHvy.third_thursday_js
    SpatialOverdueHvy.fourth_tuesday_js
    SpatialOverdueHvy.third_friday_js
    SpatialOverdueHvy.fourth_monday_js
    SpatialOverdueHvy.first_wed_js
    SpatialOverdueHvy.second_fri_js
    SpatialOverdueHvy.fourth_wed_js
    SpatialOverdueHvy.first_thursday_js
  end
end

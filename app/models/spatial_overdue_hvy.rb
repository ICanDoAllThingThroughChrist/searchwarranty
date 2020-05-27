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
    SpatialOverdueHvy.fourth_fri_NE4FR_11_js
    SpatialOverdueHvy.fourth_fri_SW4FR_05_js
    SpatialOverdueHvy.fourth_fri_SE4FR_05_js
    SpatialOverdueHvy.fourth_fri_SE4FR_06_js
    SpatialOverdueHvy.fourth_fri_SE4FR_04_js
    SpatialOverdueHvy.fourth_fri_SW4FR_06_js
    SpatialOverdueHvy.fourth_fri_NE4FR_13_js
    SpatialOverdueHvy.fourth_fri_SW4FR_01_js
    SpatialOverdueHvy.fourth_fri_NE4FR_10_js
    SpatialOverdueHvy.fourth_fri_SW4FR_03_js
    SpatialOverdueHvy.fourth_fri_NE4FR_05_js
    SpatialOverdueHvy.fourth_fri_SE4FR_07_js
    SpatialOverdueHvy.fourth_fri_NE4FR_09_js
    SpatialOverdueHvy.fourth_fri_NE4FR_04_js
    SpatialOverdueHvy.fourth_fri_SW4FR_04_js
    SpatialOverdueHvy.fourth_fri_SE4FR_02_js
    SpatialOverdueHvy.fourth_fri_NE4FR_01_js
    SpatialOverdueHvy.fourth_fri_SW4FR_02_js
    SpatialOverdueHvy.fourth_fri_NE4FR_02_js
    SpatialOverdueHvy.fourth_fri_NE4FR_06_js
    SpatialOverdueHvy.fourth_mon_NE4MO_02_js
    SpatialOverdueHvy.fourth_mon_NE4MO_10_js
    SpatialOverdueHvy.fourth_mon_SE4MO_04_js
    SpatialOverdueHvy.fourth_mon_SE4MO_03_js
    SpatialOverdueHvy.fourth_mon_NE4MO_07_js
    SpatialOverdueHvy.fourth_mon_NE4MO_03_js
    SpatialOverdueHvy.fourth_mon_NE4MO_01_js
    SpatialOverdueHvy.fourth_mon_SE4MO_02_js
    SpatialOverdueHvy.fourth_mon_SW4MO_06_js
    SpatialOverdueHvy.fourth_mon_SE4MO_01_js
    SpatialOverdueHvy.fourth_mon_NE4MO_08_js
    SpatialOverdueHvy.fourth_mon_SE4MO_05_js
    SpatialOverdueHvy.fourth_mon_SE4MO_06_js
    SpatialOverdueHvy.fourth_mon_SW4MO_05_js
    SpatialOverdueHvy.fourth_mon_SW4MO_03_js
    SpatialOverdueHvy.fourth_mon_SE4MO_07_js
    SpatialOverdueHvy.fourth_mon_SW4MO_04_js
    SpatialOverdueHvy.fourth_mon_NE4MO_12_js
    SpatialOverdueHvy.fourth_mon_SW4MO_01_js
  end
  def self.fourth_fri_SW4FR_04_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['SW4FR_04']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-SW4FR_04.js", 'w') { |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    }
  end
  def self.fourth_fri_NE4FR_11_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['NE4FR_11']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-NE4FR_11.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_SW4FR_05_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['SW4FR_05']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-SW4FR_05.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_SE4FR_05_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['SE4FR_05']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-SE4FR_05.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_SE4FR_03_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['SE4FR_03']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-SE4FR_03.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_SE4FR_06_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['SE4FR_06']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-SE4FR_06.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_SE4FR_04_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['SE4FR_04']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-SE4FR_04.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_SW4FR_06_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['SW4FR_06']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-SW4FR_06.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_SW4FR_06_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['SW4FR_06']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-SW4FR_06.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_NE4FR_13_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['NE4FR_13']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-NE4FR_13.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_SW4FR_01_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['SW4FR_01']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-SW4FR_01.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_SW4FR_01_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['SW4FR_01']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-SW4FR_01.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_NE4FR_10_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['NE4FR_10']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-NE4FR_10.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_NE4FR_03_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['NE4FR_03']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-NE4FR_03.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_SW4FR_03_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['SW4FR_03']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-SW4FR_03.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_NE4FR_05_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['NE4FR_05']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-NE4FR_05.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_SE4FR_07_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['SE4FR_07']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-SE4FR_07.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_NE4FR_09_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['NE4FR_09']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-NE4FR_09.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_NE4FR_04_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['NE4FR_04']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-NE4FR_04.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_SE4FR_02_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['SE4FR_02']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-SE4FR_02.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_NE4FR_01_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['NE4FR_01']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-NE4FR_01.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_SW4FR_02_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['SW4FR_02']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-SW4FR_02.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_NE4FR_02_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['NE4FR_02']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-NE4FR_02.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_fri_NE4FR_06_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Friday'],
      poly_id:['NE4FR_06']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-fri-OverdueHvy-NE4FR_06.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_mon_SW4MO_01_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday'],
      poly_id:['SW4MO_01']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-mon-OverdueHvy-SW4MO_01.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_mon_NE4MO_12_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday'],
      poly_id:['NE4MO_12']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-mon-OverdueHvy-NE4MO_12.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_mon_SW4MO_04_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday'],
      poly_id:['SW4MO_04']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-mon-OverdueHvy-SW4MO_04.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_mon_SE4MO_07_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday'],
      poly_id:['SE4MO_07']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-mon-OverdueHvy-SE4MO_07.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_mon_SW4MO_03_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday'],
      poly_id:['SW4MO_03']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-mon-OverdueHvy-SW4MO_03.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_mon_SW4MO_05_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday'],
      poly_id:['SW4MO_05']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-mon-OverdueHvy-SW4MO_05.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_mon_SE4MO_06_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday'],
      poly_id:['SE4MO_06']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-mon-OverdueHvy-SE4MO_06.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_mon_SE4MO_05_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday'],
      poly_id:['SE4MO_05']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-mon-OverdueHvy-SE4MO_05.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_mon_NE4MO_08_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday'],
      poly_id:['NE4MO_08']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-mon-OverdueHvy-NE4MO_08.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_mon_SE4MO_01_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday'],
      poly_id:['SE4MO_01']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-mon-OverdueHvy-SE4MO_01.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_mon_SW4MO_06_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday'],
      poly_id:['SW4MO_06']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-mon-OverdueHvy-SW4MO_06.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_mon_SE4MO_02_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday'],
      poly_id:['SE4MO_02']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-mon-OverdueHvy-SE4MO_02.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_mon_NE4MO_01_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday'],
      poly_id:['NE4MO_01']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-mon-OverdueHvy-NE4MO_01.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_mon_NE4MO_03_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday'],
      poly_id:['NE4MO_03']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-mon-OverdueHvy-NE4MO_03.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_mon_NE4MO_07_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday'],
      poly_id:['NE4MO_07']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-mon-OverdueHvy-NE4MO_07.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_mon_SE4MO_03_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday'],
      poly_id:['SE4MO_03']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-mon-OverdueHvy-SE4MO_03.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_mon_SE4MO_04_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday'],
      poly_id:['SE4MO_04']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-mon-OverdueHvy-SE4MO_04.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_mon_NE4MO_10_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday'],
      poly_id:['NE4MO_10']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-mon-OverdueHvy-NE4MO_10.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
  def self.fourth_mon_NE4MO_02_js
    tally_values = SpatialOverdueHvy.where(service_da:['4th Monday'],
      poly_id:['NE4MO_02']).
    pluck(:case_number, :longitude, :latitude, :poly_id, :service_da)

    headers = %i[case_number longitude latitude poly_id service_da]
    File.open("../searchwarranty/4th-mon-OverdueHvy-NE4MO_02.js", 'w') do |f|
      json = tally_values.map {|line|
        # binding.pry
        c= Hash[headers.zip(line)]
      }
      # binding.pry
      f.puts JSON.pretty_generate(json)
    end
  end
end

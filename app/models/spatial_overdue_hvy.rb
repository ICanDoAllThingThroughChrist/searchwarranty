class SpatialOverdueHvy < ApplicationRecord
  def self.seed
    SpatialOverdueHvy.delete_all
    headers = %i[id case_number longitude latitude Poly_ID SERVICE_DA]
    #import with Copy and Paste from into below file "spatial-join-quad-assignments2.csv"
    #"C:\Users\e128289\Documents\spatial-join-quad-monthly-quality.txt"
    CSV.foreach("hvy-trash-overdue-spatial-join.csv",
      {encoding: "iso-8859-1:utf-8", headers: true,
        header_converters: :symbol, converters: :all}) {|row|
      SpatialOverdueHvy.create(row.to_hash)
    }
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
end

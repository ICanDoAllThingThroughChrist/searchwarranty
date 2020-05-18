class GisSwmdList < ApplicationRecord
  def self.import_existing_gis_cases
    GisSwmdList.delete_all
    csv_text = File.read('C:/Users/e128289/Downloads/Customer_Points_swd.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      GisSwmdList.create!(row.to_hash)
    end
  end

  def self.compare_sr_location_to_synthetic
    matched_sr_location = []

    historical_new_requests_tax_id_list =
    Sr.where(sr_type:['New Resident Container',
      'New Move In']).distinct.pluck(:tax_id)

    historical_new_requests_sr_location =
    Sr.where(sr_type:['New Resident Container',
        'New Move In']).distinct.pluck(:sr_location)

    GisSwmdList.all.each{|service_unit|
      service_unit.synthetic =
      "#{service_unit.synthetic}" +
      " " +
      "#{service_unit.CITY}" +
      " " +
      "#{service_unit.STATE}" +
      " " +
      "#{service_unit.ZIPCODE}"
      service_unit.save
    }
    gisListOfSr_location = GisSwmdList.all.distinct.pluck(:synthetic)
    list_of_matched_sr_location = []
    if gisListOfSr_location.each{|sr_location|
          if Sr.find_by(sr_location: "#{sr_location}")
            list_of_matched_sr_location.push "#{sr_location}"
          else
            puts "#{sr_location}"
          end
          }
    else
      puts "#{sr_location}"
    end

    historical_new_requests_sr_location.each{|request|
        count = 0
        while count < historical_new_requests_sr_location.count
        #binding.pry
          if request.sr_location == GisSwmdList.all.distinct.pluck(:sr_location)
            matched_sr_location << request
          else
            puts "#{request}"
          end
          count +1
        end
    }

    puts "#{matched_sr_location.count}"
    puts "Count of Matched Addressed Between SWMD_GIS and Sr synthetic address:"
    "#{list_of_matched_sr_location.count}"
  end
end

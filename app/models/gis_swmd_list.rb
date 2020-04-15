class GisSwmdList < ApplicationRecord
  def self.import_existing_gis_cases
    csv_text = File.read('C:/Users/e128289/Downloads/Customer_Points_swd.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      GisSwmdList.create!(row.to_hash)
    end
  end

  def self.compare_sr_location_to_synthetic
    new = []
    existing_new_sr_Location_list =
    Sr.where(sr_type:['New Resident Container',
      'New Move In']).
      distinct.pluck(:sr_location)
    GisSwmdList.all.each{|item|
      if item.synthetic == Sr.where(sr_type:['New Resident Container', 'New Move In']).distinct.pluck(:sr_location)
          new.array << item
            binding.pry
      else
        puts "#{item}"
      end
    }
  end
end

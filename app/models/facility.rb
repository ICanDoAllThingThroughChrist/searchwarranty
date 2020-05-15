class Facility < ApplicationRecord
  def self.facilities_info
    require 'csv'
    csv_text = File.read('Faciliites-Name-Contact.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
        Facility.create!(row.to_hash)
        end
  end

end

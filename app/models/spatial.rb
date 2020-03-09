class Spatial < ApplicationRecord
  def self.seed
    headers = %i[id case_number QUAD]
    CSV.foreach("C:/Users/e128289/Documents/spatial-join-quad-assignments.csv", {encoding: "iso-8859-1:utf-8", headers: true, header_converters: :symbol, converters: :all}) {|row|
      Spatial.create(row.to_hash)
    }
  end
end

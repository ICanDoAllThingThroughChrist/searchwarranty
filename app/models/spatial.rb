class Spatial < ApplicationRecord
  def self.seed
    Spatial.delete_all
    headers = %i[id case_number QUAD]
    #import with Copy and Paste from NoQuadOverdue and NoQuadNotOverdue into below file
    #"C:\Users\e128289\Documents\NoQuadOverdue.txt"
    #"C:\Users\e128289\Documents\NoQuadNotOverdue.txt"
    CSV.foreach("C:/Users/e128289/Documents/spatial-join-quad-assignments.csv",
      {encoding: "iso-8859-1:utf-8", headers: true, header_converters: :symbol, converters: :all}) {|row|
      Spatial.create(row.to_hash)
    }
  end
end

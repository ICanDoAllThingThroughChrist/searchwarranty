class Spatial < ApplicationRecord
  def self.seed2
    Spatial.delete_all
    headers = %i[id case_numbe QUAD]
    #import with Copy and Paste from into below file "spatial-join-quad-assignments2.csv"
    #"C:\Users\e128289\Documents\spatial-join-quad-monthly-quality.txt"
    CSV.foreach("spatial-join-quad-assignments2.csv",
      {encoding: "iso-8859-1:utf-8", headers: true,
        header_converters: :symbol, converters: :all}) {|row|
      Spatial.create(row.to_hash)
    }
  end
  def self.seed
    Spatial.delete_all
    headers = %i[id case_numbe QUAD]
    #import with Copy and Paste from NoQuadOverdue and NoQuadNotOverdue into below file
    #"C:\Users\e128289\Documents\NoQuadOverdue.txt"
    #"C:\Users\e128289\Documents\NoQuadNotOverdue.txt"
    CSV.foreach("spatial-join-quad-assignments.csv",
      {encoding: "iso-8859-1:utf-8", headers: true,
        header_converters: :symbol, converters: :all}) {|row|
      Spatial.create(row.to_hash)
    }
    # binding.pry
  end
end

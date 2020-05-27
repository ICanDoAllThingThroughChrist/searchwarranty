class WarrantyList < ApplicationRecord
  def self.search_for_warranty(aCase)
    array = WarrantyList.all
    array.each {|warranty|
      if aCase.between?(warranty.case1, warranty.case2)
        aCaseWarrantyDate = "#{warranty.expiration_date}"
      end
    }
    puts "#{aCaseWarrantyDate}"
  end
end

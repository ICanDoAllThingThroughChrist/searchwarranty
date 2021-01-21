class WarrantyList < ApplicationRecord
  def self.search_for_warranty(aCase)
    array = WarrantyList.all
    array.each {|warranty|
      if aCase.between?(warranty.case1, warranty.case2)
        aCaseWarrantyDate= "#{warranty.expiration_date}"
      end
    }
    puts "#{aCaseWarrantyDate}"
  end
  def self.search_for_warranty2(aCase)
    array = WarrantyList.all
    aCaseWarrantyDate =[]
    aCaseOrderNum= []
    aCaseItemNum= []
    aCaseItemDesc= []
    array.each {|c|
      if aCase.between?(c.BegNum,  c.EndNum)
        aCaseWarrantyDate << "#{c.WarrantyEnd}"
        aCaseOrderNum << "#{c.OrderNum}"
        aCaseItemNum << "#{c.ItemNum}"
        aCaseItemDesc << "#{c.ItemDesc}"
      end
    }
    #binding.pry
    puts "#{aCaseWarrantyDate}"
    @search = Request.create(
      warranty: "#{aCaseWarrantyDate}",
      orderNum: "#{aCaseOrderNum}",
      itemNum: "#{aCaseItemNum}",
      itemDesc: "#{aCaseItemDesc}"
    )
    #binding.pry
    #return "#{aCaseWarrantyDate}"
    # binding.pry
    #find distinct BegNum Values with WarrantyList.distinct.pluck(:BegNum)
  end
  def self.nil_resolution
    ar = WarrantyList.all
    ar.each {|i|
      if i.BegNum == nil
        i.BegNum=0
        i.EndNum=0
        i.save
      else
        next
      end
    }
  end
end

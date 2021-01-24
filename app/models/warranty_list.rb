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
    aCasePO= []
    array.each {|c|
      #binding.pry
      if aCase.between?(c.BegNum,  c.EndNum)
        aCaseWarrantyDate << "#{c.WarrantyEnd}"
        aCaseOrderNum << "#{c.OrderNum}"
        aCaseItemNum << "#{c.ItemNum}"
        aCaseItemDesc << "#{c.ItemDesc}"
        aCasePO << "#{c.PO}"
      else
        puts "serial number is not in system"
      end
      #binding.pry
    }
    #binding.pry
    puts "#{aCaseWarrantyDate}",
    "#{aCaseOrderNum}", "#{aCaseItemNum}", "#{aCaseItemDesc}",
    "#{aCasePO}"
     # binding.pry
    @search = Request.create(
      warranty: "#{aCaseWarrantyDate[0]}, #{aCaseWarrantyDate[1]},#{aCaseWarrantyDate[2]}",
      orderNum: "#{aCaseOrderNum[0]}, #{aCaseOrderNum[1]}, #{aCaseOrderNum[2]}",
      itemNum: "#{aCaseItemNum[0]}, #{aCaseItemNum[1]}, #{aCaseItemNum[2]}",
      itemDesc: "#{aCaseItemDesc[0]}, #{aCaseItemDesc[1]}, #{aCaseItemDesc[2]}",
      po: "#{aCasePO[0]},#{aCasePO[1]},#{aCasePO[2]}"
    )
    #binding.pry
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

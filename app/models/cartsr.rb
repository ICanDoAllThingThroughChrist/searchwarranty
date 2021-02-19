class Cartsr < ApplicationRecord
  has_one_attached :avatar, :dependent => :destroy
  has_many_attached :contracts
  enum consumption_type: {
    "Lost/Stolen"=> 1,
    "Warranty"=> 2,
    "Employee Destruction"=> 3,
    "New Delivery" => 4,
  }
  enum repair_replace:{
    "repair" => 1,
    "replace" =>2,
  }
  enum part: {
    "lid"=> 1,
    "wheel/axle"=>2,
    "body"=> 3,
  }
  def self.set_warranty(cartsrs_params)
    Cartsr.new(cartsrs_params)
    cart_warranty= Cartsr.last
    cart_warranty.warranty=1
    cart_warranty.save
    # Cart.last
  end
  def self.warranty_dates
    require 'creek'
    creek = Creek::Book.new 'C:\Users\e128289\Downloads\Carts_Warranty_dtl.xlsx'
    sheet= creek.sheets[0]
    a = []
    sheet.simple_rows.each do |row|
        a.push row # => {"A"=>"Content 1", "B"=>nil, "C"=>nil, "D"=>"Content 3"}
    end

    a.each {|i|
      if i["A"] == "BegSerNo"
        next
      else
         WarrantyList.create(BegNum: i["A"], EndNum: i["B"], PO: i["C"], WarrantyStart: i["D"], WarrantyEnd: i["E"])
      end
      # binding.pry
    }
    binding.pry
  end
  def self.warranty_csv
      require 'creek'
      creek = Creek::Book.new 'C:\Users\e128289\OneDrive - City of Houston\Desktop\Copy of City of Houston Serial # 2009-2019.xlsx'
      sheet= creek.sheets[0]
      a = []
      b = []
      c = []
      sheet.rows.each do |row|
          a.push row
      end
      sheet.simple_rows.each do |row|
          b.push row # => {"A"=>"Content 1", "B"=>nil, "C"=>nil, "D"=>"Content 3"}
          c.push row
      end
      b.map do |r|
        #r["I"]=r["I"].to_i#failed to set to desired trim digits.
        if r["H"] == "Beg Ser No" || r["H"].class == Float
          next
        elsif r["H"].include?('SS')
          r["H"]=r["H"].gsub(/[SS]/, '00')
          r["H"]=r["H"].to_i
        elsif r["H"].include?('00')
          # r["I"]=r["I"].gsub(/[00]/, '00')
          r["H"]=r["H"].to_i
        else
          puts "next"
        end
      end
      c.each {|r|
        #binding.pry
        if r["I"] == "End Ser No" || r["I"].class == Float
          next
        #binding.pry
        elsif r["I"].include?('SS')
          r["I"]=r["I"].gsub(/[SS]/, '00')
          r["I"]=r["I"].to_i
          #binding.pry
        elsif r["I"].include?('00')
          # r["I"]=r["I"].gsub(/[00]/, '00')
          r["I"]=r["I"].to_i
      # binding.pry
        end
       }
      headers = %w[A B C D E F G H I J K L M N O P Q R]#what are the headers?
      CSV.open("C:/Users/e128289/Downloads/Carts_Warranty.csv", "wb", write_headers: true, headers: headers) do |csv|
           c.each do |row|
             csv << row
           end
         end
    end

    def to_csv(csv_filename="hash.csv")
    require 'csv'
      CSV.open(csv_filename, "wb") do |csv|
        csv << first.keys # adds the attributes name on the first line
        self.each do |hash|
          csv << hash.values
        end
      end
    end
end

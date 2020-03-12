class OpenSr < ApplicationRecord
  def self.sr_route
    OpenSr.delete_all
    @input = File.open("C:/Users/e128289/Documents/OpenSRRoute.txt")
    header=%w[case_numbe  sr_type  sec_name quad day quad_status]
      @input.each_line {|row|
        a= row.chomp
        array=a.split(",")
        b=Hash[header.zip(array)]
        OpenSr.create(b)
      }
    particular = OpenSr.where(sr_type: ['Missed Heavy Trash Pickup','Missed Garbage Pickup','Missed Recycling Pickup','Missed Yard Waste Pickup'])
      particular.each {|t|
        t.tally = 1
        t.save
      }
    header2 = %w[case_numbe sr_type sec_name quad day quad_status tally]
    CSV.open("C:/Users/e128289/Documents/OpenSr.csv", "wb", write_headers: true, headers: header2) { |csv|
      OpenSr.where(sr_type: ['Missed Heavy Trash Pickup','Missed Garbage Pickup','Missed Recycling Pickup','Missed Yard Waste Pickup']).
      pluck(:case_numbe, :sr_type, :sec_name, :quad, :day, :quad_status, :tally).
      each { |row|
        csv << row
      }
    }
    open_sr = Daru::DataFrame.from_csv 'C:/Users/e128289/Documents/OpenSr.csv'
    binding.pry
    open_sr_pivot = open_sr.pivot_table(index:['sr_type'],values:'tally', vectors: ['quad_status'], agg: :sum)
    binding.pry
    File.open('C:/Users/e128289/searchwarranty/app/views/srs/open_sr.html.erb', 'w+'){|f| f << open_sr_pivot.to_html }
    File.open('C:/Users/e128289/searchwarranty/app/views/srs/open_sr.html', 'w+'){|f| f << open_sr_pivot.to_html }
    binding.pry
  end
end

class OpenSr < ApplicationRecord
  def self.sr_route
    OpenSr.delete_all
    @input = File.open("C:/Users/e128289/Documents/OpenSRRoute.txt")
    header=%w[case_numbe sr_type quad_statu day sec_name quad tally]
      @input.each_line {|row|
        a= row.chomp
        # binding.pry
        array=a.split(",")
        b=Hash[header.zip(array)]
        OpenSr.create(b)
      }
    particular = OpenSr.where(sr_type: ['Missed Heavy Trash Pickup','Missed Garbage Pickup','Missed Recycling Pickup','Missed Yard Waste Pickup'])
      particular.each {|t|
        t.tally = 1
        t.save
      }
    header2 = %w[case_numbe sr_type quad_statu day sec_name quad tally]
    CSV.open("C:/Users/e128289/Documents/OpenSr.csv", "wb", write_headers: true, headers: header2) { |csv|
          OpenSr.where(sr_type: ['Missed Heavy Trash Pickup','Missed Garbage Pickup','Missed Recycling Pickup','Missed Yard Waste Pickup']).
          pluck(:case_numbe, :sr_type, :quad_statu, :day, :sec_name, :quad, :tally).
          each { |row|
            csv << row
          }
        }
    CSV.open("C:/Users/e128289/Documents/OpenSrNMondayRoutes.csv", "wb", write_headers: true, headers: header2) { |csv|
        OpenSr.where(sr_type: ['Missed Heavy Trash Pickup','Missed Garbage Pickup','Missed Recycling Pickup','Missed Yard Waste Pickup'],  day:['MONDAY'], quad:['NE',  'NW'], quad_statu:['NE_Overdue', 'NW_Overdue']).
        pluck(:case_numbe, :sr_type, :quad_statu, :day, :sec_name, :quad, :tally).
        each { |row|
          csv << row
          }
        }
    CSV.open("C:/Users/e128289/Documents/OpenSrNTuesdayRoutes.csv", "wb", write_headers: true, headers: header2) { |csv|
            OpenSr.where(sr_type: ['Missed Heavy Trash Pickup','Missed Garbage Pickup','Missed Recycling Pickup','Missed Yard Waste Pickup'],  day:['TUESDAY'], quad:['NE',  'NW'], quad_statu:['NE_Overdue', 'NW_Overdue']).
            pluck(:case_numbe, :sr_type, :quad_statu, :day, :sec_name, :quad, :tally).
            each { |row|
              csv << row
            }
          }
    CSV.open("C:/Users/e128289/Documents/OpenSrNThursdayRoutes.csv", "wb", write_headers: true, headers: header2) { |csv|
            OpenSr.where(sr_type: ['Missed Heavy Trash Pickup','Missed Garbage Pickup','Missed Recycling Pickup','Missed Yard Waste Pickup'],  day:['THURSDAY'], quad:['NE',  'NW'], quad_statu:['NE_Overdue', 'NW_Overdue']).
            pluck(:case_numbe, :sr_type, :quad_statu, :day, :sec_name, :quad, :tally).
            each { |row|
              csv << row
            }
          }
    CSV.open("C:/Users/e128289/Documents/OpenSrNFridayRoutes.csv", "wb", write_headers: true, headers: header2) { |csv|
                OpenSr.where(sr_type: ['Missed Heavy Trash Pickup','Missed Garbage Pickup','Missed Recycling Pickup','Missed Yard Waste Pickup'],  day:['FRIDAY'], quad:['NE',  'NW'], quad_statu:['NE_Overdue', 'NW_Overdue']).
                pluck(:case_numbe, :sr_type, :quad_statu, :day, :sec_name, :quad, :tally).
                each { |row|
                  csv << row
            }
          }
    CSV.open("C:/Users/e128289/Documents/OpenSrSMondayRoutes.csv", "wb", write_headers: true, headers: header2) { |csv|
              OpenSr.where(sr_type: ['Missed Heavy Trash Pickup','Missed Garbage Pickup','Missed Recycling Pickup','Missed Yard Waste Pickup'],  day:['MONDAY'], quad:['SE',  'SW'], quad_statu:['SE_Overdue', 'SW_Overdue']).
              pluck(:case_numbe, :sr_type, :quad_statu, :day, :sec_name, :quad, :tally).
              each { |row|
                csv << row
                }
              }
    CSV.open("C:/Users/e128289/Documents/OpenSrSTuesdayRoutes.csv", "wb", write_headers: true, headers: header2) { |csv|
                  OpenSr.where(sr_type: ['Missed Heavy Trash Pickup','Missed Garbage Pickup','Missed Recycling Pickup','Missed Yard Waste Pickup'],  day:['TUESDAY'], quad:['SE',  'SW'], quad_statu:['SE_Overdue', 'SW_Overdue']).
                  pluck(:case_numbe, :sr_type, :quad_statu, :day, :sec_name, :quad, :tally).
                  each { |row|
                    csv << row
                  }
                }
   CSV.open("C:/Users/e128289/Documents/OpenSrSThursdayRoutes.csv", "wb", write_headers: true, headers: header2) { |csv|
                  OpenSr.where(sr_type: ['Missed Heavy Trash Pickup','Missed Garbage Pickup','Missed Recycling Pickup','Missed Yard Waste Pickup'],  day:['THURSDAY'], quad:['SE',  'SW'], quad_statu:['SE_Overdue', 'SW_Overdue']).
                  pluck(:case_numbe, :sr_type, :quad_statu, :day, :sec_name, :quad, :tally).
                  each { |row|
                    csv << row
                  }
                }
   CSV.open("C:/Users/e128289/Documents/OpenSrSFridayRoutes.csv", "wb", write_headers: true, headers: header2) { |csv|
                      OpenSr.where(sr_type: ['Missed Heavy Trash Pickup','Missed Garbage Pickup','Missed Recycling Pickup','Missed Yard Waste Pickup'],  day:['FRIDAY'], quad:['SE',  'SW'], quad_statu:['SE_Overdue', 'SW_Overdue']).
                      pluck(:case_numbe, :sr_type, :quad_statu, :day, :sec_name, :quad, :tally).
                      each { |row|
                        csv << row
                  }
                }
    open_sr = Daru::DataFrame.from_csv 'C:/Users/e128289/Documents/OpenSr.csv'
    friday_open_sr = Daru::DataFrame.from_csv 'C:/Users/e128289/Documents/OpenSrNFridayRoutes.csv'
    thursday_open_sr = Daru::DataFrame.from_csv 'C:/Users/e128289/Documents/OpenSrNThursdayRoutes.csv'
    tuesday_open_sr = Daru::DataFrame.from_csv 'C:/Users/e128289/Documents/OpenSrNTuesdayRoutes.csv'
    monday_open_sr = Daru::DataFrame.from_csv 'C:/Users/e128289/Documents/OpenSrNMondayRoutes.csv'
    friday2_open_sr = Daru::DataFrame.from_csv 'C:/Users/e128289/Documents/OpenSrSFridayRoutes.csv'
    thursday2_open_sr = Daru::DataFrame.from_csv 'C:/Users/e128289/Documents/OpenSrSThursdayRoutes.csv'
    tuesday2_open_sr = Daru::DataFrame.from_csv 'C:/Users/e128289/Documents/OpenSrSTuesdayRoutes.csv'
    monday2_open_sr = Daru::DataFrame.from_csv 'C:/Users/e128289/Documents/OpenSrSMondayRoutes.csv'
    # binding.pry
    open_sr_pivot = open_sr.pivot_table(index:['sr_type'],values:'tally', vectors: ['quad_statu'], agg: :sum)
    open_sr_pivot2 = friday_open_sr.pivot_table(index:['sec_name'],values:'tally', vectors: ['quad_statu', 'sr_type'], agg: :sum)
    open_sr_pivot3 = thursday_open_sr.pivot_table(index:['sec_name'],values:'tally', vectors: ['quad_statu', 'sr_type'], agg: :sum)
    open_sr_pivot4 = tuesday_open_sr.pivot_table(index:['sec_name'],values:'tally', vectors: ['quad_statu', 'sr_type'], agg: :sum)
    open_sr_pivot5 = monday_open_sr.pivot_table(index:['sec_name'],values:'tally', vectors: ['quad_statu', 'sr_type'], agg: :sum)
    open_sr_pivot6 = friday2_open_sr.pivot_table(index:['sec_name'],values:'tally', vectors: ['quad_statu', 'sr_type'], agg: :sum)
    open_sr_pivot7 = thursday2_open_sr.pivot_table(index:['sec_name'],values:'tally', vectors: ['quad_statu', 'sr_type'], agg: :sum)
    open_sr_pivot8 = tuesday2_open_sr.pivot_table(index:['sec_name'],values:'tally', vectors: ['quad_statu', 'sr_type'], agg: :sum)
    open_sr_pivot9 = monday2_open_sr.pivot_table(index:['sec_name'],values:'tally', vectors: ['quad_statu', 'sr_type'], agg: :sum)
    binding.pry
    File.open('C:/Users/e128289/searchwarranty/app/views/open_srs/test.html', 'w+'){|f| f << open_sr_pivot.to_html }
    File.open('C:/Users/e128289/searchwarranty/app/views/open_srs/test2.html', 'w+'){|f| f << open_sr_pivot2.to_html }
    File.open('C:/Users/e128289/searchwarranty/app/views/open_srs/test3.html', 'w+'){|f| f << open_sr_pivot3.to_html }
    File.open('C:/Users/e128289/searchwarranty/app/views/open_srs/test4.html', 'w+'){|f| f << open_sr_pivot4.to_html }
    File.open('C:/Users/e128289/searchwarranty/app/views/open_srs/test5.html', 'w+'){|f| f << open_sr_pivot5.to_html }
    File.open('C:/Users/e128289/searchwarranty/app/views/open_srs/test6.html', 'w+'){|f| f << open_sr_pivot6.to_html }
    File.open('C:/Users/e128289/searchwarranty/app/views/open_srs/test7.html', 'w+'){|f| f << open_sr_pivot7.to_html }
    File.open('C:/Users/e128289/searchwarranty/app/views/open_srs/test8.html', 'w+'){|f| f << open_sr_pivot8.to_html }
    File.open('C:/Users/e128289/searchwarranty/app/views/open_srs/test9.html', 'w+'){|f| f << open_sr_pivot9.to_html }
    binding.pry
  end
end

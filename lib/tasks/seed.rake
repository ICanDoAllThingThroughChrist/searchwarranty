namespace :seed do
  desc "TODO"
  task swm_related_tasks: :environment do
    creek = Creek::Book.new "/Users/e128289/OneDrive - City of Houston/Desktop/Case Advanced Find View - last2.xlsx"
    sheet = creek.sheets[0]
    a=[]
    sheet.simple_rows.each do |row| a.push row end
      binding.pry
      # a.each {|i|
      #   binding.pry
      #     # Sr.create(case_title:"#{i["A"]}",Resolve_by_SLA_status:"#{i["B"]}",resolve_by:"#{i["C"]}")
      # }

  end
  task route_ton: :environment do
     creek = Creek::Book.new "/Users/e128289/OneDrive - City of Houston/Desktop/tpia/route-data.xlsx"
     sheet = creek.sheets[0]
     a = []
     sheet.simple_rows.each do |row| a.push row end
      a.each {|i|
      binding.pry
      }
  end
  task upload_residents: :environment do
    require 'creek'
    require 'pry'

    creek = Creek::Book.new "/Users/e128289/OneDrive - City of Houston/daily-reports/residents.xlsx"
    sheet = creek.sheets[0]
    a = []
    sheet.simple_rows.each do |row| a.push row end
    a.each {|item|
      Unit.create(
        OBJECTID: "#{item["A"]}", created_user: "#{item["B"]}", created_date: "#{item["C"]}", last_edited_user: "#{item["D"]}", last_edited_date: "#{item["E"]}",
        SEC_NAME: "#{item["F"]}", COLLECT_DAY: "#{item["G"]}", QUAD: "#{item["H"]}",
        HELP_SECTION: "#{item["I"]}", RECY_QUAD: "#{item["J"]}", RECY_COLLECT_DAY: "#{item["K"]}",
        RECY_SEC_NAME: "#{item["L"]}", HVY_TRSH_SEC_NAME: "#{item["M"]}", HVY_TRSH_COLLECT_DAY: "#{item["N"]}",
        HVY_TRSH_QUAD: "#{item["O"]}", LIFT_COUNT: "#{item["P"]}", SERV_TYPE: "#{item["Q"]}",
        STREET_NUM: "#{item["R"]}", FRACTION: "#{item["S"]}", PREFIX: "#{item["T"]}", STREET_NAME: "#{item["U"]}",
        SUFFIX: "#{item["V"]}", STREET_TYPE: "#{item["W"]}", STATE: "#{item["X"]}", CITY: "#{item["Y"]}",
        ZIPCODE: "#{item["Z"]}", X_COORD: "#{item["AA"]}", Y_COORD: "#{item["AB"]}", DESCR:"#{item["AC"]}",
        LAT: "#{item["AD"]}", LONG: "#{item["AE"]}", Customer_ID: "#{item["AF"]}", GlobalID: "#{item["AG"]}")
    }
  end
  task upload_rehrig_warranty_list: :environment do
    require 'creek'
    require 'pry'
    #binding.pry
    creek = Creek::Book.new "/Users/e128289/OneDrive - City of Houston/Desktop/rehrig-warranty-data.xlsx"
    sheet = creek.sheets[0]
    sheet.simple_rows.each do |row| puts row  end
    a = []
    sheet.simple_rows.each do |row| a.push row end
    a.each {|item|
      if item["A"] == "beg_num"
        next
      else
        item["A"]= item["A"].to_i
        item["B"]= item["B"].to_i
        WarrantyList.create(BegNum: "#{item["A"]}", EndNum: "#{item["B"]}", WarrantyStart: "#{item["C"]}", WarrantyEnd: "#{item["D"]}", PO: "#{item["E"]}",
        OrderNum: "#{item["F"]}", ItemNum: "#{item["G"]}", ItemDesc: "#{item["H"]}")
        #binding.pry
      end
      }
  end
  task upload_toter_warranty_list: :environment do
    require 'creek'
    require 'pry'
  # creek2 = Creek::Book.new "/Users/charlielee/Desktop/Warranty-info.xlsx"
  creek3 = Creek::Book.new "/Users/e128289/OneDrive - City of Houston/Desktop/Warranty-info.xlsx"
  sheet2 = creek3.sheets[0]
  # sheet2 = creek2.sheets[0]
  sheet2.simple_rows.each do |row| puts row  end
  b = []
  sheet2.simple_rows.each do |row| b.push row end
  b.each {|item|
    if item["A"] == "beg_num"
      next
    else
      item["A"]= item["A"].to_i
      item["B"]= item["B"].to_i
      WarrantyList.create(BegNum: "#{item["A"]}", EndNum: "#{item["B"]}", WarrantyStart: "#{item["C"]}", WarrantyEnd: "#{item["D"]}", PO: "#{item["E"]}",
      OrderNum: "#{item["F"]}", ItemNum: "#{item["G"]}", ItemDesc: "#{item["H"]}")
      #binding.pry
    end
    }
  end
  task FY2018_to_present_requests: :environment do
    start = Date.parse('2017-07-01')
    due = DateTime.now
    Sr.
    where('sr_create_date >= ? AND sr_create_date <=?',start, due).
      where(department: 'SWM Solid Waste Management').
      delete_all
        columns = %i[CASE_NUMBER	SR_LOCATION	COUNTY	CLIENT
          STREET_NUM	CLIENT_STREET	CITY	STATE	ZIP	PHONE_NUMBER
          EMAIL_ADDRESS	DISTRICT	NEIGHBORHOOD	TAX_ID
          GARBAGE_ROUTE	GARBAGE_DAY1	GARBAGE_QUAD	RECYCLE_DAY1
          RECYCLE_ROUTE	RECYCLE_QUAD	HEAVY_TRASH_DAY	HEAVY_TRASH_QUAD
          KEY_MAP	MANAGEMENT_DISTRICT	SR_OWNER	SR_CREATOR	DEPARTMENT
          DIVISION	SR_TYPE	QUEUE	SLA	STATUS	SR_CREATE_DATE	DUE_DATE
          DATE_CLOSED	RESOLUTION_TIME	OVERDUE]
        CSV.foreach("C:/Users/e128289/Downloads/SWM All Data with Resolution Time-July1st2017-Dec31-2017.csv",
             { encoding: "iso-8859-1:utf-8",
                headers: true,
                header_converters: :symbol,converters: :all}) {|row|
            # binding.pry
           Sr.create(row.to_hash)
            # binding.pry
          }
          CSV.foreach("C:/Users/e128289/Downloads/SWM All Data with Resolution Time-Jan12018-Dec302018.csv",
               { encoding: "iso-8859-1:utf-8",
                  headers: true,
                  header_converters: :symbol,converters: :all}) {|row|
              # binding.pry
             Sr.create(row.to_hash)
              # binding.pry
            }
            CSV.foreach("C:/Users/e128289/Downloads/SWM All Data with Resolution Time-Dec302018-Dec312018.csv",
                 { encoding: "iso-8859-1:utf-8",
                    headers: true,
                    header_converters: :symbol,converters: :all}) {|row|
                # binding.pry
               Sr.create(row.to_hash)
                # binding.pry
              }
                CSV.foreach("C:/Users/e128289/Downloads/SWM All Data with Resolution Time-Jan12019-Dec31-2019.csv",
                     { encoding: "iso-8859-1:utf-8",
                        headers: true,
                        header_converters: :symbol,converters: :all}) {|row|
                    # binding.pry
                   Sr.create(row.to_hash)
                    # binding.pry
                  }
                CSV.foreach("C:/Users/e128289/Downloads/All Data with Resolution Time-Jan1st2020-June19-2020.csv",
                       { encoding: "iso-8859-1:utf-8",
                          headers: true,
                          header_converters: :symbol,converters: :all}) {|row|
                      # binding.pry
                     Sr.create(row.to_hash)
                      # binding.pry
                    }
                CSV.foreach("C:/Users/e128289/Downloads/SWM All Data with Resolution Time-June20-2020-June212021.csv",
                         { encoding: "iso-8859-1:utf-8",
                            headers: true,
                            header_converters: :symbol,converters: :all}) {|row|
                        # binding.pry
                       Sr.create(row.to_hash)
                        # binding.pry
                    }
  end
  task april_2020: :environment do
    require 'open-uri'
    require 'csvreader'
    require 'byebug'
    require 'csv'
    start_date = Date.parse('2020-04-01')
    endDate = Date.parse('2020-04-30')
    Sr.where("sr_create_date >=? AND sr_create_date <= ?", start_date, endDate).delete_all
    CSV.foreach("C:/Users/e128289/Downloads/SWM All Data with Resolution Time-April2020.csv",
       { encoding: "iso-8859-1:utf-8",
          headers: true,
          header_converters: :symbol,converters: :all}) {|row|
      # binding.pry
     Sr.create(row.to_hash)
      # binding.pry
    }
    Sr.pivot
  end
  task daily_update: :environment do
    require 'open-uri'
    require 'csvreader'
    require 'byebug'
    require 'csv'
    start_date = Date.parse('2020-01-01')
    endDate = Date.parse('2021-07-30')
    Sr.where("sr_create_date >=? AND sr_create_date <= ?", start_date, endDate).delete_all
    web1 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-monthly.txt'){|f| f.read}
    # web2 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2020.txt'){|f| f.read}
    web3 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2021.txt'){|f| f.read}
    things1 = web1.split(/\n/)#creates an  new array
    # things2 = web2.split(/\n/)#creates an  new array
    things3 = web3.split(/\n/)#creates an  new array
    columns = %i[case_number sr_location county district neighborhood tax_id
      trash_quad recycle_quad trash_day heavy_trash_day recycle_day
       key_map management_district department division sr_type queue
        sla status sr_create_date due_date date_closed overdue title
         x y latitude longitude channel_type created_at updated_at]

     things1.each {|sr|
         # byebug
         b=sr.split('|')
         c=Hash[columns.zip(b)]
         # byebug
         Sr.create(c)
         # byebug
      }
      # things2.each {|sr|
      #     # byebug
      #     b=sr.split('|')
      #     c=Hash[columns.zip(b)]
      #     # byebug
      #     Sr.create(c)
      #     # byebug
      #  }
       things3.each {|sr|
           # byebug
           b=sr.split('|')
           c=Hash[columns.zip(b)]
           # byebug
           Sr.create(c)
           # byebug
        }
       Sr.pivot
  end
  task yr_2020_update: :environment do
    require 'open-uri'
    require 'csvreader'
    require 'byebug'
    require 'csv'
    start_date = Date.parse('2020-01-01')
    endDate = Date.parse('2020-3-31')
    Sr.where("sr_create_date >=? AND sr_create_date <= ?", start_date, endDate).delete_all
    web1 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2020.txt'){|f| f.read}
    things1 = web1.split(/\n/)#creates an  new array

    columns = %i[case_number sr_location county district neighborhood tax_id
      trash_quad recycle_quad trash_day heavy_trash_day recycle_day
       key_map management_district department division sr_type queue
        sla status sr_create_date due_date date_closed overdue title
         x y latitude longitude channel_type created_at updated_at]

     things1.each {|sr|
         # byebug
         b=sr.split('|')
         c=Hash[columns.zip(b)]
         # byebugra
         Sr.create(c)
         # byebug
      }
       Sr.pivot
  end
  task yr_2019_update: :environment do
    require 'open-uri'
    require 'csvreader'
    require 'byebug'
    require 'csv'
    start_date = Date.parse('2019-01-01')
    endDate = Date.parse('2019-12-31')
    Sr.where("sr_create_date >=? AND sr_create_date <= ?", start_date, endDate).delete_all
    web1 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2019-clean.txt'){|f| f.read}
    things1 = web1.split(/\n/)#creates an  new array

    columns = %i[case_number sr_location county district neighborhood tax_id
      trash_quad recycle_quad trash_day heavy_trash_day recycle_day
       key_map management_district department division sr_type queue
        sla status sr_create_date due_date date_closed overdue title
         x y latitude longitude channel_type created_at updated_at]

     things1.each {|sr|
         # byebug
         b=sr.split('|')
         c=Hash[columns.zip(b)]
         # byebugra
         Sr.create(c)
         # byebug
      }
       Sr.pivot
  end
  task import_sr_2016_2019: :environment do
    require 'open-uri'
    require 'csvreader'
    require 'byebug'
    require 'csv'

    start_date = Date.parse('2016-01-01')
    endDate = Date.parse('2019-12-31')
    Sr.where("sr_create_date >=? AND sr_create_date <= ?", start_date, endDate).delete_all
    web1 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2016-clean.txt'){|f| f.read}
    web2 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2017-clean.txt'){|f| f.read}
    web3 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2018-clean.txt'){|f| f.read}
    web4 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2019-clean.txt'){|f| f.read}
    things1 = web1.split(/\n/)
    things2 = web2.split(/\n/)
    things3 = web3.split(/\n/)
    things4 = web4.split(/\n/)
    columns = %i[case_number sr_location county district neighborhood tax_id
       trash_quad recycle_quad trash_day heavy_trash_day recycle_day
        key_map management_district department division sr_type queue
         sla status sr_create_date due_date date_closed overdue title
          x y latitude longitude channel_type created_at updated_at]
    things1.each {|sr|
              # byebug
              b=sr.split('|')
              c=Hash[columns.zip(b)]
              # byebug
              Sr.create(c)
              # byebug
           }

    things2.each {|sr|
        # byebug
        b=sr.split('|')
        c=Hash[columns.zip(b)]
        # byebug
        Sr.create(c)
        # byebug
     }
     things3.each {|sr|
         # byebug
         b=sr.split('|')
         c=Hash[columns.zip(b)]
         # byebugra
         Sr.create(c)
         # byebug
      }
     things4.each {|sr|
         # byebug
         b=sr.split('|')
         c=Hash[columns.zip(b)]
         # byebug
         Sr.create(c)
         # byebug
      }
    Sr.pivot
  end
  task import_sr_2019_2020: :environment do
    require 'open-uri'
    require 'csvreader'
    require 'byebug'
    require 'csv'
    start_date = Date.parse('2019-01-01')
    endDate = DateTime.now
    Sr.where("sr_create_date >=? AND sr_create_date <= ?", start_date, endDate).delete_all
    web1 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-monthly-clean.txt'){|f| f.read}
    web2 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2019-clean.txt'){|f| f.read}
    things1 = web1.split(/\n/)#creates an  new array
    things2 = web2.split(/\n/)

    columns = %i[case_number sr_location county district neighborhood tax_id
      trash_quad recycle_quad trash_day heavy_trash_day recycle_day
       key_map management_district department division sr_type queue
        sla status sr_create_date due_date date_closed overdue title
         x y latitude longitude channel_type created_at updated_at]

     things1.each {|sr|
         # byebug
         b=sr.split('|')
         c=Hash[columns.zip(b)]
         # byebugra
         Sr.create(c)
         # byebug
      }
      things2.each {|sr|
          # byebug
          b=sr.split('|')
          c=Hash[columns.zip(b)]
          # byebug
          Sr.create(c)
          # byebug
       }
    web3 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2020.txt'){|f| f.read}

    things3 = web3.split(/\n/)

    columns = %i[case_number sr_location county district neighborhood tax_id
       trash_quad recycle_quad trash_day heavy_trash_day recycle_day
        key_map management_district department division sr_type queue
         sla status sr_create_date due_date date_closed overdue title
          x y latitude longitude channel_type created_at updated_at]

     things3.each {|sr|
         # byebug
         b=sr.split('|')
         c=Hash[columns.zip(b)]
         # byebugra
         Sr.create(c)
         # byebug
      }
      Sr.pivot
    end

  task import_2016: :environment do
      require 'open-uri'
      require 'csvreader'
      require 'byebug'
      require 'csv'
  # Sr.delete_all
  web3 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2016-clean.txt'){|f| f.read}

  things3 = web3.split(/\n/)

  columns = %i[case_number sr_location county district neighborhood tax_id
     trash_quad recycle_quad trash_day heavy_trash_day recycle_day
      key_map management_district department division sr_type queue
       sla status sr_create_date due_date date_closed overdue title
        x y latitude longitude channel_type created_at updated_at]

   things3.each {|sr|
       # byebug
       b=sr.split('|')
       c=Hash[columns.zip(b)]
       # byebugra
       Sr.create(c)
       # byebug
    }
    Sr.pivot
    end

    task import_sr_2011_2016: :environment do
        require 'open-uri'
        require 'csvreader'
        require 'byebug'
        require 'csv'
    # Sr.delete_all
    web3 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2016-clean.txt'){|f| f.read}

    things3 = web3.split(/\n/)

    columns = %i[case_number sr_location county district neighborhood tax_id
       trash_quad recycle_quad trash_day heavy_trash_day recycle_day
        key_map management_district department division sr_type queue
         sla status sr_create_date due_date date_closed overdue title
          x y latitude longitude channel_type created_at updated_at]

     things3.each {|sr|
         # byebug
         b=sr.split('|')
         c=Hash[columns.zip(b)]
         # byebugra
         Sr.create(c)
         # byebug
      }
    web4 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2013-clean.txt'){|f| f.read}
    web5 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2014-clean.txt'){|f| f.read}
    web6 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2015-clean.txt'){|f| f.read}
    things4 = web4.split(/\n/)
    things5 = web5.split(/\n/)
    things6 = web6.split(/\n/)

    colSr.umns = %i[case_number sr_location county district neighborhood tax_id
       trash_quad recycle_quad trash_day heavy_trash_day recycle_day
        key_map management_district department division sr_type queue
         sla status sr_create_date due_date date_closed overdue title
          x y latitude longitude channel_type created_at updated_at]

    things4.each {|sr|
              # byebug
              b=sr.split('|')
              c=Hash[columns.zip(b)]
              # byebugra
              Sr.create(c)
              # byebug
           }

    things5.each {|sr|
        # byebug
        b=sr.split('|')
        c=Hash[columns.zip(b)]
        # byebug
        Sr.create(c)
        # byebug
     }
     things6.each {|sr|
         # byebug
         b=sr.split('|')
         c=Hash[columns.zip(b)]
         # byebugra
         Sr.create(c)
         # byebug
      }
      # Sr.delete_all
    web7 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2011-clean.txt'){|f| f.read}
    web8 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2012-clean.txt'){|f| f.read}
    things7 = web7.split(/\n/)
    things8 = web8.split(/\n/)
    # things3 = web3.split(/\n/)

    columns = %i[case_number sr_location county district neighborhood tax_id
       trash_quad recycle_quad trash_day heavy_trash_day recycle_day
        key_map management_district department division sr_type queue
         sla status sr_create_date due_date date_closed overdue title
          x y latitude longitude channel_type created_at updated_at]

    things7.each {|sr|
              # byebug
              b=sr.split('|')
              c=Hash[columns.zip(b)]
              # byebugra
              Sr.create(c)
              # byebug
           }

    things8.each {|sr|
        # byebug
        b=sr.split('|')
        c=Hash[columns.zip(b)]
        # byebug
        Sr.create(c)
        # byebug
     }
    Sr.pivot
  end
  task import_all_data_sr: :environment do
    #download all data with resolution time from City BI
    require 'csv'
    start= Date.parse('2020-01-01')
    due= Date.parse('2020-06-30')#UPDATE MONTHLY
    Sr.where(department:'SWM Solid Waste Management').
    where('created_at >= ? AND created_at <= ?',start,due).delete_all
    columns = %i[CASE_NUMBER	SR_LOCATION	COUNTY	CLIENT
      STREET_NUM	CLIENT_STREET	CITY	STATE	ZIP	PHONE_NUMBER
      EMAIL_ADDRESS	DISTRICT	NEIGHBORHOOD	TAX_ID
      GARBAGE_ROUTE	GARBAGE_DAY1	GARBAGE_QUAD	RECYCLE_DAY1
      RECYCLE_ROUTE	RECYCLE_QUAD	HEAVY_TRASH_DAY	HEAVY_TRASH_QUAD
      KEY_MAP	MANAGEMENT_DISTRICT	SR_OWNER	SR_CREATOR	DEPARTMENT
      DIVISION	SR_TYPE	QUEUE	SLA	STATUS	SR_CREATE_DATE	DUE_DATE
      DATE_CLOSED	RESOLUTION_TIME	OVERDUE]

    CSV.foreach("C:/Users/e128289/Downloads/SWM All Data with Resolution Time-January2020.csv",
       { encoding: "iso-8859-1:utf-8",
          headers: true,
          header_converters: :symbol,converters: :all}) {|row|
      # binding.pry
     Sr.create(row.to_hash)
      # binding.pry
    }
    CSV.foreach("C:/Users/e128289/Downloads/SWM All Data with Resolution Time-February2020.csv",
       { encoding: "iso-8859-1:utf-8",
          headers: true,
          header_converters: :symbol,converters: :all}) {|row|
      # binding.pry
     Sr.create(row.to_hash)
      # binding.pry
    }
    CSV.foreach("C:/Users/e128289/Downloads/SWM All Data with Resolution Time-March2020.csv",
       { encoding: "iso-8859-1:utf-8",
          headers: true,
          header_converters: :symbol,converters: :all}) {|row|
      # binding.pry
     Sr.create(row.to_hash)
      # binding.pry
    }
    CSV.foreach("C:/Users/e128289/Downloads/SWM All Data with Resolution Time-April2020.csv",
       { encoding: "iso-8859-1:utf-8",
          headers: true,
          header_converters: :symbol,converters: :all}) {|row|
      # binding.pry
     Sr.create(row.to_hash)
      # binding.pry
    }
    CSV.foreach("C:/Users/e128289/Downloads/SWM All Data with Resolution Time-May2020.csv",
       { encoding: "iso-8859-1:utf-8",
          headers: true,
          header_converters: :symbol,converters: :all}) {|row|
      # binding.pry
     Sr.create(row.to_hash)
      # binding.pry
    }

    CSV.foreach("C:/Users/e128289/Downloads/SWM All Data with Resolution Time-June2020.csv",
       { encoding: "iso-8859-1:utf-8",
          headers: true,
          header_converters: :symbol,converters: :all}) {|row|
      # binding.pry
     Sr.create(row.to_hash)
      # binding.pry
    }
    Sr.pivot
  end

  task import_monthly_cases: :environment do
    web1 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-monthly-clean.txt'){|f| f.read}
    things1 = web1.split(/n/)
    columns = %i[case_number sr_location county district neighborhood tax_id
       trash_quad recycle_quad trash_day heavy_trash_day recycle_day
        key_map management_district department division sr_type queue
         sla status sr_create_date due_date date_closed overdue title
          x y latitude longitude channel_type created_at updated_at]

      things1.each {|sr|
              # byebug
              b=sr.split('|')
              c=Hash[columns.zip(b)]
              # byebugra
              Sr.create(c)
              # byebug
      }
      Sr.pivot
  end
  task import_cart_cases: :environment  do
    # require 'csv'
    # for City of Houston Container Problems by Residents Service Request download
    # 1. Before Running Report: In CSV File, rename attribute from "type" to "service_type"
    # encoding:iso-8859-1:utf-8
    require 'csv'
    CSV.foreach("C:/Users/e128289/Documents/container_problem3.csv",
       {encoding: "iso-8859-1:utf-8",
          headers: %w[sr_number client service_location status client_str_no
             client_str_name client_zip_code phone_number email_address
              create_date due_date closed_date overdue agent_name
               super_neighborhood tax_id service_area district key_map
                management_district garbage_route garbage_day garbage_quad
                 recycle_route recycle_day recycle_quad heavy_trash_day
                  heavy_trash_day subject reason service_type queue sla
                   container_problem container_damage case_note
                    resolution_comment channel_type other_description title
                     x y latitude longitude tax_id1],
                      header_converters: :symbol, converters: :all}) {|row|
      # binding.pry
      Cart.create(row.to_hash)
       # binding.pry
    }
    Cart.carts_compliance_list
  end
  task cart_cases: :environment  do
    # require 'csv'
    # for City of Houston Container Problems by Residents Service Request download
    # 1. Before Running Report: In CSV File, rename attribute from "type" to "service_type"
    # encoding:iso-8859-1:utf-8
    #Last date of download: June 15, 2020
    require 'csv'
    Cart.delete_all
    CSV.foreach("C:/Users/e128289/Downloads/SWM Container Problem-2020-Jan2020-June152020.csv",
       {encoding: "iso-8859-1:utf-8",
          headers: %w[sr_number client service_location status client_str_no
             client_str_name client_zip_code phone_number email_address
              create_date due_date closed_date overdue agent_name
               super_neighborhood tax_id service_area district key_map
                management_district garbage_route garbage_day garbage_quad
                 recycle_route recycle_day recycle_quad heavy_trash_day
                  heavy_trash_day subject reason service_type queue sla
                   container_problem container_damage case_note
                    resolution_comment channel_type other_description title
                     x y latitude longitude tax_id1],
                      header_converters: :symbol, converters: :all}) {|row|
      # binding.pry
      Cart.create(row.to_hash)
      # binding.pry
    }
    CSV.foreach("C:/Users/e128289/Downloads/SWM Container Problem-2020-July2019-December2019.csv",
       {encoding: "iso-8859-1:utf-8",
          headers: %w[sr_number client service_location status client_str_no
             client_str_name client_zip_code phone_number email_address
              create_date due_date closed_date overdue agent_name
               super_neighborhood tax_id service_area district key_map
                management_district garbage_route garbage_day garbage_quad
                 recycle_route recycle_day recycle_quad heavy_trash_day
                  heavy_trash_day subject reason service_type queue sla
                   container_problem container_damage case_note
                    resolution_comment channel_type other_description title
                     x y latitude longitude tax_id1],
                      header_converters: :symbol, converters: :all}) {|row|
      # binding.pry
      Cart.create(row.to_hash)
      # binding.pry
    }
    CSV.foreach("C:/Users/e128289/Downloads/SWM Container Problem-2020-Jan2019-June2019.csv",
       {encoding: "iso-8859-1:utf-8",
          headers: %w[sr_number client service_location status client_str_no
             client_str_name client_zip_code phone_number email_address
              create_date due_date closed_date overdue agent_name
               super_neighborhood tax_id service_area district key_map
                management_district garbage_route garbage_day garbage_quad
                 recycle_route recycle_day recycle_quad heavy_trash_day
                  heavy_trash_day subject reason service_type queue sla
                   container_problem container_damage case_note
                    resolution_comment channel_type other_description title
                     x y latitude longitude tax_id1],
                      header_converters: :symbol, converters: :all}) {|row|
      # binding.pry
      Cart.create(row.to_hash)
      # binding.pry
    }
    CSV.foreach("C:/Users/e128289/Downloads/SWM Container Problem-2020-May2018-Dec2018.csv",
       {encoding: "iso-8859-1:utf-8",
          headers: %w[sr_number client service_location status client_str_no
             client_str_name client_zip_code phone_number email_address
              create_date due_date closed_date overdue agent_name
               super_neighborhood tax_id service_area district key_map
                management_district garbage_route garbage_day garbage_quad
                 recycle_route recycle_day recycle_quad heavy_trash_day
                  heavy_trash_day subject reason service_type queue sla
                   container_problem container_damage case_note
                    resolution_comment channel_type other_description title
                     x y latitude longitude tax_id1],
                      header_converters: :symbol, converters: :all}) {|row|
      # binding.pry
      Cart.create(row.to_hash)
      # binding.pry
    }
    Cart.carts_compliance_list
  end

  task yr_2019_to_present_requests: :environment do
    start = Date.parse('2017-07-01')
    due = DateTime.now
    Sr.
    where('sr_create_date >= ? AND sr_create_date <=?',start, due).
      where(department: 'SWM Solid Waste Management').
      delete_all
        columns = %i[CASE_NUMBER	SR_LOCATION	COUNTY	CLIENT
          STREET_NUM	CLIENT_STREET	CITY	STATE	ZIP	PHONE_NUMBER
          EMAIL_ADDRESS	DISTRICT	NEIGHBORHOOD	TAX_ID
          GARBAGE_ROUTE	GARBAGE_DAY1	GARBAGE_QUAD	RECYCLE_DAY1
          RECYCLE_ROUTE	RECYCLE_QUAD	HEAVY_TRASH_DAY	HEAVY_TRASH_QUAD
          KEY_MAP	MANAGEMENT_DISTRICT	SR_OWNER	SR_CREATOR	DEPARTMENT
          DIVISION	SR_TYPE	QUEUE	SLA	STATUS	SR_CREATE_DATE	DUE_DATE
          DATE_CLOSED	RESOLUTION_TIME	OVERDUE]
                CSV.foreach("C:/Users/e128289/Downloads/SWM All Data with Resolution Time-Jan12019-Dec31-2019.csv",
                     { encoding: "iso-8859-1:utf-8",
                        headers: true,
                        header_converters: :symbol,converters: :all}) {|row|
                    # binding.pry
                   Sr.create(row.to_hash)
                    # binding.pry
                  }
                CSV.foreach("C:/Users/e128289/Downloads/All Data with Resolution Time-Jan1st2020-June19-2020.csv",
                       { encoding: "iso-8859-1:utf-8",
                          headers: true,
                          header_converters: :symbol,converters: :all}) {|row|
                      # binding.pry
                     Sr.create(row.to_hash)
                      # binding.pry
                    }
                CSV.foreach("C:/Users/e128289/Downloads/SWM All Data with Resolution Time-June20-2020-June212021.csv",
                         { encoding: "iso-8859-1:utf-8",
                            headers: true,
                            header_converters: :symbol,converters: :all}) {|row|
                        # binding.pry
                       Sr.create(row.to_hash)
                        # binding.pry
                    }
  end
end

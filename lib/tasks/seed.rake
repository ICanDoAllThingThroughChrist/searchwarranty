namespace :seed do
  desc "TODO"
  task import_sr: :environment do
    require 'open-uri'
    require 'csvreader'
    require 'byebug'
    require 'csv'
    Sr.delete_all
    web2 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2019-clean.txt'){|f| f.read}
    web1 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-monthly-clean.txt'){|f| f.read}
    things1 = web1.split(/\n/)
    things2 = web2.split(/\n/)

    columns = %i[case_number sr_location county district neighborhood tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day key_map management_district department division sr_type queue sla status sr_create_date due_date date_closed overdue title x y latitude longitude channel_type created_at updated_at]

    things2.each {|sr|
        # byebug
        b=sr.split('|')
        c=Hash[columns.zip(b)]
        # byebug
        Sr.create(c)
        # byebug
     }
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
  task import_all_data_sr: :environment do
    #download all data with resolution time from City BI
    require 'csv'
    columns = %i[CASE_NUMBER	SR_LOCATION	COUNTY	CLIENT	STREET_NUM	CLIENT_STREET	CITY	STATE	ZIP	PHONE_NUMBER	EMAIL_ADDRESS	DISTRICT	NEIGHBORHOOD	TAX_ID	GARBAGE_ROUTE	GARBAGE_DAY1	GARBAGE_QUAD	RECYCLE_DAY1	RECYCLE_ROUTE	RECYCLE_QUAD	HEAVY_TRASH_DAY	HEAVY_TRASH_QUAD	KEY_MAP	MANAGEMENT_DISTRICT	SR_OWNER	SR_CREATOR	DEPARTMENT	DIVISION	SR_TYPE	QUEUE	SLA	STATUS	SR_CREATE_DATE	DUE_DATE	DATE_CLOSED	RESOLUTION_TIME	OVERDUE]
    CSV.foreach("C:/Users/e128289/Documents/SWM All Data with Resolution Time.csv", { encoding: "iso-8859-1:utf-8", headers: true, header_converters: :symbol, converters: :all}) {|row|
      # binding.pry
     Sr.create(row.to_hash)
      # binding.pry
    }
    Sr.pivot
  end
  task import_cart_cases: :environment  do
    # require 'csv'
    # for City of Houston Container Problems by Residents Service Request download
    # 1. Before Running Report: In CSV File, rename attribute from "type" to "service_type"
    # 2. Delete all Carts Related Records from rails DB;
    # encoding:iso-8859-1:utf-8
    require 'csv'
    Cart.delete_all
    CSV.foreach("C:/Users/e128289/Documents/container_problem1.csv", {encoding: "iso-8859-1:utf-8", headers: %w[sr_number client service_location status client_str_no client_str_name client_zip_code phone_number email_address create_date due_date closed_date overdue agent_name super_neighborhood tax_id service_area district key_map management_district garbage_route garbage_day garbage_quad recycle_route recycle_day recycle_quad heavy_trash_day heavy_trash_day subject reason service_type queue sla container_problem container_damage case_note resolution_comment channel_type other_description title x y latitude longitude tax_id1], header_converters: :symbol, converters: :all}) {|row|
      # binding.pry
      Cart.create(row.to_hash)
      # binding.pry
    }
    CSV.foreach("C:/Users/e128289/Documents/container_problem2.csv", {encoding: "iso-8859-1:utf-8", headers: %w[sr_number client service_location status client_str_no client_str_name client_zip_code phone_number email_address create_date due_date closed_date overdue agent_name super_neighborhood tax_id service_area district key_map management_district garbage_route garbage_day garbage_quad recycle_route recycle_day recycle_quad heavy_trash_day heavy_trash_day subject reason service_type queue sla container_problem container_damage case_note resolution_comment channel_type other_description title x y latitude longitude tax_id1], header_converters: :symbol, converters: :all}) {|row|
      # binding.pry
      Cart.create(row.to_hash)
      # binding.pry
    }
    Cart.carts_compliance_list
    # "run Cart.carts_compliance_list in Rails Console"
  end
end

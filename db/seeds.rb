# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'csv'
#
#
# for City of Houston BI Data Collection
# a = Hash[columns.to_hash]
# require 'csv'
# columns = %i[CASE_NUMBER	SR_LOCATION	COUNTY	CLIENT	STREET_NUM	CLIENT_STREET	CITY	STATE	ZIP	PHONE_NUMBER	EMAIL_ADDRESS	DISTRICT	NEIGHBORHOOD	TAX_ID	GARBAGE_ROUTE	GARBAGE_DAY1	GARBAGE_QUAD	RECYCLE_DAY1	RECYCLE_ROUTE	RECYCLE_QUAD	HEAVY_TRASH_DAY	HEAVY_TRASH_QUAD	KEY_MAP	MANAGEMENT_DISTRICT	SR_OWNER	SR_CREATOR	DEPARTMENT	DIVISION	SR_TYPE	QUEUE	SLA	STATUS	SR_CREATE_DATE	DUE_DATE	DATE_CLOSED	RESOLUTION_TIME	OVERDUE]
# CSV.foreach("C:/Users/e128289/Documents/SWM All Data with Resolution Time.csv", { encoding: "iso-8859-1:utf-8", headers: true, header_converters: :symbol, converters: :all}) {|row|
#   # binding.pry
#  Sr.create(row.to_hash)
#   # binding.pry
# }
# Sr.pivot

# # require 'csv'
# For City of Houston sw3p environmental assignments data download
# CSV.foreach("C:/Users/e128289/Documents/Assignments-Track2.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) {|row|
#    # binding.pry
#  Assignment.create(row.to_hash)
#   # binding.pry
# # }
# # #
# require 'csv'
# # for City of Houston Container Problems by Residents Service Request download
# 1. Before Running Report: In CSV File, rename attribute from "type" to "service_type"
# 2. Delete all Carts Related Records from rails DB;
# encoding:iso-8859-1:utf-8
require 'csv'
CSV.foreach("C:/Users/e128289/Documents/containers-problems.csv", {encoding: "iso-8859-1:utf-8", headers: %w[sr_number client service_location status client_str_no client_str_name client_zip_code phone_number email_address create_date due_date closed_date overdue agent_name super_neighborhood tax_id service_area district key_map management_district garbage_route garbage_day garbage_quad recycle_route recycle_day recycle_quad heavy_trash_day heavy_trash_day subject reason service_type queue sla container_problem container_damage case_note resolution_comment channel_type other_description title x y latitude longitude tax_id1], header_converters: :symbol, converters: :all}) {|row|
  # binding.pry
  Cart.create(row.to_hash)
  # binding.pry
}
Cart.carts_compliance_list
# "run Cart.carts_compliance_list in Rails Console"


# # CSV.foreach("C:/Users/e128289/Documents/1-1-2017-to-7-1-2017-inventory-requests.csv", {encoding: "iso-8859-1:utf-8", headers: %w[SR_Number	Client	Service_Location	Status	Phone_Number	Client_Str_No	Client_Str_Name	Client_Zip_Code	Email_Address	Create_Date	Due_Date	Closed_Date	Overdue	Agent_Name	Super_Neighborhood	service_area	District	Key_Map	Management_District	tax_id	GARBAGE_ROUTE	GARBAGE_DAY	GARBAGE_QUAD	RECYCLE_ROUTE	RECYCLE_DAY	RECYCLE_QUAD	HEAVY_TRASH_DAY	HEAVY_TRASH_QUAD	Subject	Reason	service_type	Queue	SLA	Channel_Type	Case_Note	Resolution_Comment	LATITUDE	LONGITUDE	x	y], header_converters: :symbol, converters: :all}) {|row|
# #   # binding.pry
# #   Cart.create(row.to_hash)
# #   # binding.pry
# # }
# # Cart.unique
# # # "run Cart.unique in Rails Console"
# # CSV.foreach("C:/Users/e128289/Documents/7-1-17-to-12-30-17-inventory-requests.csv", {encoding: "iso-8859-1:utf-8", headers: %w[SR_Number	Client	Service_Location	Status	Phone_Number	Client_Str_No	Client_Str_Name	Client_Zip_Code	Email_Address	Create_Date	Due_Date	Closed_Date	Overdue	Agent_Name	Super_Neighborhood	service_area	District	Key_Map	Management_District	tax_id	GARBAGE_ROUTE	GARBAGE_DAY	GARBAGE_QUAD	RECYCLE_ROUTE	RECYCLE_DAY	RECYCLE_QUAD	HEAVY_TRASH_DAY	HEAVY_TRASH_QUAD	Subject	Reason	service_type	Queue	SLA	Channel_Type	Case_Note	Resolution_Comment	LATITUDE	LONGITUDE	x	y], header_converters: :symbol, converters: :all}) {|row|
# #   # binding.pry
# #   Cart.create(row.to_hash)
# #   # binding.pry
# # }
# # Cart.unique
# # # "run Cart.unique in Rails Console"
# # CSV.foreach("C:/Users/e128289/Documents/1-1-2018-to-6-30-118-inventory-requests.csv", {encoding: "iso-8859-1:utf-8", headers: %w[SR_Number	Client	Service_Location	Status	Phone_Number	Client_Str_No	Client_Str_Name	Client_Zip_Code	Email_Address	Create_Date	Due_Date	Closed_Date	Overdue	Agent_Name	Super_Neighborhood	service_area	District	Key_Map	Management_District	tax_id	GARBAGE_ROUTE	GARBAGE_DAY	GARBAGE_QUAD	RECYCLE_ROUTE	RECYCLE_DAY	RECYCLE_QUAD	HEAVY_TRASH_DAY	HEAVY_TRASH_QUAD	Subject	Reason	service_type	Queue	SLA	Channel_Type	Case_Note	Resolution_Comment	LATITUDE	LONGITUDE	x	y], header_converters: :symbol, converters: :all}) {|row|
# #   # binding.pry
# #   Cart.create(row.to_hash)
# #   # binding.pry
# # }
# # Cart.unique
# # # "run Cart.unique in Rails Console"
# # CSV.foreach("C:/Users/e128289/Documents/6-30-18-to12-30-18-Inventory-Requests.csv", {encoding: "iso-8859-1:utf-8", headers: %w[SR_Number	Client	Service_Location	Status	Phone_Number	Client_Str_No	Client_Str_Name	Client_Zip_Code	Email_Address	Create_Date	Due_Date	Closed_Date	Overdue	Agent_Name	Super_Neighborhood	service_area	District	Key_Map	Management_District	tax_id	GARBAGE_ROUTE	GARBAGE_DAY	GARBAGE_QUAD	RECYCLE_ROUTE	RECYCLE_DAY	RECYCLE_QUAD	HEAVY_TRASH_DAY	HEAVY_TRASH_QUAD	Subject	Reason	service_type	Queue	SLA	Channel_Type	Case_Note	Resolution_Comment	LATITUDE	LONGITUDE	x	y], header_converters: :symbol, converters: :all}) {|row|
# #   # binding.pry
# #   Cart.create(row.to_hash)
# #   # binding.pry
# # }
# # Cart.unique
# # CSV.foreach("C:/Users/e128289/Documents/12-30-18-to-7-11-19-Inventory-Requests.csv", {encoding: "iso-8859-1:utf-8", headers: %w[SR_Number	Client	Service_Location	Status	Phone_Number	Client_Str_No	Client_Str_Name	Client_Zip_Code	Email_Address	Create_Date	Due_Date	Closed_Date	Overdue	Agent_Name	Super_Neighborhood	service_area	District	Key_Map	Management_District	tax_id	GARBAGE_ROUTE	GARBAGE_DAY	GARBAGE_QUAD	RECYCLE_ROUTE	RECYCLE_DAY	RECYCLE_QUAD	HEAVY_TRASH_DAY	HEAVY_TRASH_QUAD	Subject	Reason	service_type	Queue	SLA	Channel_Type	Case_Note	Resolution_Comment	LATITUDE	LONGITUDE	x	y], header_converters: :symbol, converters: :all}) {|row|
# #   # binding.pry
# #   Cart.create(row.to_hash)
# #   # binding.pry
# # }
# # Cart.unique
# # CSV.foreach("C:/Users/e128289/Documents/07-12-19-to-2-27-20-Inventory-Requests.csv", {encoding: "iso-8859-1:utf-8", headers: %w[SR_Number	Client	Service_Location	Status	Phone_Number	Client_Str_No	Client_Str_Name	Client_Zip_Code	Email_Address	Create_Date	Due_Date	Closed_Date	Overdue	Agent_Name	Super_Neighborhood	service_area	District	Key_Map	Management_District	tax_id	GARBAGE_ROUTE	GARBAGE_DAY	GARBAGE_QUAD	RECYCLE_ROUTE	RECYCLE_DAY	RECYCLE_QUAD	HEAVY_TRASH_DAY	HEAVY_TRASH_QUAD	Subject	Reason	service_type	Queue	SLA	Channel_Type	Case_Note	Resolution_Comment	LATITUDE	LONGITUDE	x	y], header_converters: :symbol, converters: :all}) {|row|
# #   # binding.pry
# #   Cart.create(row.to_hash)
# #   # binding.pry
# # }
# # Cart.unique
# CSV.foreach("C:/Users/e128289/Documents/July18-July19.csv", {encoding: "iso-8859-1:utf-8", headers: %w[sr_number	service_type	CLIENT	service_location	Tax_ID	case_note	GARBAGE_QUAD
# ], header_converters: :symbol, converters: :all}) {|row|
#   # binding.pry
#   Cart.create(row.to_hash)
#   # binding.pry
# }
# Cart.unique
# CSV.foreach("C:/Users/e128289/Documents/July19-Feb20.csv", {encoding: "iso-8859-1:utf-8", headers: %w[sr_number	service_type	CLIENT	service_location	Tax_ID	case_note	GARBAGE_QUAD
# ], header_converters: :symbol, converters: :all}) {|row|
#   # binding.pry
#   Cart.create(row.to_hash)
#   # binding.pry
# }
# Cart.unique
# CSV.foreach("C:/Users/e128289/Documents/Jan2017-July17.csv", {encoding: "iso-8859-1:utf-8", headers: %w[sr_number	service_type	CLIENT	service_location	Tax_ID	case_note	GARBAGE_QUAD
# ], header_converters: :symbol, converters: :all}) {|row|
#   # binding.pry
#   Cart.create(row.to_hash)
#   # binding.pry
# }
# Cart.unique
# CSV.foreach("C:/Users/e128289/Documents/July17-July18.csv", {encoding: "iso-8859-1:utf-8", headers: %w[sr_number	service_type	CLIENT	service_location	Tax_ID	case_note	GARBAGE_QUAD
# ], header_converters: :symbol, converters: :all}) {|row|
#   # binding.pry
#   Cart.create(row.to_hash)
#   # binding.pry
# }
# Cart.unique

# For Spatial Join Class Data Import
File.open("C:/Users/e128289/Documents/NoQuadNotOverdue.txt").readlines.each {|line|
binding.pry
new_line=line.chomp
new_line.split(",")
}
# CSV.foreach("C:/Users/e128289/Documents/.csv", {encoding: "iso-8859-1:utf-8", headers: %w[sr_number	service_type	CLIENT	service_location	Tax_ID	case_note	GARBAGE_QUAD
# ], header_converters: :symbol, converters: :all}) {|row|
#   # binding.pry
#   Cart.create(row.to_hash)
#   # binding.pry
# }
# Cart.unique

# require 'open-uri'
# require 'csvreader'
# require 'byebug'
# require 'csv'
# web2 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2019-clean.txt'){|f| f.read}
# web1 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-monthly-clean.txt'){|f| f.read}
# things1 = web1.split(/\n/)
# things2 = web2.split(/\n/)
#
# columns = %i[case_number sr_location county district neighborhood tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day key_map management_district department division sr_type queue sla status sr_create_date due_date date_closed overdue title x y latitude longitude channel_type created_at updated_at]
#
# things2.each {|sr|
#     # byebug
#     b=sr.split('|')
#     c=Hash[columns.zip(b)]
#     # byebug
#     Sr.create(c)
#     # byebug
#  }
#  things1.each {|sr|
#      # byebug
#      b=sr.split('|')
#      c=Hash[columns.zip(b)]
#      # byebugra
#      Sr.create(c)
#      # byebug
#   }
#
# Sr.pivot

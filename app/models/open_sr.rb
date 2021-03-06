class OpenSr < ApplicationRecord
  def self.all_quads_open_sr_hvy_trash
    headers = %w[id case_number sr_location county district
      neighborhood tax_id trash_quad recycle_quad trash_day heavy_trash_day
      recycle_day key_map management_district department division sr_type
      queue sla status sr_create_date due_date date_closed overdue title
      x y latitude longitude channel_type created_at updated_at field1
      field2 client garbage_route heavy_trash_quad sr_owner sr_creator
      resolve_days street_num client_street city state zip phone_number
      email_address garbage_day1 garbage_quad recycle_day1 recycle_route
      resolution_time expression ne_overdue ne_not_overdue ne_sr_total
      nw_overdue nw_not_overdue nw_sr_total se_overdue se_not_overdue
      se_sr_total sw_overdue sw_not_overdue sw_sr_total quad_status tally]
      CSV.open("All_quad_hvy_trash_open_list.csv", "wb",
        write_headers: true, headers: headers) { |csv|
    Sr.
    select('distinct case_number').
    where(department:'SWM Solid Waste Management',
        status:'Open',
         sr_type:'Missed Heavy Trash Pickup').
         pluck(:id, :case_number,
           :sr_location, :county,:district, :neighborhood, :tax_id,
           :trash_quad, :recycle_quad, :trash_day, :heavy_trash_day,
           :recycle_day, :key_map, :management_district, :department,
           :division, :sr_type, :queue, :sla, :status, :sr_create_date,
           :due_date, :date_closed, :overdue, :title, :x, :y, :latitude,
           :longitude, :channel_type, :created_at, :updated_at, :field1,
           :field2, :client, :garbage_route, :heavy_trash_quad, :sr_owner,
           :sr_creator, :resolve_days, :street_num, :client_street,
           :city, :state, :zip, :phone_number, :email_address,
           :garbage_day1, :garbage_quad, :recycle_day1, :recycle_route,
           :resolution_time, :expression, :ne_overdue, :ne_not_overdue,
           :ne_sr_total, :nw_overdue, :nw_not_overdue, :nw_sr_total,
           :se_overdue, :se_not_overdue, :se_sr_total, :sw_overdue,
           :sw_not_overdue, :sw_sr_total, :quad_status, :tally).
           each { |row|
             csv << row
           }
         }
  end
  def self.nw_open_sr_hvy_trash
    headers = %w[id case_number sr_location county district
      neighborhood tax_id trash_quad recycle_quad trash_day heavy_trash_day
      recycle_day key_map management_district department division sr_type
      queue sla status sr_create_date due_date date_closed overdue title
      x y latitude longitude channel_type created_at updated_at field1
      field2 client garbage_route heavy_trash_quad sr_owner sr_creator
      resolve_days street_num client_street city state zip phone_number
      email_address garbage_day1 garbage_quad recycle_day1 recycle_route
      resolution_time expression ne_overdue ne_not_overdue ne_sr_total
      nw_overdue nw_not_overdue nw_sr_total se_overdue se_not_overdue
      se_sr_total sw_overdue sw_not_overdue sw_sr_total quad_status tally]
      CSV.open("NW_Hvy_trash_open_list.csv", "wb",
        write_headers: true, headers: headers) { |csv|
    Sr.
    select('distinct case_number').
    where(department:'SWM Solid Waste Management',
       trash_quad:'NW',
        status:'Open',
         sr_type:'Missed Heavy Trash Pickup').
         pluck(:id, :case_number,
           :sr_location, :county,:district, :neighborhood, :tax_id,
           :trash_quad, :recycle_quad, :trash_day, :heavy_trash_day,
           :recycle_day, :key_map, :management_district, :department,
           :division, :sr_type, :queue, :sla, :status, :sr_create_date,
           :due_date, :date_closed, :overdue, :title, :x, :y, :latitude,
           :longitude, :channel_type, :created_at, :updated_at, :field1,
           :field2, :client, :garbage_route, :heavy_trash_quad, :sr_owner,
           :sr_creator, :resolve_days, :street_num, :client_street,
           :city, :state, :zip, :phone_number, :email_address,
           :garbage_day1, :garbage_quad, :recycle_day1, :recycle_route,
           :resolution_time, :expression, :ne_overdue, :ne_not_overdue,
           :ne_sr_total, :nw_overdue, :nw_not_overdue, :nw_sr_total,
           :se_overdue, :se_not_overdue, :se_sr_total, :sw_overdue,
           :sw_not_overdue, :sw_sr_total, :quad_status, :tally).
           each { |row|
             csv << row
           }
         }
  end
  def self.ne_open_sr_hvy_trash
    headers = %w[id case_number sr_location county district
      neighborhood tax_id trash_quad recycle_quad trash_day heavy_trash_day
      recycle_day key_map management_district department division sr_type
      queue sla status sr_create_date due_date date_closed overdue title
      x y latitude longitude channel_type created_at updated_at field1
      field2 client garbage_route heavy_trash_quad sr_owner sr_creator
      resolve_days street_num client_street city state zip phone_number
      email_address garbage_day1 garbage_quad recycle_day1 recycle_route
      resolution_time expression ne_overdue ne_not_overdue ne_sr_total
      nw_overdue nw_not_overdue nw_sr_total se_overdue se_not_overdue
      se_sr_total sw_overdue sw_not_overdue sw_sr_total quad_status tally]
      CSV.open("NE_Hvy_trash_open_list.csv", "wb",
        write_headers: true, headers: headers) { |csv|
    Sr.
    select('distinct case_number').
    where(department:'SWM Solid Waste Management',
       trash_quad:'NE',
        status:'Open',
         sr_type:'Missed Heavy Trash Pickup').
         pluck(:id, :case_number,
           :sr_location, :county,:district, :neighborhood, :tax_id,
           :trash_quad, :recycle_quad, :trash_day, :heavy_trash_day,
           :recycle_day, :key_map, :management_district, :department,
           :division, :sr_type, :queue, :sla, :status, :sr_create_date,
           :due_date, :date_closed, :overdue, :title, :x, :y, :latitude,
           :longitude, :channel_type, :created_at, :updated_at, :field1,
           :field2, :client, :garbage_route, :heavy_trash_quad, :sr_owner,
           :sr_creator, :resolve_days, :street_num, :client_street,
           :city, :state, :zip, :phone_number, :email_address,
           :garbage_day1, :garbage_quad, :recycle_day1, :recycle_route,
           :resolution_time, :expression, :ne_overdue, :ne_not_overdue,
           :ne_sr_total, :nw_overdue, :nw_not_overdue, :nw_sr_total,
           :se_overdue, :se_not_overdue, :se_sr_total, :sw_overdue,
           :sw_not_overdue, :sw_sr_total, :quad_status, :tally).
           each { |row|
             csv << row
           }
         }
  end
  def self.sw_open_sr_hvy_trash
    headers = %w[id case_number sr_location county district
      neighborhood tax_id trash_quad recycle_quad trash_day heavy_trash_day
      recycle_day key_map management_district department division sr_type
      queue sla status sr_create_date due_date date_closed overdue title
      x y latitude longitude channel_type created_at updated_at field1
      field2 client garbage_route heavy_trash_quad sr_owner sr_creator
      resolve_days street_num client_street city state zip phone_number
      email_address garbage_day1 garbage_quad recycle_day1 recycle_route
      resolution_time expression ne_overdue ne_not_overdue ne_sr_total
      nw_overdue nw_not_overdue nw_sr_total se_overdue se_not_overdue
      se_sr_total sw_overdue sw_not_overdue sw_sr_total quad_status tally]
      CSV.open("SW_Hvy_trash_open_list.csv", "wb",
        write_headers: true, headers: headers) { |csv|
    Sr.select('distinct case_number').
    where(department:'SWM Solid Waste Management',
       trash_quad:'SW',
        status:'Open',
         sr_type:'Missed Heavy Trash Pickup').
         pluck(:id, :case_number,
           :sr_location, :county,:district, :neighborhood, :tax_id,
           :trash_quad, :recycle_quad, :trash_day, :heavy_trash_day,
           :recycle_day, :key_map, :management_district, :department,
           :division, :sr_type, :queue, :sla, :status, :sr_create_date,
           :due_date, :date_closed, :overdue, :title, :x, :y, :latitude,
           :longitude, :channel_type, :created_at, :updated_at, :field1,
           :field2, :client, :garbage_route, :heavy_trash_quad, :sr_owner,
           :sr_creator, :resolve_days, :street_num, :client_street,
           :city, :state, :zip, :phone_number, :email_address,
           :garbage_day1, :garbage_quad, :recycle_day1, :recycle_route,
           :resolution_time, :expression, :ne_overdue, :ne_not_overdue,
           :ne_sr_total, :nw_overdue, :nw_not_overdue, :nw_sr_total,
           :se_overdue, :se_not_overdue, :se_sr_total, :sw_overdue,
           :sw_not_overdue, :sw_sr_total, :quad_status, :tally).
           each { |row|
             csv << row
           }
         }
  end
  def self.se_open_sr_hvy_trash
    headers = %w[id case_number sr_location county district
      neighborhood tax_id trash_quad recycle_quad trash_day heavy_trash_day
      recycle_day key_map management_district department division sr_type
      queue sla status sr_create_date due_date date_closed overdue title
      x y latitude longitude channel_type created_at updated_at field1
      field2 client garbage_route heavy_trash_quad sr_owner sr_creator
      resolve_days street_num client_street city state zip phone_number
      email_address garbage_day1 garbage_quad recycle_day1 recycle_route
      resolution_time expression ne_overdue ne_not_overdue ne_sr_total
      nw_overdue nw_not_overdue nw_sr_total se_overdue se_not_overdue
      se_sr_total sw_overdue sw_not_overdue sw_sr_total quad_status tally]
      CSV.open("SE_Hvy_trash_open_list.csv", "wb",
        write_headers: true, headers: headers) { |csv|
    Sr.select('distinct case_number').
    where(department:'SWM Solid Waste Management',
       trash_quad:'SE',
        status:'Open',
         sr_type:'Missed Heavy Trash Pickup').
         pluck(:id, :case_number,
           :sr_location, :county,:district, :neighborhood, :tax_id,
           :trash_quad, :recycle_quad, :trash_day, :heavy_trash_day,
           :recycle_day, :key_map, :management_district, :department,
           :division, :sr_type, :queue, :sla, :status, :sr_create_date,
           :due_date, :date_closed, :overdue, :title, :x, :y, :latitude,
           :longitude, :channel_type, :created_at, :updated_at, :field1,
           :field2, :client, :garbage_route, :heavy_trash_quad, :sr_owner,
           :sr_creator, :resolve_days, :street_num, :client_street,
           :city, :state, :zip, :phone_number, :email_address,
           :garbage_day1, :garbage_quad, :recycle_day1, :recycle_route,
           :resolution_time, :expression, :ne_overdue, :ne_not_overdue,
           :ne_sr_total, :nw_overdue, :nw_not_overdue, :nw_sr_total,
           :se_overdue, :se_not_overdue, :se_sr_total, :sw_overdue,
           :sw_not_overdue, :sw_sr_total, :quad_status, :tally).
           each { |row|
             csv << row
           }
         }
  end
  def self.swMay2020_actual_due_and_closed_cases
    start= Date.parse('2020-05-01')
    due = Date.parse('2020-05-31')
    Sr.
    select('distinct case_number').
    where(status: 'Closed', department: 'SWM Solid Waste Management',
      trash_quad: 'SW',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
        'New Resident Container', 'Recycling Participation NEW',
        'Recycling Cart Repair or Replace', 'SWM Escalation',
        'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
    where("sr_create_date >= ? AND sr_create_date <= ?", start, due).
    where(overdue:[-30..-0.05]).count
  end
  def self.swMay2020_sla_due_cases
    start= Date.parse('2020-05-01')
    due = Date.parse('2020-05-31')
    Sr.
    select('distinct case_number').
    where(status: 'Closed', department: 'SWM Solid Waste Management',
      trash_quad: 'SW',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
         'New Resident Container', 'Recycling Participation NEW',
         'Recycling Cart Repair or Replace', 'SWM Escalation',
         'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
         'Add A Can','Storm Debris Collection', 'Dead Animal Collection',
         'Add A Can CANCELLATION', 'Missed Recycling Pickup',
         'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
    where("sr_create_date >= ? AND sr_create_date <= ?", start, due).count
  end
  def self.seMay2020_actual_due_and_closed_cases
    start= Date.parse('2020-05-01')
    due = Date.parse('2020-05-31')
    Sr.
    select('distinct case_number').
    where(status: 'Closed', department: 'SWM Solid Waste Management',
      trash_quad: 'SE',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
        'New Resident Container', 'Recycling Participation NEW',
        'Recycling Cart Repair or Replace', 'SWM Escalation',
        'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
    where("sr_create_date >= ? AND sr_create_date <= ?", start, due).
  where(overdue:[-30..-0.05]).count
  end
  def self.seMay2020_sla_due_cases
    start= Date.parse('2020-05-01')
    due = Date.parse('2020-05-31')
    Sr.
    select('distinct case_number').
    where(status: 'Closed', department: 'SWM Solid Waste Management',
      trash_quad: 'SE',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
         'New Resident Container', 'Recycling Participation NEW',
         'Recycling Cart Repair or Replace', 'SWM Escalation',
         'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
         'Add A Can','Storm Debris Collection', 'Dead Animal Collection',
         'Add A Can CANCELLATION', 'Missed Recycling Pickup',
         'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
    where("sr_create_date >= ? AND sr_create_date <= ?", start, due).count
  end
  def self.nwMay2020_actual_due_and_closed_cases
    start= Date.parse('2020-05-01')
    due = Date.parse('2020-05-31')
    Sr.where(status: 'Closed', department: 'SWM Solid Waste Management',
      trash_quad: 'NW',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
        'New Resident Container', 'Recycling Participation NEW',
        'Recycling Cart Repair or Replace', 'SWM Escalation',
        'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
    where("sr_create_date >= ? AND sr_create_date <= ?", start, due).
  where(overdue:[-30..-0.05]).count
  end
  def self.nwMay2020_sla_due_cases
    start= Date.parse('2020-04-01')
    due = Date.parse('2020-04-30')
    Sr.
    select('distinct case_number').
    where(status: 'Closed', department: 'SWM Solid Waste Management',
      trash_quad: 'NW',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
         'New Resident Container', 'Recycling Participation NEW',
         'Recycling Cart Repair or Replace', 'SWM Escalation',
         'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
         'Add A Can','Storm Debris Collection', 'Dead Animal Collection',
         'Add A Can CANCELLATION', 'Missed Recycling Pickup',
         'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
    where("sr_create_date >= ? AND sr_create_date <= ?", start, due).count
  end
  def self.neMay2020_actual_due_and_closed_cases
    start= Date.parse('2020-05-01')
    due = Date.parse('2020-05-31')
    Sr.
    select('distinct case_number').
    where(status: 'Closed', department: 'SWM Solid Waste Management',
      trash_quad: 'NE',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
        'New Resident Container', 'Recycling Participation NEW',
        'Recycling Cart Repair or Replace', 'SWM Escalation',
        'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
    where("sr_create_date >= ? AND sr_create_date <= ?", start, due).
    where(overdue:[-30..0]).count
  end
  def self.neApril2020_actual_due_and_closed_cases
    start= Date.parse('2020-04-01')
    due = Date.parse('2020-04-30')
    Sr.
    select('distinct case_number').
    where(status: 'Closed', department: 'SWM Solid Waste Management',
      trash_quad: 'NE',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
        'New Resident Container', 'Recycling Participation NEW',
        'Recycling Cart Repair or Replace', 'SWM Escalation',
        'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
    where("sr_create_date >= ? AND sr_create_date <= ?", start, due).
    where(overdue:[-30..0]).count
  end
  def self.neMay2020_sla_due_cases
    start= Date.parse('2020-05-01')
    due = Date.parse('2020-05-31')
    Sr.
    select('distinct case_number').
    where(status: 'Closed', department: 'SWM Solid Waste Management',
      trash_quad: 'NE',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
         'New Resident Container', 'Recycling Participation NEW',
         'Recycling Cart Repair or Replace', 'SWM Escalation',
         'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
         'Add A Can','Storm Debris Collection', 'Dead Animal Collection',
         'Add A Can CANCELLATION', 'Missed Recycling Pickup',
         'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
    where("sr_create_date >= ? AND sr_create_date <= ?", start, due).count
  end
  def self.neApril2020_sla_due_cases
    start= Date.parse('2020-04-01')
    due = Date.parse('2020-04-30')
    Sr.
    select('distinct case_number').
    where(status: 'Closed', department: 'SWM Solid Waste Management',
      trash_quad: 'NE',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
         'New Resident Container', 'Recycling Participation NEW',
         'Recycling Cart Repair or Replace', 'SWM Escalation',
         'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
         'Add A Can','Storm Debris Collection', 'Dead Animal Collection',
         'Add A Can CANCELLATION', 'Missed Recycling Pickup',
         'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
    where("sr_create_date >= ? AND sr_create_date <= ?", start, due).count
  end
  def self.seApril2020_actual_due_and_closed_cases
    start= Date.parse('2020-04-01')
    due = Date.parse('2020-04-30')
    Sr.
    select('distinct case_number').
    where(status: 'Closed', department: 'SWM Solid Waste Management',
      trash_quad: 'SE',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
        'New Resident Container', 'Recycling Participation NEW',
        'Recycling Cart Repair or Replace', 'SWM Escalation',
        'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
    where("sr_create_date >= ? AND sr_create_date <= ?", start, due).
  where(overdue:[-30..-0.05]).count
  end
  def self.seApril2020_sla_due_cases
    start= Date.parse('2020-04-01')
    due = Date.parse('2020-04-30')
    Sr.
    select('distinct case_number').
    where(status: 'Closed', department: 'SWM Solid Waste Management',
      trash_quad: 'SE',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
         'New Resident Container', 'Recycling Participation NEW',
         'Recycling Cart Repair or Replace', 'SWM Escalation',
         'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
         'Add A Can','Storm Debris Collection', 'Dead Animal Collection',
         'Add A Can CANCELLATION', 'Missed Recycling Pickup',
         'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
    where("sr_create_date >= ? AND sr_create_date <= ?", start, due).count
  end
  def self.nwApril2020_actual_due_and_closed_cases
    start= Date.parse('2020-04-01')
    due = Date.parse('2020-04-30')
    Sr.
    select('distinct case_number').
    where(status: 'Closed', department: 'SWM Solid Waste Management',
      trash_quad: 'NW',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
        'New Resident Container', 'Recycling Participation NEW',
        'Recycling Cart Repair or Replace', 'SWM Escalation',
        'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
    where("sr_create_date >= ? AND sr_create_date <= ?", start, due).
  where(overdue:[-30..-0.05]).count
  end
  def self.nwApril2020_sla_due_cases
    start= Date.parse('2020-04-01')
    due = Date.parse('2020-04-30')
    Sr.
    select('distinct case_number').
    where(status: 'Closed', department: 'SWM Solid Waste Management',
      trash_quad: 'NW',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
         'New Resident Container', 'Recycling Participation NEW',
         'Recycling Cart Repair or Replace', 'SWM Escalation',
         'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
         'Add A Can','Storm Debris Collection', 'Dead Animal Collection',
         'Add A Can CANCELLATION', 'Missed Recycling Pickup',
         'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
    where("sr_create_date >= ? AND sr_create_date <= ?", start, due).count
  end
  def self.swApril2020_actual_due_and_closed_cases
    start= Date.parse('2020-04-01')
    due = Date.parse('2020-04-30')
    Sr.
    select('distinct case_number').
    where(status: 'Closed', department: 'SWM Solid Waste Management',
      trash_quad: 'SW',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
        'New Resident Container', 'Recycling Participation NEW',
        'Recycling Cart Repair or Replace', 'SWM Escalation',
        'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
    where("sr_create_date >= ? AND sr_create_date <= ?", start, due).
    where(overdue:[-30..-0.05]).count
  end
  def self.swApril2020_sla_due_cases
    start= Date.parse('2020-04-01')
    due = Date.parse('2020-04-30')
    Sr.
    select('distinct case_number').
    where(status: 'Closed', department: 'SWM Solid Waste Management',
      trash_quad: 'SW',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
         'New Resident Container', 'Recycling Participation NEW',
         'Recycling Cart Repair or Replace', 'SWM Escalation',
         'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
         'Add A Can','Storm Debris Collection', 'Dead Animal Collection',
         'Add A Can CANCELLATION', 'Missed Recycling Pickup',
         'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
    where("sr_create_date >= ? AND sr_create_date <= ?", start, due).count
  end
  def self.delete_from_start_of_yr_to_end_of_march
    start = DateTime.parse('2020-01-01')
    due = Date.parse('2020-03-31')
    #delete records
    Sr.where("sr_create_date >=? AND sr_create_date <= ?",start, due).delete_all
  end


  def self.delete_180_days_from_now
    start_date = DateTime.now
    endDate = Date.parse('2019-01-01')
    #delete records over the last 180 calendar days
    Sr.where("sr_create_date <=? AND sr_create_date >= ?",
      start_date, endDate).delete_all
  end
  def self.daily_update_from_url
    puts "expect 16 minutes upload time to DB"
      Sr.where("sr_create_date >=? AND sr_create_date <= ?", start_date, endDate).delete_all
      web1 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-monthly-clean.txt'){|f| f.read}
      web2 = open('https://hfdapp.houstontx.gov/311/311-Public-Data-Extract-2019-clean.txt'){|f| f.read}
      things1 = web1.split(/\n/)#creates an  new array
      things2 = web2.split(/\n/)#creates an  new array

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
         Sr.pivot
    puts "thank you, daily upload process is completed"
  end
  def self.sr_create(array)
        # binding.pry
        array2_count = array.count
        counter = 1
        master_array2=[]
        while counter < array2_count
          array.each_with_index{|item, index|
            if item != nil
               array1 = item.split("|")
               master_array2.push array1
                # binding.pry
              counter = index +1
            else
              puts "#{index}"
            end
             # binding.pry
          }
          # binding.pry
          master_array_to_import = master_array2.map {|case_number, sr_location,
            county, district, neighborhood, tax_id, trash_quad, recycle_quad,
            trash_day, heavy_trash_day, recycle_day, key_map,
            management_district, department, division, sr_type, queue,
            sla, status, sr_create_date, due_date, date_closed, overdue,
            title, x, y, latitude, longitude, channel_type|
            # binding.pry
            Sr.new(case_number: case_number, sr_location: sr_location,
              county: county, district: district, neighborhood: neighborhood,
              tax_id: tax_id, trash_quad: trash_quad,
              recycle_quad: recycle_quad, trash_day: trash_day,
              heavy_trash_day: heavy_trash_day,
              recycle_day: recycle_day,key_map: key_map,
              management_district: management_district,
              department: department, division: division,
              sr_type: sr_type,queue: queue, sla: sla, status: status,
              sr_create_date: sr_create_date, due_date: due_date,
              date_closed: date_closed, overdue: overdue, title: title,
              x: x, y: y, latitude: latitude, longitude: longitude,
              channel_type: channel_type)
          # binding.pry
          }
          # binding.pry
          # puts "#{master_array_to_import}"
          # binding.pry
          Sr.import master_array_to_import
          # binding.pry
        end
  end
  # [:case_number, :sr_location, :county, :district,
  #   :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day,
  #   :heavy_trash_day,  :recycle_day,:key_map, :management_district,
  #   :department, :division, :sr_type,:queue, :sla, :status,
  #   :sr_create_date, :due_date,:date_closed, :overdue, :title,
  #   :x, :y, :latitude, :longitude,:channel_type]
def self.daily_update_from_lagan
  # require 'csv'
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
end

 def self.neMar2020_sla_cases_closed_but_updated_later
    start_date_mar_20 = Date.parse('2020-3-01')
    due_date_mar_20 = Date.parse('2020-3-31')
    Sr.select('distinct case_number').
    where("updated_at >= ? AND updated_at <= ?",
      start_date_mar_20, due_date_mar_20).
    where(date_closed: start_date_mar_20..due_date_mar_20).
    where(sr_create_date: start_date_mar_20..due_date_mar_20).
    where(due_date: start_date_mar_20..due_date_mar_20).
    where(department: 'SWM Solid Waste Management',
       trash_quad: 'NE',
       sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
         'New Resident Container', 'Recycling Participation NEW',
         'Recycling Cart Repair or Replace', 'SWM Escalation',
         'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
         'Add A Can', 'Storm Debris Collection',
         'Dead Animal Collection','Add A Can CANCELLATION',
         'Missed Recycling Pickup','Personnel or Vehicle Complaint',
         'Physically Challenged Pickup']).
          count
  end
  def self.neMar2020_sla_due_cases
    start_date_mar_20 = Date.parse('2020-3-01')
    due_date_mar_20 = Date.parse('2020-3-31')
    Sr.select('distinct case_number').
    where("sr_create_date >= ? AND sr_create_date <= ?",
       start_date_mar_20, due_date_mar_20).
    where(department: 'SWM Solid Waste Management',
      trash_quad: 'NE',
      status: 'Closed',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
        'New Resident Container', 'Recycling Participation NEW',
        'Recycling Cart Repair or Replace', 'SWM Escalation',
        'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
        count
  end
  def self.neMarch2020_sla_html
    start_date_mar_20 = Date.parse('2020-3-01')
    due_date_mar_20 = Date.parse('2020-3-31')
    tally_list = Sr.select('distinct case_number').
    where(sr_create_date: start_date_mar_20..due_date_mar_20).
    where(department: 'SWM Solid Waste Management',
       trash_quad: 'NE',
       sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
        'New Resident Container', 'Recycling Participation NEW',
        'Recycling Cart Repair or Replace', 'SWM Escalation',
        'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint', 'Physically Challenged Pickup'])
    tally_list.each{|sr|
    sr.tally = 1
    sr.save}
    # binding.pry
    tally_list_values = Sr.select('distinct case_number').
    where(sr_create_date: start_date_mar_20..due_date_mar_20).
    where(department: 'SWM Solid Waste Management',
      trash_quad: 'NE',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
      'New Resident Container', 'Recycling Participation NEW',
      'Recycling Cart Repair or Replace', 'SWM Escalation',
      'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
      'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
      'Add A Can CANCELLATION', 'Missed Recycling Pickup',
      'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
      pluck(:id, :case_number, :sr_location, :county, :district, :neighborhood,
        :tax_id, :trash_quad, :recycle_quad, :trash_day, :heavy_trash_day,
        :recycle_day, :key_map, :management_district, :department, :division,
        :sr_type, :queue, :sla, :status, :sr_create_date, :due_date,
        :date_closed, :overdue, :title, :x, :y, :latitude, :longitude,
        :channel_type, :created_at, :updated_at, :field1, :field2, :client,
        :garbage_route, :heavy_trash_quad, :sr_owner, :sr_creator,
        :resolve_days, :street_num, :client_street, :city, :state, :zip,
        :phone_number, :email_address, :garbage_day1, :garbage_quad,
        :recycle_day1, :recycle_route, :resolution_time, :expression,
        :ne_overdue, :ne_not_overdue, :ne_sr_total, :nw_overdue,
        :nw_not_overdue, :nw_sr_total, :se_overdue, :se_not_overdue,
        :se_sr_total, :sw_overdue, :sw_not_overdue,
        :sw_sr_total, :quad_status, :tally)
    headers = %w[id case_number sr_location county district neighborhood
       tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
       key_map management_district department division sr_type queue sla
       status sr_create_date due_date date_closed overdue title x y
       latitude longitude channel_type created_at updated_at field1
       field2 client garbage_route heavy_trash_quad sr_owner sr_creator
       resolve_days street_num client_street city state zip phone_number
       email_address garbage_day1 garbage_quad recycle_day1 recycle_route
       resolution_time expression ne_overdue ne_not_overdue ne_sr_total
       nw_overdue nw_not_overdue nw_sr_total se_overdue se_not_overdue
       se_sr_total sw_overdue sw_not_overdue sw_sr_total quad_status tally]
    CSV.open("../searchwarranty/march_2020.csv", "wb", write_headers: true,
       headers: headers) { |csv| tally_list_values.each { |row| csv << row
        }
      }
      sales2 = Daru::DataFrame.from_csv '../searchwarranty/march_2020.csv'
      list2 = sales2.pivot_table(index:['sr_type'],values:'tally',
        vectors:['trash_quad'],  agg:  :sum)
      File.open('../searchwarranty/app/views/srs/march_2020_sla_due_cases.html.erb',
        'w+'){|f| f << list2.to_html}
      File.open('../searchwarranty/app/views/srs/march_2020_sla_due_cases.html',
        'w+'){|f| f << list2.to_html}
  end
  def self.seMar2020_sla_cases_closed_but_updated_later
    start_date_mar_20 = Date.parse('2020-3-01')
    due_date_mar_20 = Date.parse('2020-3-31')
    Sr.select('distinct case_number').
    where("updated_at >= ? AND updated_at <= ?",
       start_date_mar_20, due_date_mar_20).
    where(date_closed: start_date_mar_20..due_date_mar_20).
    where(sr_create_date: start_date_mar_20..due_date_mar_20).
    where(due_date: start_date_mar_20..due_date_mar_20).
    where(department: 'SWM Solid Waste Management',
       trash_quad: 'SE',
       status: 'Closed',
       sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
         'New Resident Container', 'Recycling Participation NEW',
         'Recycling Cart Repair or Replace', 'SWM Escalation',
         'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
         'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
         'Add A Can CANCELLATION', 'Missed Recycling Pickup',
         'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
         count
  end
  def self.seMar2020_sla_due_cases
    start_date_mar_20 = Date.parse('2020-3-01')
    due_date_mar_20 = Date.parse('2020-3-31')
    Sr.select('distinct case_number').
    where("sr_create_date >= ? AND sr_create_date <= ?",
       start_date_mar_20, due_date_mar_20).
    where(department: 'SWM Solid Waste Management',
      trash_quad: 'SE',
      status: 'Closed',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
         'New Resident Container', 'Recycling Participation NEW',
         'Recycling Cart Repair or Replace', 'SWM Escalation',
         'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
         'Add A Can','Storm Debris Collection', 'Dead Animal Collection',
         'Add A Can CANCELLATION', 'Missed Recycling Pickup',
         'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
         count
  end
  def self.nwMar2020_sla_cases_closed_but_updated_later
    start_date_mar_20 = Date.parse('2020-3-01')
    due_date_mar_20 = Date.parse('2020-3-31')
    Sr.select('distinct case_number').
    where("updated_at >= ? AND updated_at <= ?",
       start_date_mar_20, due_date_mar_20).
    where(date_closed: start_date_mar_20..due_date_mar_20).
    where(sr_create_date: start_date_mar_20..due_date_mar_20).
    where(due_date: start_date_mar_20..due_date_mar_20).
    where(department: 'SWM Solid Waste Management',
       trash_quad: 'NW',
       status: 'Closed',
       sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
          'Add A Can CANCELLATION', 'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
           count
  end

  def self.seMar2020_sla_cases_closed_but_updated_later
    start_date_mar_20 = Date.parse('2020-3-01')
    due_date_mar_20 = Date.parse('2020-3-31')
    Sr.select('distinct case_number').
    where("updated_at >= ? AND updated_at <= ?",
       start_date_mar_20, due_date_mar_20).
    where(date_closed: start_date_mar_20..due_date_mar_20).
    where(sr_create_date: start_date_mar_20..due_date_mar_20).
    where(due_date: start_date_mar_20..due_date_mar_20).
    where(department: 'SWM Solid Waste Management',
       trash_quad: 'SE',
       status: 'Closed',
       sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
         'New Resident Container', 'Recycling Participation NEW',
         'Recycling Cart Repair or Replace', 'SWM Escalation',
         'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
         'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
         'Add A Can CANCELLATION', 'Missed Recycling Pickup',
         'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
         count
  end
  def self.nwMar2020_sla_due_cases
    start_date_mar_20 = Date.parse('2020-3-01')
    due_date_mar_20 = Date.parse('2020-3-31')
    Sr.select('distinct case_number').
    where("sr_create_date >= ? AND sr_create_date <= ?",
       start_date_mar_20, due_date_mar_20).
    where(department: 'SWM Solid Waste Management',
      trash_quad: 'NW',
      status: 'Closed',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
        'New Resident Container', 'Recycling Participation NEW',
        'Recycling Cart Repair or Replace', 'SWM Escalation',
        'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
        count
  end

  def self.swMar2020_sla_cases_closed_but_updated_later
    start_date_mar_20 = Date.parse('2020-3-01')
    due_date_mar_20 = Date.parse('2020-3-31')
    Sr.select('distinct case_number').
    where("updated_at >= ? AND updated_at <= ?",
       start_date_mar_20, due_date_mar_20).
    where(date_closed: start_date_mar_20..due_date_mar_20).
    where(sr_create_date: start_date_mar_20..due_date_mar_20).
    where(due_date: start_date_mar_20..due_date_mar_20).
    where(department: 'SWM Solid Waste Management',
      trash_quad: 'SW',
      status: 'Closed',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
         'New Resident Container', 'Recycling Participation NEW',
         'Recycling Cart Repair or Replace', 'SWM Escalation',
         'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
         'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
         'Add A Can CANCELLATION', 'Missed Recycling Pickup',
         'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
         count
  end
  def self.swMar2020_sla_due_cases
    start_date_mar_20 = Date.parse('2020-3-01')
    due_date_mar_20 = Date.parse('2020-3-31')
     Sr.select('distinct case_number').
     where("sr_create_date >= ? AND sr_create_date <= ?",
       start_date_mar_20, due_date_mar_20).
     where(department: 'SWM Solid Waste Management',
       trash_quad: 'SW',
       status: 'Closed',
       sr_type: ['Missed Heavy Trash Pickup','Container Problem',
         'New Resident Container', 'Recycling Participation NEW',
         'Recycling Cart Repair or Replace', 'SWM Escalation',
         'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
         'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
         'Add A Can CANCELLATION', 'Missed Recycling Pickup',
         'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
         count
  end

  def self.nwFeb2020_sla_due_cases
    start_date_feb_20 = Date.parse('2020-2-01')
    due_date_feb_20 = Date.parse('2020-2-29')
     Sr.select('distinct case_number').
     where("due_date >= ? AND due_date <= ?",
        start_date_feb_20, due_date_feb_20 ).
     where(department: 'SWM Solid Waste Management',
       trash_quad: 'NW',
       status: 'Closed',
       sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
         'New Resident Container', 'Recycling Participation NEW',
         'Recycling Cart Repair or Replace', 'SWM Escalation',
         'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
         'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
         'Add A Can CANCELLATION', 'Missed Recycling Pickup',
         'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
         count
  end

  def self.deptSEwide_mar_2020_actual_due_and_closed_cases
    start_date_mar_20 = Date.parse('2020-3-01')
    due_date_mar_20 = Date.parse('2020-3-31')
    Sr.select('distinct case_number').
    where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date_mar_20, due_date_mar_20).
      where(overdue:[-30..-0.05],
      department: 'SWM Solid Waste Management',
      status: 'Closed',
      trash_quad: 'SE',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
        'New Resident Container', 'Recycling Participation NEW',
        'Recycling Cart Repair or Replace', 'SWM Escalation',
        'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
        count
  end

  def self.deptNEwide_mar_2020_actual_due_and_closed_cases
    start_date_mar_20 = Date.parse('2020-3-01')
    due_date_mar_20 = Date.parse('2020-3-31')
    Sr.select('distinct case_number').
    where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date_mar_20, due_date_mar_20).
      where(overdue:[-30..-0.05],
      department: 'SWM Solid Waste Management',
      status: 'Closed',
      trash_quad: 'NE',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
        'New Resident Container', 'Recycling Participation NEW',
        'Recycling Cart Repair or Replace', 'SWM Escalation',
        'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
        count
  end

  def self.deptNWwide_mar_2020_actual_due_and_closed_cases
    start_date_mar_20 = Date.parse('2020-3-01')
    due_date_mar_20 = Date.parse('2020-3-31')
    Sr.select('distinct case_number').
    where("sr_create_date >= ? AND sr_create_date <= ?",
       start_date_mar_20, due_date_mar_20).
    where(overdue:[-30..-0.05],
      department: 'SWM Solid Waste Management',
      status: 'Closed',
      trash_quad: 'NW',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
        'New Resident Container', 'Recycling Participation NEW',
        'Recycling Cart Repair or Replace', 'SWM Escalation',
        'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
        count
  end

  def self.deptSWwide_mar_2020_actual_due_and_closed_cases
    start_date_mar_20 = Date.parse('2020-3-01')
    due_date_mar_20 = Date.parse('2020-4-01')
    Sr.select('distinct case_number').
    where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date_mar_20, due_date_mar_20).
      where(overdue:[-30..-0.05],
        department: 'SWM Solid Waste Management',
        status: 'Closed',
        trash_quad: 'SW',
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
          'Add A Can CANCELLATION', 'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
          count
  end

  def self.deptSWwide_dec_2019_actual_due_and_closed_cases
    start_date_dec_19 = Date.parse('2019-12-1')
    due_date_dec_19 = Date.parse('2020-1-1')
    Sr.select('distinct case_number').
    where("sr_create_date >= ? AND  sr_create_date<= ?",
       start_date_dec_19, due_date_dec_19).
       where(overdue:[-30..-0.05],
         department: 'SWM Solid Waste Management',
         status: 'Closed',
         trash_quad: 'SW',
         sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
           'New Resident Container', 'Recycling Participation NEW',
           'Recycling Cart Repair or Replace', 'SWM Escalation',
           'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
           'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
           'Add A Can CANCELLATION', 'Missed Recycling Pickup',
           'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
           count
  end

  def self.deptNWwide_dec_2019_actual_due_and_closed_cases
    start_date_dec_19 = Date.parse('2019-12-1')
    due_date_dec_19 = Date.parse('2020-1-1')
    Sr.select('distinct case_number').
    where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date_dec_19, due_date_dec_19).
      where(overdue:[-30..-0.05],
        department: 'SWM Solid Waste Management',
        status: 'Closed',
        trash_quad: 'NW',
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
           'New Resident Container', 'Recycling Participation NEW',
           'Recycling Cart Repair or Replace', 'SWM Escalation',
           'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
           'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
           'Add A Can CANCELLATION', 'Missed Recycling Pickup',
           'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
           count
  end

  def self.deptSEwide_dec_2019_actual_due_and_closed_cases
    start_date_dec_19 = Date.parse('2019-12-1')
    due_date_dec_19 = Date.parse('2020-1-1')
    Sr.select('distinct case_number').
    where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date_dec_19, due_date_dec_19).
      where(overdue:[-30..-0.05],
        department: 'SWM Solid Waste Management',
        status: 'Closed',
        trash_quad: 'SE',
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
          'Add A Can CANCELLATION', 'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
          count
  end

  def self.deptNEwide_dec_2019_actual_due_and_closed_cases
    start_date_dec_19 = Date.parse('2019-12-1')
    due_date_dec_19 = Date.parse('2020-1-1')
    Sr.select('distinct case_number').
    where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date_dec_19, due_date_dec_19).
      where(overdue:[-30..-0.05],
        department: 'SWM Solid Waste Management',
        status: 'Closed',
        trash_quad: 'NE',
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
          'Add A Can CANCELLATION', 'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
          count
  end

  def self.deptNEwide_oct_2019_sla_due_cases
    start_date_oct_19 = Date.parse('2019-10-01')
    due_date_oct_19 = Date.parse('2019-11-01')
    Sr.select('distinct case_number').
    where(sr_create_date: start_date_oct_19..due_date_oct_19).
    where(department: 'SWM Solid Waste Management',
      trash_quad: 'NE',
      status: 'Closed',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
        'New Resident Container', 'Recycling Participation NEW',
        'Recycling Cart Repair or Replace', 'SWM Escalation',
        'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
        count
  end

  def self.deptSWwide_dec_2019_sla_due_cases
    start_date_dec_19 = Date.parse('2019-12-01')
    due_date_dec_19 = Date.parse('2020-1-01')
    Sr.select('distinct case_number').
    where(sr_create_date: start_date_dec_19..due_date_dec_19).
    where(department: 'SWM Solid Waste Management',
      trash_quad: 'SW',
      status: 'Closed',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
        'New Resident Container', 'Recycling Participation NEW',
        'Recycling Cart Repair or Replace', 'SWM Escalation',
        'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
        count
  end
  def self.qualityGrade(grade)
    #binding.pry
    if grade == nil
      return "No Value"
    elsif grade == BigDecimal('Infinity')
      return "No Value"
    elsif grade == 0
        return "F"
    elsif grade.nan?
          return "No Value"
    elsif grade >= 0.9
       return  "A"
    elsif grade >= 0.8
      return  "B"
    elsif grade >= 0.7
      return  "C"
    else
      return  "F"
    end
  end
  def self.north_case_quality_grade
    @NOverdue= Sr.
    select('distinct case_number').
    where(trash_quad: ['NE','NW'],
      expression: 'Overdue',
      sr_type: ['Missed Heavy Trash Pickup','Container Problem',
        'New Resident Container','Recycling Participation NEW' ,
        'Recycling Cart Repair or Replace','SWM Escalation',
        'Missed Garbage Pickup','Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint','Physically Challenged Pickup']).
        count
    @North = Sr.
    select('distinct case_number').
    where(status: 'Open',
      trash_quad:['NW','NE'],
      sr_type: ['Missed Heavy Trash Pickup','Container Problem',
        'New Resident Container','Recycling Participation NEW',
        'Recycling Cart Repair or Replace','SWM Escalation',
        'Missed Garbage Pickup','Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint','Physically Challenged Pickup']).
        count
    @NorthQuality = (1-(@NOverdue.to_f.round(2) / @North.to_f.round(2)))
    @NQualityGrad
    if @NorthQuality >= 0.9
      @NQualityGrade = 'A'
    elsif @NorthQuality >= 0.8
      @NQualityGrade = 'B'
    elsif @NorthQuality >= 0.7
      @NQualityGrade = 'C'
    else
      @NQualityGrade = 'F'
    end
    @NQualityGrade
    # return "#{@NQualityGrade}"
    # binding.pry
  end
  def self.south_case_quality_grade
    @SOverdue = Sr.
    select('distinct case_number').
    where(expression: 'Overdue',
      status: 'Open',
      trash_quad: ['SE','SW'],
      sr_type: ['Missed Heavy Trash Pickup','Container Problem',
        'New Resident Container','Recycling Participation NEW',
        'Recycling Cart Repair or Replace','SWM Escalation',
        'Missed Garbage Pickup','Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint','Physically Challenged Pickup']).
        count
    @South = Sr.
    select('distinct case_number').
    where(status: 'Open',
      trash_quad:['SW','SE'],
      sr_type: ['Missed Heavy Trash Pickup','Container Problem',
        'New Resident Container','Recycling Participation NEW',
        'Recycling Cart Repair or Replace','SWM Escalation',
        'Missed Garbage Pickup','Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint','Physically Challenged Pickup']).
        count
    @SouthQuality = (1-(@SOverdue.to_f.round(2) / @South.to_f.round(2)))
    if @SouthQuality >= 0.9
      @SQualityGrade = 'A'
    elsif @SouthQuality >= 0.8
      @SQualityGrade = 'B'
    elsif @SouthQuality >= 0.7
      @SQualityGrade = 'C'
    else
      @SQualityGrade = 'F'
    end
    @SQualityGrade
    # return "#{@SQualityGrade}"
    # binding.pry
  end
  def self.northQualityGrade
    @NNotOverdue= Sr.
    select('distinct case_number').
    where(trash_quad: ['NE','NW'],
      expression: 'Not Overdue',
      sr_type: ['Missed Heavy Trash Pickup','Container Problem',
        'New Resident Container','Recycling Participation NEW' ,
        'Recycling Cart Repair or Replace','SWM Escalation',
        'Missed Garbage Pickup','Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint','Physically Challenged Pickup']).
        count
    @North = Sr.
    select('distinct case_number').
    where(status: 'Open',
      trash_quad:['NW','NE'],
      sr_type: ['Missed Heavy Trash Pickup','Container Problem',
        'New Resident Container','Recycling Participation NEW',
        'Recycling Cart Repair or Replace','SWM Escalation',
        'Missed Garbage Pickup','Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint','Physically Challenged Pickup']).
        count
    @NorthQuality = @NNotOverdue.to_f.round(2) / @North.to_f.round(2)
    @NQualityGrad
    if @NorthQuality >= 0.9
      @NQualityGrade = 'A'
    elsif @NorthQuality >= 0.8
      @NQualityGrade = 'B'
    elsif @NorthQuality >= 0.7
      @NQualityGrade = 'C'
    else
      @NQualityGrade = 'F'
    end
    @NQualityGrade
    return "#{@NQualityGrade}"
    binding.pry
  end

  def self.southQualityGrade
    @SNotOverdue = Sr.
    select('distinct case_number').
    where(expression: 'Not Overdue',
      status: 'Open',
      trash_quad: ['SE','SW'],
      sr_type: ['Missed Heavy Trash Pickup','Container Problem',
        'New Resident Container','Recycling Participation NEW',
        'Recycling Cart Repair or Replace','SWM Escalation',
        'Missed Garbage Pickup','Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint','Physically Challenged Pickup']).
        count
    @South = Sr.
    select('distinct case_number').
    where(status: 'Open',
      trash_quad:['SW','SE'],
      sr_type: ['Missed Heavy Trash Pickup','Container Problem',
        'New Resident Container','Recycling Participation NEW',
        'Recycling Cart Repair or Replace','SWM Escalation',
        'Missed Garbage Pickup','Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint','Physically Challenged Pickup']).
    count
    @SouthQuality = @SNotOverdue.to_f.round(2) / @South.to_f.round(2)
    if @SouthQuality >= 0.9
      @SQualityGrade = 'A'
    elsif @SouthQuality >= 0.8
      @SQualityGrade = 'B'
    elsif @SouthQuality >= 0.7
      @SQualityGrade = 'C'
    else
      @SQualityGrade = 'F'
    end
      return "#{@SQualityGrade}"
    # binding.pry
  end

  def self.sr_route
    #perform after html generated for quad status
    OpenSr.delete_all
    @input = File.open("../searchwarranty/OpenSRRoute.txt")
    # @input = File.open("../searchwarranty/OpenSRRoute.txt")
    # as a result of Spatial Join of All Overdue Cases
    #with No Missing Quad Assignments
    header=%w[case_numbe sr_locatio sr_type quad_statu day sec_name quad tally]
      @input.each_line {|row|
        a= row.chomp
        # binding.pry
        array=a.split(",")
        b=Hash[header.zip(array)]
        OpenSr.create(b)
      }
    particular = OpenSr.where(sr_type: ['Missed Heavy Trash Pickup',
      'Missed Garbage Pickup','Missed Recycling Pickup',
      'Missed Yard Waste Pickup'])
    particular.each {|t|
        t.tally = 1
        t.save
      }
    binding.pry
    header2 = %w[case_numbe sr_locatio sr_type quad_statu day sec_name quad tally]
    CSV.open("../searchwarranty/ThursdayGarbageYardSr.csv", "wb",
       write_headers: true, headers: header2) { |csv|
          OpenSr.where(day: ['THURSDAY'],
            sr_type:['Missed Garbage Pickup', 'Missed Yard Waste Pickup'],
            quad_statu: ['NE_Overdue', 'NW_Overdue', 'SE_Overdue', 'SW_Overdue']).
            order(:sec_name).
            pluck(:case_numbe, :sr_locatio, :sr_type, :quad_statu,
              :day, :sec_name, :quad, :tally).
              each { |row|
                csv << row
              }
            }
    CSV.open("../searchwarranty/FridayGarbageYardSr.csv",
       "wb", write_headers: true, headers: header2) { |csv|
          OpenSr.where(day: ['FRIDAY'],
            sr_type:['Missed Garbage Pickup', 'Missed Yard Waste Pickup'],
            quad_statu: ['NE_Overdue', 'NW_Overdue', 'SE_Overdue', 'SW_Overdue']).
            order(:sec_name).
            pluck(:case_numbe, :sr_locatio, :sr_type, :quad_statu,
              :day, :sec_name, :quad, :tally).
              each { |row|
                csv << row
              }
            }
    CSV.open("../searchwarranty/OpenSr.csv",
       "wb", write_headers: true, headers: header2) { |csv|
        OpenSr.where(sr_type: ['Missed Heavy Trash Pickup',
          'Missed Garbage Pickup','Missed Recycling Pickup',
          'Missed Yard Waste Pickup']).
          pluck(:case_numbe, :sr_locatio, :sr_type,
            :quad_statu, :day, :sec_name, :quad, :tally).
            each { |row|
            csv << row
              }
            }
    CSV.open("../searchwarranty/OpenSrNMondayRoutes.csv",
       "wb", write_headers: true, headers: header2) { |csv|
        OpenSr.where(sr_type: ['Missed Heavy Trash Pickup',
          'Missed Garbage Pickup','Missed Recycling Pickup',
          'Missed Yard Waste Pickup'],
          day:['MONDAY'],
          quad:['NE',  'NW'],
          quad_statu:['NE_Overdue', 'NW_Overdue']).
          pluck(:case_numbe, :sr_locatio, :sr_type,
            :quad_statu, :day, :sec_name, :quad, :tally).
            each { |row|
              csv << row
            }
          }
    CSV.open("../searchwarranty/OpenSrNTuesdayRoutes.csv",
      "wb", write_headers: true, headers: header2) { |csv|
            OpenSr.where(sr_type: ['Missed Heavy Trash Pickup',
              'Missed Garbage Pickup','Missed Recycling Pickup',
              'Missed Yard Waste Pickup'],
              day:['TUESDAY'], quad:['NE',  'NW'],
              quad_statu:['NE_Overdue', 'NW_Overdue']).
              pluck(:case_numbe, :sr_locatio, :sr_type,
                :quad_statu, :day, :sec_name, :quad, :tally).
                each { |row|
                  csv << row
                }
              }
    CSV.open("../searchwarranty/OpenSrNThursdayRoutes.csv",
      "wb", write_headers: true, headers: header2) { |csv|
            OpenSr.where(sr_type: ['Missed Heavy Trash Pickup',
              'Missed Garbage Pickup','Missed Recycling Pickup',
              'Missed Yard Waste Pickup'],
              day:['THURSDAY'],
              quad:['NE',  'NW'],
              quad_statu:['NE_Overdue', 'NW_Overdue']).
              pluck(:case_numbe, :sr_locatio, :sr_type,
                :quad_statu, :day, :sec_name, :quad, :tally).
                each { |row|
                  csv << row
                }
              }
    CSV.open("../searchwarranty/OpenSrNFridayRoutes.csv",
      "wb", write_headers: true, headers: header2) { |csv|
                OpenSr.where(sr_type: ['Missed Heavy Trash Pickup',
                  'Missed Garbage Pickup','Missed Recycling Pickup',
                  'Missed Yard Waste Pickup'],
                  day:['FRIDAY'],
                  quad:['NE',  'NW'],
                  quad_statu:['NE_Overdue', 'NW_Overdue']).
                  pluck(:case_numbe, :sr_locatio, :sr_type,
                    :quad_statu, :day, :sec_name, :quad, :tally).
                    each { |row|
                      csv << row
                    }
                  }
    CSV.open("../searchwarranty/OpenSrSMondayRoutes.csv",
       "wb", write_headers: true, headers: header2) { |csv|
              OpenSr.where(sr_type: ['Missed Heavy Trash Pickup',
                'Missed Garbage Pickup','Missed Recycling Pickup',
                'Missed Yard Waste Pickup'],
                day:['MONDAY'],
                quad:['SE',  'SW'],
                quad_statu:['SE_Overdue', 'SW_Overdue']).
                pluck(:case_numbe, :sr_locatio, :sr_type,
                  :quad_statu, :day, :sec_name, :quad, :tally).
                  each { |row|
                    csv << row
                  }
                }
    CSV.open("../searchwarranty/OpenSrSTuesdayRoutes.csv",
       "wb", write_headers: true, headers: header2) { |csv|
                  OpenSr.where(sr_type: ['Missed Heavy Trash Pickup',
                    'Missed Garbage Pickup','Missed Recycling Pickup',
                    'Missed Yard Waste Pickup'],
                    day:['TUESDAY'],
                    quad:['SE',  'SW'],
                    quad_statu:['SE_Overdue', 'SW_Overdue']).
                    pluck(:case_numbe, :sr_locatio, :sr_type,
                      :quad_statu, :day, :sec_name, :quad, :tally).
                      each { |row|
                        csv << row
                      }
                    }
   CSV.open("../searchwarranty/OpenSrSThursdayRoutes.csv",
     "wb", write_headers: true, headers: header2) { |csv|
                  OpenSr.where(sr_type: ['Missed Heavy Trash Pickup',
                    'Missed Garbage Pickup','Missed Recycling Pickup',
                    'Missed Yard Waste Pickup'],
                    day:['THURSDAY'],
                    quad:['SE',  'SW'],
                    quad_statu:['SE_Overdue', 'SW_Overdue']).
                    pluck(:case_numbe, :sr_locatio, :sr_type,
                      :quad_statu, :day, :sec_name, :quad, :tally).
                      each { |row|
                        csv << row
                      }
                    }
   CSV.open("../searchwarranty/OpenSrSFridayRoutes.csv",
     "wb", write_headers: true, headers: header2) { |csv|
                      OpenSr.where(sr_type: ['Missed Heavy Trash Pickup',
                        'Missed Garbage Pickup','Missed Recycling Pickup',
                        'Missed Yard Waste Pickup'],
                        day:['FRIDAY'],
                        quad:['SE',  'SW'],
                        quad_statu:['SE_Overdue', 'SW_Overdue']).
                        pluck(:case_numbe, :sr_locatio, :sr_type,
                          :quad_statu, :day, :sec_name, :quad, :tally).
                          each { |row|
                            csv << row
                            }
                        }
    # byebug
    open_sr = Daru::DataFrame.from_csv '../searchwarranty/OpenSr.csv'
    # binding.pry
    # self.OpenSrNFridayRoutes
    friday_open_sr = Daru::DataFrame.from_csv '../searchwarranty/OpenSrNFridayRoutes.csv'
    thursday_open_sr = Daru::DataFrame.from_csv '../searchwarranty/OpenSrNThursdayRoutes.csv'
    # self.OpenSrNThursdayRoutes
    tuesday_open_sr = Daru::DataFrame.from_csv '../searchwarranty/OpenSrNTuesdayRoutes.csv'
    # self.OpenSrNTuesdayRoutes
    monday_open_sr = Daru::DataFrame.from_csv '../searchwarranty/OpenSrNMondayRoutes.csv'
    friday2_open_sr = Daru::DataFrame.from_csv '../searchwarranty/OpenSrSFridayRoutes.csv'
    thursday2_open_sr = Daru::DataFrame.from_csv '../searchwarranty/OpenSrSThursdayRoutes.csv'
    tuesday2_open_sr = Daru::DataFrame.from_csv '../searchwarranty/OpenSrSTuesdayRoutes.csv'
    monday2_open_sr = Daru::DataFrame.from_csv '../searchwarranty/OpenSrSMondayRoutes.csv'
    friday3_open_sr = Daru::DataFrame.from_csv '../searchwarranty/FridayGarbageYardSr.csv'
    # binding.pry
    open_sr_pivot = open_sr.pivot_table(index:['sr_type'],
      values:'tally', vectors: ['quad_statu'], agg: :sum)
    open_sr_pivot2 = friday_open_sr.pivot_table(index:['sec_name'],
      values:'tally', vectors: ['quad_statu', 'sr_type'], agg: :sum)
    open_sr_pivot3 = thursday_open_sr.pivot_table(index:['sec_name'],
      values:'tally', vectors: ['quad_statu', 'sr_type'], agg: :sum)
    open_sr_pivot4 = tuesday_open_sr.pivot_table(index:['sec_name'],
      values:'tally', vectors: ['quad_statu', 'sr_type'], agg: :sum)
    open_sr_pivot5 = monday_open_sr.pivot_table(index:['sec_name'],
      values:'tally', vectors: ['quad_statu', 'sr_type'], agg: :sum)
    open_sr_pivot6 = friday2_open_sr.pivot_table(index:['sec_name'],
      values:'tally', vectors: ['quad_statu', 'sr_type'], agg: :sum)
    open_sr_pivot7 = thursday2_open_sr.pivot_table(index:['sec_name'],
      values:'tally', vectors: ['quad_statu', 'sr_type'], agg: :sum)
    open_sr_pivot8 = tuesday2_open_sr.pivot_table(index:['sec_name'],
      values:'tally', vectors: ['quad_statu', 'sr_type'], agg: :sum)
    open_sr_pivot9 = monday2_open_sr.pivot_table(index:['sec_name'],
      values:'tally', vectors: ['quad_statu', 'sr_type'], agg: :sum)
    binding.pry
    File.open('../searchwarranty/app/views/open_srs/test.html', 'w+'){|f|
       f << open_sr_pivot.to_html }
    File.open('../searchwarranty/app/views/open_srs/test2.html', 'w+'){|f|
       f << open_sr_pivot2.to_html }
    File.open('../searchwarranty/app/views/open_srs/test3.html', 'w+'){|f|
       f << open_sr_pivot3.to_html }
    File.open('../searchwarranty/app/views/open_srs/test4.html', 'w+'){|f|
       f << open_sr_pivot4.to_html }
    File.open('../searchwarranty/app/views/open_srs/test5.html', 'w+'){|f|
       f << open_sr_pivot5.to_html }
    File.open('../searchwarranty/app/views/open_srs/test6.html', 'w+'){|f|
       f << open_sr_pivot6.to_html }
    File.open('../searchwarranty/app/views/open_srs/test7.html', 'w+'){|f|
       f << open_sr_pivot7.to_html }
    File.open('../searchwarranty/app/views/open_srs/test8.html', 'w+'){|f|
       f << open_sr_pivot8.to_html }
    File.open('../searchwarranty/app/views/open_srs/test9.html', 'w+'){|f|
       f << open_sr_pivot9.to_html }
    binding.pry
  end
end

class Sr < ApplicationRecord
  def self.case_title
      # require 'csv'
      missed_hvy =[]
      missed_gar = []
      container_prob = []
      new_resident_container = []
      resident_part_new = []
      rec_cart_repair_replace = []
      swm_escalation = []
      trash_dump = []
      storm_debris_collection = []
      dead_animal_collection = []
      add_a_can = []
      add_a_can_cancellation = []
      missed_recycling_pickup = []
      personnel_or_vehicle_complaint = []
      physically_challenged_pickup = []
        Sr.all.map {|i|
          if i.case_title.include?"Missed Heavy Trash Pickup"
            missed_hvy.push i
          elsif i.case_title.include?"Missed Garbage Pickup"
            missed_gar.push i
          elsif i.case_title.include?"Container Problem"
            container_prob.push i
          elsif i.case_title.include?"New Resident Container"
            new_resident_container.push i
          elsif i.case_title.include?"Recycling Participation New"
            recycling_part_new.push i
          elsif i.case_title.include?"Recycling Cart Repair or Replace"
            rec_cart_repair_replace.push i
          elsif i.case_title.include?"SWM Escalation"
            swm_escalation.push i
          elsif i.case_title.include?"Trash Dumping or Illegal Dumpsite"
            trash_dump.push i
          elsif i.case_title.include?"Add A Can"
            add_a_can.push i
          elsif i.case_title.include? "Storm Debris Collection"
            storm_debris_collection.push i
          elsif i.case_title.include?"Dead Animal Collection"
            dead_animal_collection.push i
          elsif i.case_title.include?"Add A Can CANCELLATION"
            add_a_can_cancellation.push i
          elsif i.case_title.include? "Missed Recycling Pickup"
            missed_recycling_pickup.push i
          elsif i.case_title.include? "Personnel or Vehicle Complaint"
            personnel_or_vehicle_complaint.push i
          elsif i.case_title.include?"Physically Challenged Pickup"
            physically_challenged_pickup.push i
          else
            puts "#{i}"
          end
        }
      missed_hvy.each {|i|
        array = []
        now = DateTime.now
        a = i.resolve_by.to_f
        b = now.to_f
        c = a - b
        d = c/3600
        if d > 0
          i.overdue = 0
        else
          i.overdue = 1
        end
        array <<  i.case_title.split("-")
        # binding.pry
        i.sr_type = array[0][0]
        i.case_number = array[0][1]
        i.client_street = array[0][2]
        i.save
      }
      missed_gar.each {|i|
        array = []
        now = DateTime.now
        a = i.resolve_by.to_f
        b = now.to_f
        c = a - b
        d = c/3600
        if d > 0
          i.overdue = 0
        else
          i.overdue = 1
        end
        array <<  i.case_title.split("-")
        # binding.pry
        i.sr_type = array[0][0]
        i.case_number = array[0][1]
        i.client_street = array[0][2]
        i.save
      }
      container_prob.each {|i|
        array = []
        now = DateTime.now
        a = i.resolve_by.to_f
        b = now.to_f
        c = a - b
        d = c/3600
        if d > 0
          i.overdue = 0
        else
          i.overdue = 1
        end
        array <<  i.case_title.split("-")
        # binding.pry
        i.sr_type = array[0][0]
        i.case_number = array[0][1]
        i.client_street = array[0][2]
        i.save
      }
      new_resident_container.each {|i|
        now = DateTime.now
        a = i.resolve_by.to_f
        b = now.to_f
        c = a - b
        d = c/3600
        if d > 0
          i.overdue = 0
        else
          i.overdue = 1
        end
        array = []
        array <<  i.case_title.split("-")
        # binding.pry
        i.sr_type = array[0][0]
        i.case_number = array[0][1]
        i.client_street = array[0][2]
        i.save
      }
      resident_part_new.each {|i|
        now = DateTime.now
        a = i.resolve_by.to_f
        b = now.to_f
        c = a - b
        d = c/3600
        if d > 0
          i.overdue = 0
        else
          i.overdue = 1
        end
        array = []
        array <<  i.case_title.split("-")
        # binding.pry
        i.sr_type = array[0][0]
        i.case_number = array[0][1]
        i.client_street = array[0][2]
        i.save
      }
      rec_cart_repair_replace.each {|i|
        now = DateTime.now
        a = i.resolve_by.to_f
        b = now.to_f
        c = a - b
        d = c/3600
        if d > 0
          i.overdue = 0
        else
          i.overdue = 1
        end
        array = []
        array <<  i.case_title.split("-")
        # binding.pry
        i.sr_type = array[0][0]
        i.case_number = array[0][1]
        i.client_street = array[0][2]
        i.save
      }
      swm_escalation.each {|i|
        now = DateTime.now
        a = i.resolve_by.to_f
        b = now.to_f
        c = a - b
        d = c/3600
        if d > 0
          i.overdue = 0
        else
          i.overdue = 1
        end
        array = []
        array <<  i.case_title.split("-")
        # binding.pry
        i.sr_type = array[0][0]
        i.case_number = array[0][1]
        i.client_street = array[0][2]
        i.save
      }
      trash_dump.each {|i|
        now = DateTime.now
        a = i.resolve_by.to_f
        b = now.to_f
        c = a - b
        d = c/3600
        if d > 0
          i.overdue = 0
        else
          i.overdue = 1
        end
        array = []
        array <<  i.case_title.split("-")
        # binding.pry
        i.sr_type = array[0][0]
        i.case_number = array[0][1]
        i.client_street = array[0][2]
        i.save
      }
      storm_debris_collection.each {|i|
        now = DateTime.now
        a = i.resolve_by.to_f
        b = now.to_f
        c = a - b
        d = c/3600
        if d > 0
          i.overdue = 0
        else
          i.overdue = 1
        end
        array = []
        array <<  i.case_title.split("-")
        # binding.pry
        i.sr_type = array[0][0]
        i.case_number = array[0][1]
        i.client_street = array[0][2]
        i.save
      }
      dead_animal_collection.each {|i|
        now = DateTime.now
        a = i.resolve_by.to_f
        b = now.to_f
        c = a - b
        d = c/3600
        if d > 0
          i.overdue = 0
        else
          i.overdue = 1
        end
        array = []
        array <<  i.case_title.split("-")
        # binding.pry
        i.sr_type = array[0][0]
        i.case_number = array[0][1]
        i.client_street = array[0][2]
        i.save
      }
      add_a_can.each {|i|
        now = DateTime.now
        a = i.resolve_by.to_f
        b = now.to_f
        c = a - b
        d = c/3600
        if d > 0
          i.overdue = 0
        else
          i.overdue = 1
        end
        array = []
        array <<  i.case_title.split("-")
        # binding.pry
        i.sr_type = array[0][0]
        i.case_number = array[0][1]
        i.client_street = array[0][2]
        i.save
      }
      add_a_can_cancellation.each {|i|
        now = DateTime.now
        a = i.resolve_by.to_f
        b = now.to_f
        c = a - b
        d = c/3600
        if d > 0
          i.overdue = 0
        else
          i.overdue = 1
        end
        array = []
        array <<  i.case_title.split("-")
        # binding.pry
        i.sr_type = array[0][0]
        i.case_number = array[0][1]
        i.client_street = array[0][2]
        i.save
      }
      missed_recycling_pickup.each {|i|
        now = DateTime.now
        a = i.resolve_by.to_f
        b = now.to_f
        c = a - b
        d = c/3600
        if d > 0
          i.overdue = 0
        else
          i.overdue = 1
        end
        array = []
        array <<  i.case_title.split("-")
        # binding.pry
        i.sr_type = array[0][0]
        i.case_number = array[0][1]
        i.client_street = array[0][2]
        i.save
      }
      personnel_or_vehicle_complaint.each {|i|
        now = DateTime.now
        a = i.resolve_by.to_f
        b = now.to_f
        c = a - b
        d = c/3600
        if d > 0
          i.overdue = 0
        else
          i.overdue = 1
        end
        array = []
        array <<  i.case_title.split("-")
        # binding.pry
        i.sr_type = array[0][0]
        i.case_number = array[0][1]
        i.client_street = array[0][2]
        i.save
      }
      physically_challenged_pickup.each {|i|
        now = DateTime.now
        a = i.resolve_by.to_f
        b = now.to_f
        c = a - b
        d = c/3600
      # 8
        array = []
        array <<  i.case_title.split("-")
        # binding.pry
        i.sr_type = array[0][0]
        i.case_number = array[0][1]
        i.client_street = array[0][2]
        i.save
      }
      headers = %w[:sr_type, :case_number, :client_street, :overdue, :resolve_by]
      CSV.open("missed_garbage.csv", "wb", write_headers: true, headers: headers) do |csv|
        #binding.pry
          missed_gar.each do |row|
          map = []
          map << row.sr_type
          map << row.case_number
          map << row.client_street
          map << row.overdue
          map << row.resolve_by
          csv << map
          #csv << row
          end
      end
      CSV.open("missed_hvy.csv", "wb", write_headers: true, headers: headers) do |csv|
            missed_hvy.each do |row|
              map = []
              map << row.sr_type
              map << row.case_number
              map << row.client_street
              map << row.overdue
              map << row.resolve_by
              csv << map
            end
      end
      CSV.open("container_prob.csv", "wb", write_headers: true, headers: headers) do |csv|
            container_prob.each do |row|
              map = []
              map << row.sr_type
              map << row.case_number
              map << row.client_street
              map << row.overdue
              map << row.resolve_by
              csv << map
            end
      end
      CSV.open("new_resident_container.csv", "wb", write_headers: true, headers: headers) do |csv|
              new_resident_container.each do |row|
                map = []
                map << row.sr_type
                map << row.case_number
                map << row.client_street
                map << row.overdue
                map << row.resolve_by
                csv << map
              end
      end
      CSV.open("resident_part_new.csv", "wb", write_headers: true, headers: headers) do |csv|
                resident_part_new.each do |row|
                  map = []
                  map << row.sr_type
                  map << row.case_number
                  map << row.client_street
                  map << row.overdue
                  map << row.resolve_by
                  csv << map
                end
      end
      CSV.open("rec_cart_repair_replace.csv", "wb", write_headers: true, headers: headers) do |csv|
                rec_cart_repair_replace.each do |row|
                  map = []
                  map << row.sr_type
                  map << row.case_number
                  map << row.client_street
                  map << row.overdue
                  map << row.resolve_by
                  csv << map
                end
      end
      CSV.open("swm_escalation.csv", "wb", write_headers: true, headers: headers) do |csv|
                swm_escalation.each do |row|
                  map = []
                  map << row.sr_type
                  map << row.case_number
                  map << row.client_street
                  map << row.overdue
                  map << row.resolve_by
                  csv << map
                end
      end
      CSV.open("trash_dump.csv", "wb", write_headers: true, headers: headers) do |csv|
                trash_dump.each do |row|
                  map = []
                  map << row.sr_type
                  map << row.case_number
                  map << row.client_street
                  map << row.overdue
                  map << row.resolve_by
                  csv << map
                end
      end
      CSV.open("storm_debris_collection.csv", "wb", write_headers: true, headers: headers) do |csv|
                storm_debris_collection.each do |row|
                  map = []
                  map << row.sr_type
                  map << row.case_number
                  map << row.client_street
                  map << row.overdue
                  map << row.resolve_by
                  csv << map
                end
      end
      CSV.open("dead_animal_collection.csv", "wb", write_headers: true, headers: headers) do |csv|
                dead_animal_collection.each do |row|
                  map = []
                  map << row.sr_type
                  map << row.case_number
                  map << row.client_street
                  map << row.overdue
                  map << row.resolve_by
                  csv << map
                end
      end
      CSV.open("add_a_can.csv", "wb", write_headers: true, headers: headers) do |csv|
                add_a_can.each do |row|
                  map = []
                  map << row.sr_type
                  map << row.case_number
                  map << row.client_street
                  map << row.overdue
                  map << row.resolve_by
                  csv << map
                end
      end
      CSV.open("add_a_can_cancellation.csv", "wb", write_headers: true, headers: headers) do |csv|
                add_a_can_cancellation.each do |row|
                  map = []
                  map << row.sr_type
                  map << row.case_number
                  map << row.client_street
                  map << row.overdue
                  map << row.resolve_by
                  csv << map
                end
      end
      CSV.open("missed_recycling_pickup.csv", "wb", write_headers: true, headers: headers) do |csv|
                missed_recycling_pickup.each do |row|
                  map = []
                  map << row.sr_type
                  map << row.case_number
                  map << row.client_street
                  map << row.overdue
                  map << row.resolve_by
                  csv << map
                end
      end
      CSV.open("personnel_or_vehicle_complaint.csv", "wb", write_headers: true, headers: headers) do |csv|
                personnel_or_vehicle_complaint.each do |row|
                  map = []
                  map << row.sr_type
                  map << row.case_number
                  map << row.client_street
                  map << row.overdue
                  map << row.resolve_by
                  csv << map
                end
      end
      CSV.open("physically_challenged_pickup.csv", "wb", write_headers: true, headers: headers) do |csv|
                physically_challenged_pickup.each do |row|
                  map = []
                  map << row.sr_type
                  map << row.case_number
                  map << row.client_street
                  map << row.overdue
                  map << row.resolve_by
                  csv << map
                end
      end

  end
end

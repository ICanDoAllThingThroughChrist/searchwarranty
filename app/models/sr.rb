class Sr < ApplicationRecord
  def self.active_cases
          srs= Sr.where(status:'Active', department:'Solid Waste Management')
          records = srs.to_ary
          #records is an array
          records.each{|i|
            # binding.pry
            if i.sr_type == "Non Residential Collection CANCEL"
              i.sla = 3
              if i.SLAStartTime != nil
                o= DateTime.parse("#{i.SLAStartTime}")
                i.calcDeadline= o + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              elsif
                i.calcDeadline= i.created_at + i.sla
                co= DateTime.parse("#{i.calcDe8adline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              end
            elsif i.sr_type == "Dead Animal Collection" ||  i.sr_type == "Missed Garbage Pickup" || i.sr_type == "Missed Recycling Pickup"
              # i.sla = 4 = i.
              i.sla = 4
              if i.SLAStartTime != nil
                o= DateTime.parse("#{i.SLAStartTime}")
                i.calcDeadline= o + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              else
                i.calcDeadline= i.created_at + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              end
              # binding.pry
            elsif i.sr_type == "Add A Cart" || i.sr_type== "Spilled Debris" || i.sr_type== "Storm Debris Collection"
              # i.sla = 5
              i.sla = 5
              if i.SLAStartTime != nil
                o= DateTime.parse("#{i.SLAStartTime}")
                i.calcDeadline= o + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              else
                i.calcDeadline= i.created_at + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              end

            elsif i.sr_type == "Missed Yard Waste Pickup"
              i.sla = 6
              if i.SLAStartTime != nil
                o= DateTime.parse("#{i.SLAStartTime}")
                i.calcDeadline= o + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              else
                i.calcDeadline= i.created_at + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              end

            elsif i.sr_type ==  "Missed Heavy Trash Pickup"
              i.sla = 7
              if i.SLAStartTime != nil
                o= DateTime.parse("#{i.SLAStartTime}")
                i.calcDeadline= o + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              else
                i.calcDeadline= i.created_at + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              end
            elsif i.sr_type == "Order Bag Tags"
              i.sla = 9
              if i.SLAStartTime != nil
                o= DateTime.parse("#{i.SLAStartTime}")
                i.calcDeadline= o + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                    co= DateTime.parse("#{i.calcDeadline}")
                      if co- DateTime.now < 0
                        i.overdue = 1
                      else
                        i.overdue = 0
                      end
                  end
                i.save
              else
                i.calcDeadline= i.created_at + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              end
            elsif i.sr_type ==  "Container Problem"||i.sr_type ==  "Dumpster Permit"||i.sr_type == "Neighborhood Clean up"||
              i.sr_type== "Non Residential Collection Service NEW"
              i.sla = 10
              if i.SLAStartTime != nil
                o= DateTime.parse("#{i.SLAStartTime}")
                i.calcDeadline= o + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              else
                i.calcDeadline= i.created_at + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              end
            elsif i.sr_type == "New Move In Service"
              i.sla = 11
              if i.SLAStartTime != nil
                o= DateTime.parse("#{i.SLAStartTime}")
                i.calcDeadline= o + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                    co= DateTime.parse("#{i.calcDeadline}")
                      if co- DateTime.now < 0
                        i.overdue = 1
                      else
                        i.overdue = 0
                      end
                  end
                i.save
              else
                i.calcDeadline= i.created_at + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              end
            elsif i.sr_type == "Container Placement"|| i.sr_type == "New Resident Container"
              i.sla = 12
              if i.SLAStartTime != nil
                o= DateTime.parse("#{i.SLAStartTime}")
                i.calcDeadline= o + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              else
                i.calcDeadline= i.created_at + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              end
            elsif i.sr_type == "Add A Can"|| i.sr_type == "Recycling Cart Repair or Replace"|| i.sr_type == "Recycling Cart Replace" || i.sr_type == "Recycling Cart Repair"
              i.sla = 14
              if i.SLAStartTime != nil
                o= DateTime.parse("#{i.SLAStartTime}")
                i.calcDeadline= o + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              else
                i.calcDeadline= i.created_at + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              end
            elsif i.sr_type == "Add A Cart CANCELLATION"
              i.sla = 16
              if i.SLAStartTime != nil
                o= DateTime.parse("#{i.SLAStartTime}")
                i.calcDeadline= o + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              else
                i.calcDeadline= i.created_at + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              end
            elsif i.sr_type == "Add A Can CANCELLATION"
              i.sla = 19
              if i.SLAStartTime != nil
                o= DateTime.parse("#{i.SLAStartTime}")
                i.calcDeadline= o + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              else
                i.calcDeadline= i.created_at + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              end
            elsif i.sr_type == "Dumpster Complaint"
              i.sla = 21
              if i.SLAStartTime != nil
                o= DateTime.parse("#{i.SLAStartTime}")
                i.calcDeadline= o + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              else
                i.calcDeadline= i.created_at + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              end
            elsif i.sr_type == "Spilled Debris"
              i.sla = 24
              if i.SLAStartTime != nil
                o= DateTime.parse("#{i.SLAStartTime}")
                i.calcDeadline= o + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              else
                i.calcDeadline= i.created_at + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              end
            elsif i.sr_type == "SWM Escalation"
              i.sla = 27
              if i.SLAStartTime != nil
                o= DateTime.parse("#{i.SLAStartTime}")
                i.calcDeadline= o + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              else
                i.calcDeadline= i.created_at + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              end
            elsif i.sr_type == "Trash Dumping or Illegal Dumpsite"
                i.sla = 29
                if i.SLAStartTime != nil
                  o= DateTime.parse("#{i.SLAStartTime}")
                  i.calcDeadline= o + i.sla
                  co= DateTime.parse("#{i.calcDeadline}")
                    if co- DateTime.now < 0
                      i.overdue = 1
                    else
                      i.overdue = 0
                    end
                  i.save
                else
                  i.calcDeadline= i.created_at + i.sla
                  co= DateTime.parse("#{i.calcDeadline}")
                    if co- DateTime.now < 0
                      i.overdue = 1
                    else
                      i.overdue = 0
                    end
                  i.save
                end
            elsif i.sr_type == "Property Damage"
              i.sla = 30
              if i.SLAStartTime != nil
                o= DateTime.parse("#{i.SLAStartTime}")
                i.calcDeadline= o + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              else
                i.calcDeadline= i.created_at + i.sla
                co= DateTime.parse("#{i.calcDeadline}")
                  if co- DateTime.now < 0
                    i.overdue = 1
                  else
                    i.overdue = 0
                  end
                i.save
              end
            elsif i.sr_type == "Uncollected Service Units"
              i.sla = 0
                # binding.pry
            elsif i.sr_type == nil
              puts "#{i.id}"
            else
              puts "#{i.sr_type}"
            end
          }
          srs= ["Recycle Mascot Appearance", "Container Problem", "Spilled Debris",
            "Non Residential Collection CANCEL", "Recycling Participation NEW",
            "SWM Escalation", "SWM Speaker", "Container Repair", "SWM Information",
            "Employee Commendation", "Dumpster Permit", "Add A Cart Cancellation",
            "Non Residential Collection Service NEW", "Personnel or Vehicle Complaint",
            "Recycling Cart Replace", "Recycling Cart Repair", "New Resident in Private Development",
            "Container Replacement", "New Resident Container", "Customer Feedback",
            "Trash Dumping or Illegal Dumpsite", "Missed Recycling Pickup",
            "Recycling Information", "Property Damage", "Order Bag Tags",
            "New Move In Service", "Container Placement", "Miss Complaint",
            "Missed Garbage Pickup", "Dumpster Complaint", "Missed Yard Waste Pickup",
            "Add a Can Cancellation", "Neighborhood Clean up", "Uncollected Service Units",
            "Missed Heavy Trash Pickup", "Physically Challenged Pickup",
            "Add a Can", "Dead Animal Collection"]
          # binding.pry
          # Sr.where(status:'Active',department:'Solid Waste Management').distinct.pluck(:sla)
          # Sr.where(status:'Active',department:'Solid Waste Management',sla:'nil').distinct.pluck(:sr_type)
  end
  def self.daily_cases_update
      # require 'csv'
      Sr.delete_all
      creek = Creek::Book.new "/Users/e128289/OneDrive - City of Houston/Desktop/Case Advanced Find View - last2.xlsx"
      sheet = creek.sheets[0]
      a=[]
      sheet.simple_rows.each do |row| a.push row end
      service_requests= ["Add a Can Cancellation", "Add A Cart Cancellation", "Container Placement", "Container Problem", "Container Repair",
        "Container Replacement", "Customer Feedback", "Dead Animal Collection", "Dumpster Complaint", "Dumpster Permit", "Employee Commendation",
        "Miss Complaint", "Missed Garbage Pickup", "Missed Heavy Trash Pickup", "Missed Recycling Pickup", "Missed Yard Waste Pickup",
        "Neighborhood Clean up", "New Move In Service", "New Resident Container", "New Resident in Private Development", "Non Residential Collection CANCEL",
        "Non Residential Collection Service NEW", "Order Bag Tags, Personnel or Vehicle Complaint", "Physically Challenged Pickup, Property Damage",
        "Recycle Mascot Appearance", "Recycling Cart Repair", "Recycling Cart Replace", "Recycling Information"," Recycling Participation NEW",
        "Spilled Debris", "Storm Debris Collection", "SWM Escalation", "SWM Information", "Trash Dumping or Illegal Dumpsite"]
      # binding.pry
      a.each{|i|
        if i["A"]== "(Do Not Modify) Case"
          # binding.pry
          puts "not the right one"
        else
          #binding.pry
          Sr.create(case_number:"#{i["D"]}",sr_type:"#{i["F"]}",status:"#{i["K"]}",created_at:"#{i["L"]}",
            heavy_trash_quad:"#{i["O"]}",recycle_quad:"#{i["P"]}",trash_quad:"#{i["Q"]}",
            SLAStartTime:"#{i["R"]}",ResolutionDate:"#{i["T"]}",CloseDate:"#{i["U"]}",
            latitude:"#{i["V"]}",longitude:"#{i["W"]}",garbage_route: "#{i["X"]}}",
            recycle_route: "#{i["Y"]}",garbage_day: "#{i["Z"]}",district: "#{i["AA"]}",
            recycle_day: "#{i["AB"]}",heavy_trash_day: "#{i["AC"]}",department:"#{i["G"]}")
        end
      }

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
        i.all.map {|i|
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
          i.save
        else
          i.overdue = 1
          i.save
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
          i.save
        else
          i.overdue = 1
          i.save
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
          i.save
        else
          i.overdue = 1
          i.save
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
          i.save
        else
          i.overdue = 1
          i.save
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
          i.save
        else
          i.overdue = 1
          i.save
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
          i.save
        else
          i.overdue = 1
          i.save
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
          i.save
        else
          i.overdue = 1
          i.save
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
          i.save
        else
          i.overdue = 1
          i.save
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
          i.save
        else
          i.overdue = 1
          i.save
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
          i.save
        else
          i.overdue = 1
          i.save
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
          i.save
        else
          i.overdue = 1
          i.save
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
          i.save
        else
          i.overdue = 1
          i.save
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
          i.save
        else
          i.overdue = 1
          i.save
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
          i.save
        else
          i.overdue = 1
          i.save
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
  def self.sla
    all_sr= Sr.all
    all_sr.each{|i|
        if i.sr_type == "Non Residential Collection CANCEL"
          i.sla = 3
          i.save
        elsif i.sr_type == "Dead Animal Collection" ||  i.sr_type == "Missed Garbage Pickup" || i.sr_type == "Missed Recycling Pickup"
          i.sla = 4
          i.save
        elsif i.sr_type == "Add A Cart" || i.sr_type== "Spilled Debris" || i.sr_type== "Storm Debris Collection"
          i.sla = 5
          i.save
        elsif i.sr_type == "Missed Yard Waste Pickup"
          i.sla = 6
          i.save
        elsif i.sr_type ==  "Missed Heavy Trash Pickup"
          i.sla = 7
          i.save
        elsif i.sr_type == "Order Bag Tags"
          i.sla = 9
          i.save
        elsif i.sr_type ==  "Container Problem"||i.sr_type ==  "Dumpster Permit"||i.sr_type == "Neighborhood Clean up"||
          i.sr_type== "Non Residential Collection Service NEW"
          i.sla = 10
          i.save
        elsif i.sr_type == "New Move In Service"
          i.sla = 11
          i.save
        elsif i.sr_type == "Container Placement"|| i.sr_type == "New Resident Container"
          i.sla = 12
          i.save
        elsif i.sr_type == "Add A Can"|| i.sr_type == "Recycling Cart Repair or Replace"
          i.sla = 14
          i.save
        elsif i.sr_type == "Add A Cart CANCELLATION"
          i.sla = 16
          i.save
        elsif i.sr_type == "Add A Can CANCELLATION"
          i.sla = 19
          i.save
        elsif i.sr_type == "Dumpster Complaint"
          i.sla = 21
          i.save
        elsif i.sr_type == "Spilled Debris"
          i.sla = 24
          i.save
        elsif i.sr_type == "SWM Escalation"
          i.sla = 27
          i.save
        elsif i.sr_type == "Trash Dumping or Illegal Dumpsite"
          i.sla = 29
          i.save
        elsif i.sr_type == "Property Damage"
          i.sla = 30
          i.save
        else
          puts "#{i.sr_type}"
        end
      }
  end
  def self.quad_assignment
    service_types = Sr.all
    service_types.each {|i|
        if i.sr_type == "Non Residential Collection CANCEL" || "Non Residential Collection CANCEL"
          i.quad_status = "#{i.garbage_quad}"
          i.save
        elsif i.sr_type == "Missed Recycling Pickup"
          i.quad_status = "#{i.recycle_quad}"
        elsif i.sr_type == "Dead Animal Collection"
          i.quad_status= "#{i.garbage_quad}"
          i.save
        elsif i.sr_type == "Add A Cart" || i.sr_type== "Spilled Debris" || i.sr_type== "Storm Debris Collection"
          i.quad_status = "#{i.garbage_quad}"
          i.save
        elsif i.sr_type == "Missed Yard Waste Pickup" || "Missed Yard Waste Pickup"
          i.quad_status= "#{i.garbage_quad}"
          i.save
        elsif i.sr_type ==  "Missed Heavy Trash Pickup"
          i.quad_status= "#{i.heavy_trash_quad}"
          i.save
        elsif i.sr_type == "Order Bag Tags"
          i.quad_status= "#{i.garbage_quad}"
          i.save
        elsif i.sr_type ==  "Container Problem"||i.sr_type ==  "Dumpster Permit"||i.sr_type == "Neighborhood Clean up"||
          i.sr_type== "Non Residential Collection Service NEW"
          i.quad_status= "#{i.garbage_quad}"
          i.save
        elsif i.sr_type == "New Move In Service"
          i.quad_status= "#{i.garbage_quad}"
          i.save
        elsif i.sr_type == "Container Placement"|| i.sr_type == "New Resident Container"
          i.quad_status= "#{i.garbage_quad}"
          i.save
        elsif i.sr_type == "Add A Can"|| i.sr_type == "Recycling Cart Repair or Replace"
          i.quad_status= "#{i.garbage_quad}"
          i.save
        elsif i.sr_type == "Add A Cart CANCELLATION"
          i.quad_status= "#{i.garbage_quad}"
          i.save
        elsif i.sr_type == "Add A Can CANCELLATION"
          i.quad_status= "#{i.garbage_quad}"
          i.save
        elsif i.sr_type == "Dumpster Complaint"
          i.quad_status= "#{i.garbage_quad}"
          i.save
        elsif i.sr_type == "Spilled Debris"
          i.quad_status= "#{i.garbage_quad}"
          i.save
        elsif i.sr_type == "SWM Escalation"
          i.quad_status= "#{i.garbage_quad}"
          i.save
        elsif i.sr_type == "Trash Dumping or Illegal Dumpsite"
          i.quad_status= "#{i.garbage_quad}"
          i.save
        elsif i.sr_type == "Property Damage"
          i.quad_status= "#{i.garbage_quad}"
          i.save
        else
          puts "#{i.sr_type}"
        end
  }
  end
end

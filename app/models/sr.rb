class Sr < ApplicationRecord
    def self.sla_nil_resolution
      nil_quad = Sr.where(:status => 'Open', sla: [nil, ""])
      nil_quad.each{|sr|
        if sr.sr_type == 'Missed Garbage Pickup'
          sr.sla = 4
          sr.overdue = (sr.created_at - DateTime.now)/(60*60*24) + sr.sla
          sr.save
        elsif sr.sr_type == 'Missed Yard Waste Pickup'
          sr.sla = 6
          sr.overdue = (sr.created_at - DateTime.now)/(60*60*24) + sr.sla
          sr.save
        elsif sr.sr_type == 'Missed Heavy Trash Pickup'
          sr.sla = 7
          sr.overdue = (sr.created_at - DateTime.now)/(60*60*24) + sr.sla
          sr.save
        elsif sr.sr_type == 'Dead Animal Collection'
          sr.sla = 4
          sr.overdue = (sr.created_at - DateTime.now)/(60*60*24) + sr.sla
          sr.save
        elsif sr.sr_type == 'Missed Recycling Pickup'
          sr.sla = 4
          sr.overdue = (sr.created_at - DateTime.now)/(60*60*24) + sr.sla
          sr.save
        elsif sr.sr_type == 'Container Problem'
          sr.sla = 10
          sr.overdue = (sr.created_at - DateTime.now)/(60*60*24) + sr.sla
          sr.save
        else
          puts "#{sr}"
        end
        }
    end
    def self.quad_expression
      open_sr = Sr.where(:department=> "SWM Solid Waste Management", :status => "Open")
      open_sr.each{|sr|
            if sr.expression == 'Overdue' && sr.trash_quad == 'NE'
                  sr.quad_status = 'NE_Overdue'
            elsif sr.expression == 'Overdue' && sr.garbage_quad == 'NE'
              # binding.pry
                  sr.quad_status = 'NE_Overdue'
            elsif sr.expression == 'Not Overdue' && sr.trash_quad == 'NE'
                  sr.quad_status = 'NE_Not_Overdue'
            elsif sr.expression == 'Not Overdue' && sr.garbage_quad == 'NE'
                  sr.quad_status = 'NE_Not_Overdue'
              # binding.pry
            elsif sr.expression == 'Overdue' && sr.trash_quad == 'SE'
                   sr.quad_status = 'SE_Overdue'
            elsif sr.expression == 'Overdue' && sr.garbage_quad == 'SE'
                  sr.quad_status = 'SE_Overdue'
            elsif sr.expression == 'Not Overdue' && sr.trash_quad == 'SE'
                  sr.quad_status = 'SE_Not_Overdue'
            elsif sr.expression == 'Not Overdue' && sr.garbage_quad == 'SE'
                  sr.quad_status = 'SE_Not_Overdue'
            elsif sr.expression == 'Overdue' && sr.trash_quad == 'SW'
                  sr.quad_status = 'SW_Overdue'
            elsif sr.expression == 'Overdue' && sr.garbage_quad == 'SW'
                  sr.quad_status = 'SW_Overdue'
            elsif sr.expression == 'Not Overdue' && sr.trash_quad == 'SW'
                  sr.quad_status = 'SW_Not_Overdue'
            elsif sr.expression == 'Not Overdue' && sr.garbage_quad == 'SW'
                  sr.quad_status = 'SW_Not_Overdue'
            elsif sr.expression == 'Overdue' && sr.trash_quad == 'NW'
                  sr.quad_status = 'NW_Overdue'
            elsif sr.expression == 'Overdue' && sr.garbage_quad == 'NW'
                  sr.quad_status = 'NW_Overdue'
            elsif sr.expression == 'Not Overdue' && sr.trash_quad == 'NW'
                  sr.quad_status = 'NW_Not_Overdue'
            elsif sr.expression == 'Not Overdue' && sr.garbage_quad == 'NW'
                  sr.quad_status = 'NW_Not_Overdue'
            else
                  puts "#{sr}"
            end
            sr.save}
  end
  def self.sr_count
  open_sr = Sr.where(:department=> "SWM Solid Waste Management", :status => "Open")
  open_sr.each{|sr|
    if sr.department == 'SWM Solid Waste Management' && sr.expression == 'Overdue' && sr.trash_quad == 'NE'
       sr.ne_overdue = 1
    elsif sr.department == 'SWM Solid Waste Management' && sr.expression == 'Overdue' && sr.trash_quad == 'NW'
      sr.nw_overdue = 1
    elsif sr.department == 'SWM Solid Waste Management' && sr.expression == 'Overdue' && sr.trash_quad == 'SW'
      sr.sw_overdue = 1
    elsif sr.department == 'SWM Solid Waste Management' && sr.expression == 'Overdue' && sr.trash_quad == 'SE'
      sr.se_overdue = 1
    elsif sr.department == 'SWM Solid Waste Management' && sr.expression == 'Not Overdue' && sr.trash_quad == 'SE' && sr.se_overdue != 1
      sr.se_not_overdue = 1
    elsif sr.department == 'SWM Solid Waste Management' && sr.expression == 'Not Overdue' && sr.trash_quad == 'SW' && sr.sw_overdue != 1
      sr.sw_not_overdue = 1
    elsif sr.department == 'SWM Solid Waste Management' && sr.expression == 'Not Overdue' && sr.trash_quad == 'NW' && sr.nw_overdue != 1
      sr.nw_not_overdue = 1
    elsif sr.department == 'SWM Solid Waste Management' && sr.expression == 'Not Overdue' && sr.trash_quad == 'NE' && sr.ne_overdue != 1
      sr.ne_not_overdue = 1
    end
    sr.save
    }
  end
  def self.overdue
    overdue_open_srs = Sr.where(:overdue => 0..400,:department => 'SWM Solid Waste Management', :status => 'Open')
    overdue_open_srs.each{|sr|
      if sr.department == 'SWM Solid Waste Management'
      then
        sr.expression = "Overdue"
        sr.save
      else
        puts "#{sr}"
      end
      }
    not_overdue_open_srs = Sr.where(:overdue => -400..-1,:department => 'SWM Solid Waste Management', :status => 'Open')
    not_overdue_open_srs.each{|sr|
      if sr.department == 'SWM Solid Waste Management'
      then
        sr.expression = "Not Overdue"
        sr.save
      else
        puts "#{sr}"
      end
    }
    open_srs = Sr.where(:overdue => -400..400,:department => 'SWM Solid Waste Management', :status => 'Open')
    open_srs
  end
  def self.sent_chain(methods)
    methods.inject(self, :send)
  end
  scope :OpenOverdue, ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open").count)}
  scope :OpenGrandTotal, ->{(where(:department=> "SWM Solid Waste Management", :status => "Open").count)}
  scope :NEOpenOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE").count)}
  scope :NWOpenOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW").count)}
  scope :SEOpenOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE").count)}
  scope :SWOpenOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW").count)}
  scope :NEIllegalDumpOpenOverdueDesc,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Trash Dumping or Illegal Dumpsite"))}
  scope :NEIllegalDumpOpenOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Trash Dumping or Illegal Dumpsite").count)}
  scope :NEIllegalDumpOpenNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Trash Dumping or Illegal Dumpsite").count)}
  scope :NEIllegalDumpOpenTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Trash Dumping or Illegal Dumpsite").count)}
  scope :NEMissedRecyclingOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Recycling Pickup").count)}
  scope :NEMissedRecyclingNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Recycling Pickup").count)}
  scope :NEMissedRecyclingTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Recycling Pickup").count)}
  scope :NEContainerProblemOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Container Problem").count)}
  scope :NEContainerProblemNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Container Problem").count)}
  scope :NEContainerProblemTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Container Problem").count)}
  scope :NEMissedGarbageOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Garbage Pickup").count)}
  scope :NEMissedGarbageNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Garbage Pickup").count)}
  scope :NEMissedGarbageTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Garbage Pickup").count)}
  scope :NEMissedHeavyOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Heavy Trash Pickup").count)}
  scope :NEMissedHeavyNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Heavy Trash Pickup").count)}
  scope :NEMissedHeavyTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Heavy Trash Pickup").count)}
  scope :NEMissedRecycleOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Recycling Pickup").count)}
  scope :NEMissedRecycleNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Recycling Pickup").count)}
  scope :NEMissedRecycleTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Recycling Pickup").count)}
  scope :NESWMEscalationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "SWM Escalation").count)}
  scope :NESWMEscalationNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "SWM Escalation").count)}
  scope :NESWMEscalationTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "SWM Escalation").count)}
  scope :NERecyclingCartRepairOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Recycling Cart Repair or Replace").count)}
  scope :NERecyclingCartRepairNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Recycling Cart Repair or Replace").count)}
  scope :NERecyclingCartRepairTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Recycling Cart Repair or Replace").count)}
  scope :NENewRecyclingOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Recycling Participation NEW").count)}
  scope :NENewRecyclingNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Recycling Participation NEW").count)}
  scope :NENewRecyclingTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Recycling Participation NEW").count)}
  scope :NEMissedYardWasteOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Yard Waste Pickup").count)}
  scope :NEMissedYardWasteNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Yard Waste Pickup").count)}
  scope :NEMissedYardWasteTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Yard Waste Pickup").count)}
  scope :NESWMEscalationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "SWM Escalation").count)}
  scope :NESWMEscalationNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "SWM Escalation").count)}
  scope :NESWMEscalationTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "SWM Escalation").count)}
  scope :NEDeadAnimalCollectionOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Dead Animal Collection").count)}
  scope :NEDeadAnimalCollectionNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Dead Animal Collection").count)}
  scope :NEDeadAnimalCollectionTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Dead Animal Collection").count)}
  scope :NENewResidentContainerOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "New Resident Container").count)}
  scope :NENewResidentContainerNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "New Resident Container").count)}
  scope :NENewResidentContainerTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "New Resident Container").count)}
  scope :NEAddACanOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Can").count)}
  scope :NEAddACanNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Can").count)}
  scope :NEAddACanTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Can").count)}
  scope :NEStormDebrisCollectionOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Storm Debris Collection").count)}
  scope :NEStormDebrisCollectionNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Storm Debris Collection").count)}
  scope :NEStormDebrisCollectionTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Storm Debris Collection").count)}
  scope :NEDumpsterComplaintOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Dumpster Complaint").count)}
  scope :NEDumpsterComplaintNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Dumpster Complaint").count)}
  scope :NEDumpsterComplaintTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Dumpster Complaint").count)}
  scope :NEAddACanCANCELLATIONOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Can CANCELLATION").count)}
  scope :NEAddACanCANCELLATIONNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Can CANCELLATION").count)}
  scope :NEAddACanCANCELLATIONTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Can CANCELLATION").count)}
  scope :NENonResidCollectionNewOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Non Residential Collection Service NEW").count)}
  scope :NENonResidCollectionNewNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Non Residential Collection Service NEW").count)}
  scope :NENonResidCollectionNewTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Non Residential Collection Service NEW").count)}
  scope :NESpilledDebrisOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Spilled Debris").count)}
  scope :NESpilledDebrisNOtOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Spilled Debris").count)}
  scope :NESpilledDebrisTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Spilled Debris").count)}
  scope :NENewMoveInServiceOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "New Move In Service").count)}
  scope :NESpilledDebrisNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Spilled Debris").count)}
  scope :NENewMoveInServiceTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "New Move In Service").count)}
  scope :NERecycleCartRetrieveOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Recycle Bin/Cart Retrieve").count)}
  scope :NESpilledDebrisNotOverdue,  ->{(where(:overdue => -300..00, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Spilled Debris").count)}
  scope :NERecycleCartRetrieveTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Recycle Bin/Cart Retrieve").count)}
  scope :NEContainerPlacementOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Container Placement").count)}
  scope :NEContainerPlacementNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Container Placement").count)}
  scope :NEContainerPlacementTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Container Placement").count)}
  scope :NEPropertyDamageOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Property Damage").count)}
  scope :NEPropertyDamageNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Property Damage").count)}
  scope :NEPropertyDamageTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Property Damage").count)}
  scope :NENonResidentialCollectionCancelOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Non Residential Collection CANCEL").count)}
  scope :NENonResidentialCollectionCancelNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Non Residential Collection CANCEL").count)}
  scope :NENonResidentialCollectionCancelTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Non Residential Collection CANCEL").count)}
  scope :NEAddACartCancellationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Cart CANCELLATION").count)}
  scope :NEAddACartCancellationNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Cart CANCELLATION").count)}
  scope :NEAddACartCancellationTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Cart CANCELLATION").count)}
  scope :NEAddABinOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Bin").count)}
  scope :NEAddABinNotoverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Bin").count)}
  scope :NEAddABinTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Bin").count)}
  scope :NEAddACartOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Cart").count)}
  scope :NEAddACartNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Cart").count)}
  scope :NEAddACartTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Cart").count)}
  scope :NENewResidentInPrivateDevelopmentOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "New Resident in Private Development").count)}
  scope :NENewResidentInPrivateDevelopmentNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "New Resident in Private Development").count)}
  scope :NENewResidentInPrivateDevelopmentTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "New Resident in Private Development").count)}
  scope :NEOrderBagTagsOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Order Bag Tags").count)}
  scope :NEOrderBagTagsNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Order Bag Tags").count)}
  scope :NEOrderBagTagsTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Order Bag Tags").count)}
  scope :NENeighborhoodCleanUpOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Neighborhood Clean up").count)}
  scope :NENeighborhoodCleanUpNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Neighborhood Clean up").count)}
  scope :NENeighborhoodCleanUpTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Neighborhood Clean up").count)}
  scope :NEDumpsterPermitOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Dumpster Permit").count)}
  scope :NEDumpsterPermitNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Dumpster Permit").count)}
  scope :NEDumpsterPermitTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Dumpster Permit").count)}
  scope :NWIllegalDumpOpenOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Trash Dumping or Illegal Dumpsite").count)}
  scope :NWIllegalDumpOpenNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Trash Dumping or Illegal Dumpsite").count)}
  scope :NWIllegalDumpOpenTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Trash Dumping or Illegal Dumpsite").count)}
  scope :NWMissedRecyclingOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Recycling Pickup").count)}
  scope :NWMissedRecyclingNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Recycling Pickup").count)}
  scope :NWMissedRecyclingTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Recycling Pickup").count)}
  scope :NWContainerProblemOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Container Problem").count)}
  scope :NWContainerProblemNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Container Problem").count)}
  scope :NWContainerProblemTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Container Problem").count)}
  scope :NWMissedGarbageOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Garbage Pickup").count)}
  scope :NWMissedGarbageOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Garbage Pickup").count)}
  scope :NWMissedGarbageTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Garbage Pickup").count)}
  scope :NWMissedHeavyOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Heavy Trash Pickup").count)}
  scope :NWMissedHeavyNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Heavy Trash Pickup").count)}
  scope :NWMissedHeavyTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Heavy Trash Pickup").count)}
  scope :NWMissedRecycleOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Recycling Pickup").count)}
  scope :NWMissedRecycleNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Recycling Pickup").count)}
  scope :NWMissedRecycleTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Recycling Pickup").count)}
  scope :NWSWMEscalationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "SWM Escalation").count)}
  scope :NWSWMEscalationOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "SWM Escalation").count)}
  scope :NWSWMEscalationTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "SWM Escalation").count)}
  scope :NWRecyclingCartRepairOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Recycling Cart Repair or Replace").count)}
  scope :NWRecyclingCartRepairNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Recycling Cart Repair or Replace").count)}
  scope :NWRecyclingCartRepairTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Recycling Cart Repair or Replace").count)}
  scope :NWNewRecyclingOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Recycling Participation NEW").count)}
  scope :NWNewRecyclingNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Recycling Participation NEW").count)}
  scope :NWNewRecyclingTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Recycling Participation NEW").count)}
  scope :NWMissedYardWasteOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Yard Waste Pickup").count)}
  scope :NWMissedYardWasteNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Yard Waste Pickup").count)}
  scope :NWMissedYardWasteTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Yard Waste Pickup").count)}
  scope :NWSWMEscalationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "SWM Escalation").count)}
  scope :NWSWMEscalationNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "SWM Escalation").count)}
  scope :NWSWMEscalationTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "SWM Escalation").count)}
  scope :NWDeadAnimalCollectionOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Dead Animal Collection").count)}
  scope :NWDeadAnimalCollectionNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Dead Animal Collection").count)}
  scope :NWDeadAnimalCollectionTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Dead Animal Collection").count)}
  scope :NWNewResidentContainerOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "New Resident Container").count)}
  scope :NWNewResidentContainerNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "New Resident Container").count)}
  scope :NWNewResidentContainerTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "New Resident Container").count)}
  scope :NWAddACanOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Add A Can").count)}
  scope :NWAddACanNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Add A Can").count)}
  scope :NWAddACanTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Add A Can").count)}
  scope :NWStormDebrisCollectionOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Storm Debris Collection").count)}
  scope :NWStormDebrisCollectionNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Storm Debris Collection").count)}
  scope :NWStormDebrisCollectionTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Storm Debris Collection").count)}
  scope :NWDumpsterComplaintOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Dumpster Complaint").count)}
  scope :NWDumpsterComplaintNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Dumpster Complaint").count)}
  scope :NWDumpsterComplaintTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Dumpster Complaint").count)}
  scope :SWNonResidCollectionNewOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Non Residential Collection Service NEW").count)}
  scope :SWNonResidCollectionNewNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Non Residential Collection Service NEW").count)}
  scope :SWNonResidCollectionNewTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Non Residential Collection Service NEW").count)}
  scope :SWSpilledDebrisOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Spilled Debris").count)}
  scope :SWSpilledDebrisNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Spilled Debris").count)}
  scope :SWSpilledDebrisTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Spilled Debris").count)}
  scope :SWNewMoveInServiceOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "New Move In Service").count)}
  scope :SWNewMoveInServiceNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "New Move In Service").count)}
  scope :SWNewMoveInServiceTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "New Move In Service").count)}
  scope :SWRecycleCartRetrieveOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Recycle Bin/Cart Retrieve").count)}
  scope :SWRecycleCartRetrieveNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Recycle Bin/Cart Retrieve").count)}
  scope :SWRecycleCartRetrieveTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Recycle Bin/Cart Retrieve").count)}
  scope :SWContainerPlacementOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Container Placement").count)}
  scope :SWContainerPlacementNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Container Placement").count)}
  scope :SWContainerPlacementTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Container Placement").count)}
  scope :SWPropertyDamageOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Property Damage").count)}
  scope :SWContainerPlacementNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Container Placement").count)}
  scope :SWPropertyDamageTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Property Damage").count)}
  scope :SWNonResidentialCollectionCancelOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Non Residential Collection CANCEL").count)}
  scope :SWNonResidentialCollectionCancelNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Non Residential Collection CANCEL").count)}
  scope :SWNonResidentialCollectionCancelTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Non Residential Collection CANCEL").count)}
  scope :SWAddACartCancellationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Cart CANCELLATION").count)}
  scope :SWAddACartCancellationNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Cart CANCELLATION").count)}
  scope :SWAddACartCancellationTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Cart CANCELLATION").count)}
  scope :SWAddABinOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Bin").count)}
  scope :SWAddABinNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Bin").count)}
  scope :SWAddABinTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Bin").count)}
  scope :SWAddACartOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Cart").count)}
  scope :SWAddACartOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Cart").count)}
  scope :SWAddACartTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Cart").count)}
  scope :SWNewResidentInPrivateDevelopmentOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "New Resident in Private Development").count)}
  scope :SWNewResidentInPrivateDevelopmentNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "New Resident in Private Development").count)}
  scope :SWNewResidentInPrivateDevelopmentTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "New Resident in Private Development").count)}
  scope :SWOrderBagTagsOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Order Bag Tags").count)}
  scope :SWOrderBagTagsNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Order Bag Tags").count)}
  scope :SWOrderBagTagsTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Order Bag Tags").count)}
  scope :SWNeighborhoodCleanUpOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Neighborhood Clean up").count)}
  scope :SWNeighborhoodCleanUpNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Neighborhood Clean up").count)}
  scope :SWNeighborhoodCleanUpTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Neighborhood Clean up").count)}
  scope :SWDumpsterPermitOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Dumpster Permit").count)}
  scope :SWDumpsterPermitOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Dumpster Permit").count)}
  scope :SWDumpsterPermitTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Dumpster Permit").count)}
  scope :SWIllegalDumpOpenOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Trash Dumping or Illegal Dumpsite").count)}
  scope :SWIllegalDumpOpenNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Trash Dumping or Illegal Dumpsite").count)}
  scope :SWIllegalDumpOpenTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Trash Dumping or Illegal Dumpsite").count)}
  scope :SWMissedRecyclingOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Recycling Pickup").count)}
  scope :SWMissedRecyclingNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Recycling Pickup").count)}
  scope :SWMissedRecyclingTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Recycling Pickup").count)}
  scope :SWContainerProblemOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Container Problem").count)}
  scope :SWContainerProblemNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Container Problem").count)}
  scope :SWContainerProblemTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Container Problem").count)}
  scope :SWMissedGarbageOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Garbage Pickup").count)}
  scope :SWMissedGarbageNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Garbage Pickup").count)}
  scope :SWMissedGarbageTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Garbage Pickup").count)}
  scope :SWMissedHeavyOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Heavy Trash Pickup").count)}
  scope :SWMissedHeavyNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Heavy Trash Pickup").count)}
  scope :SWMissedHeavyTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Heavy Trash Pickup").count)}
  scope :SWMissedRecycleOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Recycling Pickup").count)}
  scope :SWMissedRecycleNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Recycling Pickup").count)}
  scope :SWMissedRecycleTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Recycling Pickup").count)}
  scope :SWSWMEscalationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "SWM Escalation").count)}
  scope :SWSWMEscalationNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "SWM Escalation").count)}
  scope :SWSWMEscalationTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "SWM Escalation").count)}
  scope :SWRecyclingCartRepairOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Recycling Cart Repair or Replace").count)}
  scope :SWRecyclingCartRepairNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Recycling Cart Repair or Replace").count)}
  scope :SWRecyclingCartRepairTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Recycling Cart Repair or Replace").count)}
  scope :SWNewRecyclingOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Recycling Participation NEW").count)}
  scope :SWNewRecyclingOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Recycling Participation NEW").count)}
  scope :SWNewRecyclingTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Recycling Participation NEW").count)}
  scope :SWMissedYardWasteOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Yard Waste Pickup").count)}
  scope :SWMissedYardWasteNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Yard Waste Pickup").count)}
  scope :SWMissedYardWasteTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Yard Waste Pickup").count)}
  scope :SWSWMEscalationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "SWM Escalation").count)}
  scope :SWSWMEscalationOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "SWM Escalation").count)}
  scope :SWSWMEscalationTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "SWM Escalation").count)}
  scope :SWDeadAnimalCollectionOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Dead Animal Collection").count)}
  scope :SWDeadAnimalCollectionNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Dead Animal Collection").count)}
  scope :SWDeadAnimalCollectionTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Dead Animal Collection").count)}
  scope :SWAddACanOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Can").count)}
  scope :SWAddACanNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Can").count)}
  scope :SWAddACanTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Can").count)}
  scope :SWStormDebrisCollectionOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Storm Debris Collection").count)}
  scope :SWStormDebrisCollectionNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Storm Debris Collection").count)}
  scope :SWStormDebrisCollectionTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Storm Debris Collection").count)}
  scope :SWDumpsterComplaintOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Dumpster Complaint").count)}
  scope :SWDumpsterComplaintNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Dumpster Complaint").count)}
  scope :SWDumpsterComplaintTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Dumpster Complaint").count)}
  scope :SWAddACanCANCELLATIONOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Can CANCELLATION").count)}
  scope :SWAddACanCANCELLATIONNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Can CANCELLATION").count)}
  scope :SWAddACanCANCELLATIONTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Can CANCELLATION").count)}
  scope :SWNonResidCollectionNewOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Non Residential Collection Service NEW").count)}
  scope :SWNonResidCollectionNewNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Non Residential Collection Service NEW").count)}
  scope :SWNonResidCollectionNewTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Non Residential Collection Service NEW").count)}
  scope :SWSpilledDebrisOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Spilled Debris").count)}
  scope :SWSpilledDebrisNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Spilled Debris").count)}
  scope :SWSpilledDebrisTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Spilled Debris").count)}
  scope :SWNewMoveInServiceOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "New Move In Service").count)}
  scope :SWNewMoveInServiceNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "New Move In Service").count)}
  scope :SWNewMoveInServiceTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "New Move In Service").count)}
  scope :SWRecycleCartRetrieveOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Recycle Bin/Cart Retrieve").count)}
  scope :SWRecycleCartRetrieveOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Recycle Bin/Cart Retrieve").count)}
  scope :SWRecycleCartRetrieveTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Recycle Bin/Cart Retrieve").count)}
  scope :SWContainerPlacementOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Container Placement").count)}
  scope :SWContainerPlacementNotOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Container Placement").count)}
  scope :SWContainerPlacementTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Container Placement").count)}
  scope :SWPropertyDamageOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Property Damage").count)}
  scope :SWPropertyDamageNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Property Damage").count)}
  scope :SWPropertyDamageTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Property Damage").count)}
  scope :SWNonResidentialCollectionCancelOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Non Residential Collection CANCEL").count)}
  scope :SWNonResidentialCollectionCancelNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Non Residential Collection CANCEL").count)}
  scope :SWNonResidentialCollectionCancelTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Non Residential Collection CANCEL").count)}
  scope :SWAddACartCancellationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Cart CANCELLATION").count)}
  scope :SWAddACartCancellationNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Cart CANCELLATION").count)}
  scope :SWAddACartCancellationTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Cart CANCELLATION").count)}
  scope :SWAddABinOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Bin").count)}
  scope :SWAddABinNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Bin").count)}
  scope :SWAddABinTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Bin").count)}
  scope :SWAddACartOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Cart").count)}
  scope :SWAddACartNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Cart").count)}
  scope :SWAddACartTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Cart").count)}
  scope :SWNewResidentInPrivateDevelopmentOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "New Resident in Private Development").count)}
  scope :SWNewResidentInPrivateDevelopmentNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "New Resident in Private Development").count)}
  scope :SWNewResidentInPrivateDevelopmentTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "New Resident in Private Development").count)}
  scope :SWOrderBagTagsOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Order Bag Tags").count)}
  scope :SWOrderBagTagsNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Order Bag Tags").count)}
  scope :SWOrderBagTagsTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Order Bag Tags").count)}
  scope :SWNeighborhoodCleanUpOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Neighborhood Clean up").count)}
  scope :SWNeighborhoodCleanUpNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Neighborhood Clean up").count)}
  scope :SWNeighborhoodCleanUpTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Neighborhood Clean up").count)}
  scope :SWDumpsterPermitOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Dumpster Permit").count)}
  scope :SWDumpsterPermitNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Dumpster Permit").count)}
  scope :SWDumpsterPermitTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Dumpster Permit").count)}
  scope :SWDumpsterPermitOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Dumpster Permit").count)}
  scope :SWDumpsterPermitNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Dumpster Permit").count)}
  scope :SWDumpsterPermitTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Dumpster Permit").count)}
  scope :SEMissedRecyclingOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Recycling Pickup").count)}
  scope :SEMissedRecyclingNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Recycling Pickup").count)}
  scope :SEMissedRecyclingTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Recycling Pickup").count)}
  scope :SEContainerProblemOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Container Problem").count)}
  scope :SEContainerProblemNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Container Problem").count)}
  scope :SEContainerProblemTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Container Problem").count)}
  scope :SEMissedGarbageOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Garbage Pickup").count)}
  scope :SEMissedGarbageNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Garbage Pickup").count)}
  scope :SEMissedGarbageTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Garbage Pickup").count)}
  scope :SEMissedHeavyOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Heavy Trash Pickup").count)}
  scope :SEMissedHeavyNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Heavy Trash Pickup").count)}
  scope :SEMissedHeavyTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Heavy Trash Pickup").count)}
  scope :SEMissedRecycleOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Recycling Pickup").count)}
  scope :SEMissedRecycleNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Recycling Pickup").count)}
  scope :SEMissedRecycleTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Recycling Pickup").count)}
  scope :SESWMEscalationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "SWM Escalation").count)}
  scope :SESWMEscalationNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "SWM Escalation").count)}
  scope :SESWMEscalationTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "SWM Escalation").count)}
  scope :SERecyclingCartRepairOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Recycling Cart Repair or Replace").count)}
  scope :SERecyclingCartRepairNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Recycling Cart Repair or Replace").count)}
  scope :SERecyclingCartRepairTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Recycling Cart Repair or Replace").count)}
  scope :SENewRecyclingOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Recycling Participation NEW").count)}
  scope :SENewRecyclingOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Recycling Participation NEW").count)}
  scope :SENewRecyclingTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Recycling Participation NEW").count)}
  scope :SEMissedYardWasteOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Yard Waste Pickup").count)}
  scope :SEMissedYardWasteNOtOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Yard Waste Pickup").count)}
  scope :SEMissedYardWasteTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Yard Waste Pickup").count)}
  scope :SESWMEscalationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "SWM Escalation").count)}
  scope :SESWMEscalationOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "SWM Escalation").count)}
  scope :SESWMEscalationTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "SWM Escalation").count)}
  scope :SEDeadAnimalCollectionOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Dead Animal Collection").count)}
  scope :SEDeadAnimalCollectionNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Dead Animal Collection").count)}
  scope :SEDeadAnimalCollectionTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Dead Animal Collection").count)}
  scope :SENewResidentContainerOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "New Resident Container").count)}
  scope :SENewResidentContainerNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "New Resident Container").count)}
  scope :SENewResidentContainerTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "New Resident Container").count)}
  scope :SEAddACanOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Can").count)}
  scope :SEAddACanNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Can").count)}
  scope :SEAddACanTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Can").count)}
  scope :SEStormDebrisCollectionOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Storm Debris Collection").count)}
  scope :SEStormDebrisCollectionOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Storm Debris Collection").count)}
  scope :SEStormDebrisCollectionTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Storm Debris Collection").count)}
  scope :SEDumpsterComplaintOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Dumpster Complaint").count)}
  scope :SEDumpsterComplaintNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Dumpster Complaint").count)}
  scope :SEDumpsterComplaintTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Dumpster Complaint").count)}
  scope :SEAddACanCANCELLATIONOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Can CANCELLATION").count)}
  scope :SEAddACanCANCELLATIONNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Can CANCELLATION").count)}
  scope :SEAddACanCANCELLATIONTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Can CANCELLATION").count)}
  scope :SENonResidCollectionNewOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Non Residential Collection Service NEW").count)}
  scope :SENonResidCollectionNewNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Non Residential Collection Service NEW").count)}
  scope :SENonResidCollectionNewTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Non Residential Collection Service NEW").count)}
  scope :SESpilledDebrisOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Spilled Debris").count)}
  scope :SESpilledDebrisNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Spilled Debris").count)}
  scope :SESpilledDebrisTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Spilled Debris").count)}
  scope :SENewMoveInServiceOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "New Move In Service").count)}
  scope :SENewMoveInServiceNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "New Move In Service").count)}
  scope :SENewMoveInServiceTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "New Move In Service").count)}
  scope :SERecycleCartRetrieveOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Recycle Bin/Cart Retrieve").count)}
  scope :SERecycleCartRetrieveNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Recycle Bin/Cart Retrieve").count)}
  scope :SERecycleCartRetrieveTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Recycle Bin/Cart Retrieve").count)}
  scope :SEContainerPlacementOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Container Placement").count)}
  scope :SEContainerPlacementOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Container Placement").count)}
  scope :SEContainerPlacementTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Container Placement").count)}
  scope :SEPropertyDamageOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Property Damage").count)}
  scope :SEPropertyDamageNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Property Damage").count)}
  scope :SEPropertyDamageTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Property Damage").count)}
  scope :SENonResidentialCollectionCancelOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Non Residential Collection CANCEL").count)}
  scope :SENonResidentialCollectionCancelNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Non Residential Collection CANCEL").count)}
  scope :SENonResidentialCollectionCancelTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Non Residential Collection CANCEL").count)}
  scope :SEAddACartCancellationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Cart CANCELLATION").count)}
  scope :SEAddACartCancellationNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Cart CANCELLATION").count)}
  scope :SEAddACartCancellationTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Cart CANCELLATION").count)}
  scope :SEAddABinOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Bin").count)}
  scope :SEAddABinOverNotdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Bin").count)}
  scope :SEAddABinTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Bin").count)}
  scope :SEAddACartOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Cart").count)}
  scope :SEAddACartNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Cart").count)}
  scope :SEAddACartTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Cart").count)}
  scope :SENewResidentInPrivateDevelopmentOverdue,  ->{(where(:overdue => 1..300,:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "New Resident in Private Development").count)}
  scope :SENewResidentInPrivateDevelopmentNotOverdue,  ->{(where(:overdue => 300,:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "New Resident in Private Development").count)}
  scope :SENewResidentInPrivateDevelopmentTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "New Resident in Private Development").count)}
  scope :SEOrderBagTagsOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Order Bag Tags").count)}
  scope :SEOrderBagTagsNotOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Order Bag Tags").count)}
  scope :SEOrderBagTagsTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Order Bag Tags").count)}
  scope :SENeighborhoodCleanUpOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Neighborhood Clean up").count)}
  scope :SENeighborhoodCleanUpOverdue,  ->{(where(:overdue => -300..0, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Neighborhood Clean up").count)}
  scope :SENeighborhoodCleanUpTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Neighborhood Clean up").count)}
  scope :SESDumpsterPermitOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Dumpster Permit").count)}
  scope :SESDumpsterPermitNotOverdue,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Dumpster Permit").count)}
  scope :SESDumpsterPermitTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Dumpster Permit").count)}
end

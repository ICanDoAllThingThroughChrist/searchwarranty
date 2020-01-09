class Sr < ApplicationRecord
  scope :OpenOverdue, ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open").count)}
  scope :OpenGrandTotal, ->{(where(:department=> "SWM Solid Waste Management", :status => "Open").count)}
  scope :NEOpenOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE").count)}
  scope :NWOpenOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW").count)}
  scope :SEOpenOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE").count)}
  scope :SWOpenOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW").count)}
  scope :NEIllegalDumpOpenOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Trash Dumping or Illegal Dumpsite").count)}
  scope :NEMissedRecyclingOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Recycling Pickup").count)}
  scope :NEContainerProblemOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Container Problem").count)}
  scope :NEMissedGarbageOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Garbage Pickup").count)}
  scope :NEMissedHeavyOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Heavy Trash Pickup").count)}
  scope :NEMissedRecycleOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Recycling Pickup").count)}
  scope :NESWMEscalationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "SWM Escalation").count)}
  scope :NERecyclingCartRepairOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Recycling Cart Repair or Replace").count)}
  scope :NENewRecyclingOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Recycling Participation NEW").count)}
  scope :NEMissedYardWasteOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Missed Yard Waste Pickup").count)}
  scope :NESWMEscalationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "SWM Escalation").count)}
  scope :NEDeadAnimalCollectionOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Dead Animal Collection").count)}
  scope :NENewResidentContainerOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "New Resident Container").count)}
  scope :NEAddACanOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Can").count)}
  scope :NEStormDebrisCollectionOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Storm Debris Collection").count)}
  scope :NEDumpsterComplaintOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Dumpster Complaint").count)}
  scope :NEAddACanCANCELLATIONOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Can CANCELLATION").count)}
  scope :NENonResidCollectionNewOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Non Residential Collection Service NEW").count)}
  scope :NESpilledDebrisOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Spilled Debris").count)}
  scope :NENewMoveInServiceOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "New Move In Service").count)}
  scope :NERecycleCartRetrieveOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Recycle Bin/Cart Retrieve").count)}
  scope :NEContainerPlacementOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Container Placement").count)}
  scope :NEPropertyDamageOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Property Damage").count)}
  scope :NENonResidentialCollectionCancelOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Non Residential Collection CANCEL").count)}
  scope :NEAddACartCancellationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Cart CANCELLATION").count)}
  scope :NEAddABinOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Bin").count)}
  scope :NEAddACartOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Add A Cart").count)}
  scope :NENewResidentInPrivateDevelopmentOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "New Resident in Private Development").count)}
  scope :NEOrderBagTagsOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Order Bag Tags").count)}
  scope :NENeighborhoodCleanUpOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Neighborhood Clean up").count)}
  scope :NEDumpsterPermitOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NE", :sr_type => "Dumpster Permit").count)}
  scope :NWIllegalDumpOpenOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Trash Dumping or Illegal Dumpsite").count)}
  scope :NWMissedRecyclingOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Recycling Pickup").count)}
  scope :NWContainerProblemOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Container Problem").count)}
  scope :NWMissedGarbageOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Garbage Pickup").count)}
  scope :NWMissedHeavyOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Heavy Trash Pickup").count)}
  scope :NWMissedRecycleOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Recycling Pickup").count)}
  scope :NWSWMEscalationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "SWM Escalation").count)}
  scope :NWRecyclingCartRepairOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Recycling Cart Repair or Replace").count)}
  scope :NWNewRecyclingOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Recycling Participation NEW").count)}
  scope :NWMissedYardWasteOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Missed Yard Waste Pickup").count)}
  scope :NWSWMEscalationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "SWM Escalation").count)}
  scope :NWDeadAnimalCollectionOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Dead Animal Collection").count)}
  scope :NWNewResidentContainerOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "New Resident Container").count)}
  scope :NWAddACanOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Add A Can").count)}
  scope :NWStormDebrisCollectionOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Storm Debris Collection").count)}
  scope :NWDumpsterComplaintOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "NW", :sr_type => "Dumpster Complaint").count)}
  scope :SWAddACanCANCELLATIONOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Can CANCELLATION").count)}
  scope :NWNonResidCollectionNewOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Non Residential Collection Service NEW").count)}
  scope :NWSpilledDebrisOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Spilled Debris").count)}
  scope :NWNewMoveInServiceOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "New Move In Service").count)}
  scope :NWRecycleCartRetrieveOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Recycle Bin/Cart Retrieve").count)}
  scope :NWContainerPlacementOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Container Placement").count)}
  scope :NWPropertyDamageOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Property Damage").count)}
  scope :NWNonResidentialCollectionCancelOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Non Residential Collection CANCEL").count)}
  scope :NWAddACartCancellationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Cart CANCELLATION").count)}
  scope :NWAddABinOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Bin").count)}
  scope :NWAddACartOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Cart").count)}
  scope :NWNewResidentInPrivateDevelopmentOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "New Resident in Private Development").count)}
  scope :NWOrderBagTagsOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Order Bag Tags").count)}
  scope :NWNeighborhoodCleanUpOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Neighborhood Clean up").count)}
  scope :NWDumpsterPermitOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Dumpster Permit").count)}
  scope :SWIllegalDumpOpenOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Trash Dumping or Illegal Dumpsite").count)}
  scope :SWMissedRecyclingOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Recycling Pickup").count)}
  scope :SWContainerProblemOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Container Problem").count)}
  scope :SWMissedGarbageOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Garbage Pickup").count)}
  scope :SWMissedHeavyOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Heavy Trash Pickup").count)}
  scope :SWMissedRecycleOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Recycling Pickup").count)}
  scope :SWSWMEscalationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "SWM Escalation").count)}
  scope :SWRecyclingCartRepairOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Recycling Cart Repair or Replace").count)}
  scope :SWNewRecyclingOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Recycling Participation NEW").count)}
  scope :SWMissedYardWasteOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Missed Yard Waste Pickup").count)}
  scope :SWSWMEscalationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "SWM Escalation").count)}
  scope :SWDeadAnimalCollectionOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Dead Animal Collection").count)}
  scope :SWNewResidentContainerOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "New Resident Container").count)}
  scope :SWAddACanOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Can").count)}
  scope :SWStormDebrisCollectionOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Storm Debris Collection").count)}
  scope :SWDumpsterComplaintOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Dumpster Complaint").count)}
  scope :SWAddACanCANCELLATIONOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Can CANCELLATION").count)}
  scope :SWNonResidCollectionNewOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Non Residential Collection Service NEW").count)}
  scope :SWSpilledDebrisOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Spilled Debris").count)}
  scope :SWNewMoveInServiceOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "New Move In Service").count)}
  scope :SWRecycleCartRetrieveOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Recycle Bin/Cart Retrieve").count)}
  scope :SWContainerPlacementOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Container Placement").count)}
  scope :SWPropertyDamageOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Property Damage").count)}
  scope :SWNonResidentialCollectionCancelOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Non Residential Collection CANCEL").count)}
  scope :SWAddACartCancellationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Cart CANCELLATION").count)}
  scope :SWAddABinOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Bin").count)}
  scope :SWAddACartOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Add A Cart").count)}
  scope :SWNewResidentInPrivateDevelopmentOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "New Resident in Private Development").count)}
  scope :SWOrderBagTagsOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Order Bag Tags").count)}
  scope :SWNeighborhoodCleanUpOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Neighborhood Clean up").count)}
  scope :SWDumpsterPermitOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SW", :sr_type => "Dumpster Permit").count)}
  scope :SEIllegalDumpOpenOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Trash Dumping or Illegal Dumpsite").count)}
  scope :SEMissedRecyclingOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Recycling Pickup").count)}
  scope :SEContainerProblemOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Container Problem").count)}
  scope :SEMissedGarbageOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Garbage Pickup").count)}
  scope :SEMissedHeavyOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Heavy Trash Pickup").count)}
  scope :SEMissedRecycleOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Recycling Pickup").count)}
  scope :SESWMEscalationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "SWM Escalation").count)}
  scope :SERecyclingCartRepairOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Recycling Cart Repair or Replace").count)}
  scope :SENewRecyclingOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Recycling Participation NEW").count)}
  scope :SEMissedYardWasteOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Missed Yard Waste Pickup").count)}
  scope :SESWMEscalationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "SWM Escalation").count)}
  scope :SEDeadAnimalCollectionOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Dead Animal Collection").count)}
  scope :SENewResidentContainerOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "New Resident Container").count)}
  scope :SEAddACanOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Can").count)}
  scope :SEStormDebrisCollectionOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Storm Debris Collection").count)}
  scope :SEDumpsterComplaintOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Dumpster Complaint").count)}
  scope :SEAddACanCANCELLATIONOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Can CANCELLATION").count)}
  scope :SENonResidCollectionNewOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Non Residential Collection Service NEW").count)}
  scope :SESpilledDebrisOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Spilled Debris").count)}
  scope :SENewMoveInServiceOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "New Move In Service").count)}
  scope :SERecycleCartRetrieveOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Recycle Bin/Cart Retrieve").count)}
  scope :SEContainerPlacementOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Container Placement").count)}
  scope :SEPropertyDamageOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Property Damage").count)}
  scope :SENonResidentialCollectionCancelOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Non Residential Collection CANCEL").count)}
  scope :SEAddACartCancellationOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Cart CANCELLATION").count)}
  scope :SEAddABinOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Bin").count)}
  scope :SEAddACartOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Add A Cart").count)}
  scope :SENewResidentInPrivateDevelopmentOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "New Resident in Private Development").count)}
  scope :SEOrderBagTagsOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Order Bag Tags").count)}
  scope :SENeighborhoodCleanUpOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Neighborhood Clean up").count)}
  scope :SESDumpsterPermitOverdue,  ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Dumpster Permit").count)}
end

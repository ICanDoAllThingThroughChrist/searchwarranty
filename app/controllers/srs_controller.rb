class SrsController < ApplicationController
  def case_performance
    # OpenSr.daily_update_from_url
  @North = Sr.where(status: 'Open',
    trash_quad:['NW','NE'],
    sr_type: ['Missed Heavy Trash Pickup','Container Problem',
      'New Resident Container','Recycling Participation NEW',
      'Recycling Cart Repair or Replace','SWM Escalation',
      'Missed Garbage Pickup','Trash Dumping or Illegal Dumpsite',
      'Add A Can', 'Storm Debris Collection',
      'Dead Animal Collection', 'Add A Can CANCELLATION',
      'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
      'Physically Challenged Pickup']).
      distinct.count(:case_number)
  @South = Sr.where(status: 'Open',
    trash_quad:['SW','SE'],
    sr_type: ['Missed Heavy Trash Pickup','Container Problem',
      'New Resident Container','Recycling Participation NEW',
      'Recycling Cart Repair or Replace','SWM Escalation',
      'Missed Garbage Pickup','Trash Dumping or Illegal Dumpsite',
      'Add A Can', 'Storm Debris Collection',
      'Dead Animal Collection','Add A Can CANCELLATION',
      'Missed Recycling Pickup','Personnel or Vehicle Complaint',
      'Physically Challenged Pickup']).
      distinct.count(:case_number)
  @NorthOverdue=  Sr.
    where(status: 'Open',
    trash_quad: ['NE','NW'],
    expression: 'Overdue',
    sr_type: ['Missed Heavy Trash Pickup','Container Problem',
      'New Resident Container','Recycling Participation NEW',
      'Recycling Cart Repair or Replace','SWM Escalation',
      'Missed Garbage Pickup','Trash Dumping or Illegal Dumpsite',
      'Add A Can', 'Storm Debris Collection',
      'Dead Animal Collection', 'Add A Can CANCELLATION',
      'Missed Recycling Pickup','Personnel or Vehicle Complaint',
      'Physically Challenged Pickup']).
      distinct.count(:case_number)
  @NorthNotOverdue=  Sr.
    where(status: 'Open',
      trash_quad: ['NE','NW'],
    expression: 'Not Overdue',
    sr_type: ['Missed Heavy Trash Pickup','Container Problem',
      'New Resident Container','Recycling Participation NEW',
      'Recycling Cart Repair or Replace','SWM Escalation',
      'Missed Garbage Pickup','Trash Dumping or Illegal Dumpsite',
      'Add A Can', 'Storm Debris Collection',
      'Dead Animal Collection', 'Add A Can CANCELLATION',
      'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
      'Physically Challenged Pickup']).
      distinct.count(:case_number)
  @SouthOverdue=  Sr.
  where(status: 'Open',
    trash_quad: ['SE','SW'],
    expression: 'Overdue',
    sr_type: ['Missed Heavy Trash Pickup','Container Problem',
      'New Resident Container','Recycling Participation NEW',
      'Recycling Cart Repair or Replace','SWM Escalation',
      'Missed Garbage Pickup','Trash Dumping or Illegal Dumpsite',
      'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
      'Add A Can CANCELLATION', 'Missed Recycling Pickup',
      'Personnel or Vehicle Complaint','Physically Challenged Pickup']).
      distinct.count(:case_number)
  @SouthNotOverdue=Sr.
  where(status: 'Open',
    trash_quad: ['SW','SE'],
    expression: 'Not Overdue',
    sr_type: ['Missed Heavy Trash Pickup','Container Problem',
      'New Resident Container','Recycling Participation NEW',
      'Recycling Cart Repair or Replace','SWM Escalation',
      'Missed Garbage Pickup ','Trash Dumping or Illegal Dumpsite',
      'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
      'Add A Can CANCELLATION', 'Missed Recycling Pickup',
      'Personnel or Vehicle Complaint','Physically Challenged Pickup']).
      distinct.count(:case_number)
  @NOverdueDigits= @NorthOverdue.to_f / @North.to_f
  @NPercentRound=(@NorthOverdue.to_f.round(2) / @North.to_f.round(2))*100
  @PercentOverdueNorth="#{@NPercentRound.round(2)}%"
  @NPercentNotRound=(1-(@NorthOverdue.to_f.round(2) / @North.to_f.round(2)))*100
  @PercentNotOverdueNorth="#{@NPercentNotRound.round(2)}%"
  @SOverdueDigits=@SouthOverdue.to_f / @South.to_f
  @SPercentRound=(@SouthOverdue.to_f.round(2) / @South.to_f.round(2))*100
  @PercentOverdueSouth="#{@SPercentRound.round(2)}%"
  @SPercentNotRound= ((1-((@SouthOverdue.to_f.round(2)/@South.to_f.round(2))))*100)
  @PercentNotOverdueSouth="#{@SPercentNotRound.round(2)}%"
  @NorthQualityGrade = OpenSr.north_case_quality_grade
  @SouthQualityGrade = OpenSr.south_case_quality_grade
  #SW QUAD

  @missedHvySWTotal = Sr.where(trash_quad: 'SW',
    sr_type:'Missed Heavy Trash Pickup',
    expression:['Overdue','Not Overdue']).
    distinct.count(:case_number)

  @missedHvySWOverdue = Sr.where(trash_quad: 'SW',
    status: 'Open',
    sr_type: 'Missed Heavy Trash Pickup',
    expression:['Overdue']).
    distinct.count(:case_number)

  @missedHvySWPercentOverdue =
  "#{((@missedHvySWOverdue.to_f.round(2)/
  @missedHvySWTotal.to_f.round(2))*100).round(2)}%"

  @missedHvySWPercentNotOverdue = "#{(((1- (@missedHvySWOverdue.to_f/@missedHvySWTotal.to_f))*100).round(2))}%"


  @missedHvySWNotOverdue = Sr.
  where(heavy_trash_quad: 'SW',
    sr_type:'Missed Heavy Trash Pickup',
    expression:['Not Overdue']).
    distinct.count(:case_number)

  @missedHvySWNotOverdueDigits =
  (1-(@missedHvySWOverdue.to_f.round(2)/
  @missedHvySWTotal.to_f.round(2)))

  @missedHvySWGrade=
  OpenSr.qualityGrade(@missedHvySWNotOverdueDigits)

  @missedConProbSWTotal =
  Sr.where(trash_quad: 'SW',
    sr_type:'Container Problem',
    expression:['Overdue','Not Overdue']).
    distinct.count(:case_number)

  @missedConProbSWOverdue =
  Sr.where(trash_quad: 'SW',
    sr_type:'Container Problem',
    expression:['Overdue']).
    distinct.count(:case_number)

  @missedConProbSWNotOverdue =
  Sr.where(trash_quad: 'SW',
    sr_type:'Container Problem',
    expression:['Not Overdue']).
    distinct.count(:case_number)

  @missedConProbSWPercentOverdue =
    "#{((@missedConProbSWOverdue.to_f.round(2)/
    @missedConProbSWTotal.to_f.round(2))*100).round(2)}%"

  @missedConProbSWPercentNotOverdue =
    "#{(((1-(@missedConProbSWOverdue.to_f/@missedConProbSWTotal.to_f))*100).round(2))}%"

  @missedConProbSWNotOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'Container Problem',
      expression:['Not Overdue']).
      distinct.count(:case_number)

  @missedConProbNotOverdueDigits =
    (1-(@missedConProbSWOverdue.to_f/@missedConProbSWTotal.to_f))

  @missedConProbSWGrade=
    OpenSr.qualityGrade(@missedConProbNotOverdueDigits)

  @missedNewResSWTotal = Sr.
  where(trash_quad: 'SW',
    sr_type:'New Resident Container',
    status: 'Open',
    expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedNewResSWOverdue = Sr.
  where(trash_quad: 'SW',
    status:'Open',
    sr_type:'New Resident Container',
    expression:['Overdue']).distinct.count(:case_number)
  @missedNewResSWNotOverdue = Sr.
  where(trash_quad: 'SW',
    sr_type:'New Resident Container',
    expression:['Not Overdue']).
    distinct.count(:case_number)
  @missedNewResSWPercentOverdue =
    "#{((@missedNewResSWOverdue.to_f.round(2)/
    @missedNewResSWTotal.to_f.round(2))*100).round(2)}%"
  @missedNewResSWPercentNotOverdue =
    "#{(((1-(@missedNewResSWOverdue.to_f/@missedNewResSWTotal.to_f))*100).round(2))}%"
  @missedNewResSWNotOverdue = Sr.
  where(trash_quad: 'SW',
    sr_type:'New Resident Container',
    expression:['Not Overdue']).distinct.count(:case_number)
  @missedNewResOverdueDigits =
    (1-(@missedNewResSWOverdue.to_f/@missedNewResSWTotal.to_f))
  @missedNewResSWGrade= OpenSr.
    qualityGrade(@missedNewResOverdueDigits)

  @missedRecNewSWTotal = Sr.where(trash_quad: 'SW',
    sr_type:'Recycling Participation NEW',
    status: 'Open', expression:['Overdue','Not Overdue']).
    distinct.count(:case_number)
  @missedRecNewSWOverdue = Sr.where(trash_quad: 'SW',
    sr_type:'Recycling Participation NEW',
    status: 'Open', expression:['Overdue']).
    distinct.count(:case_number)
  @missedRecNewSWPercentOverdue =
    "#{((@missedRecNewSWOverdue.to_f.round(2)/
    @missedRecNewSWTotal.to_f.round(2))*100).round(2)}%"
  @missedRecNewSWPercentNotOverdue =
    "#{((1-(@missedRecNewSWOverdue.to_f.round(2)/
    @missedRecNewSWTotal.to_f.round(2)))*100).round(2)}%"
  @missedRecNewSWNotOverdue = Sr.
  where(trash_quad: 'SW',
    sr_type:'Recycling Participation NEW',
    expression:['Not Overdue']).
    distinct.count(:case_number)
  @missedRecNewSWOverdueDigits =
    (1-(@missedRecNewSWOverdue.to_f/@missedRecNewSWTotal.to_f))
  @missedRecNewSWGrade= OpenSr.qualityGrade(@missedRecNewSWOverdueDigits)

  @missedRecCarRepSWTotal = Sr.where(trash_quad: 'SW',
    sr_type:'Recycling Cart Repair or Replace',
    expression:['Overdue','Not Overdue']).
    distinct.count(:case_number)
  @missedRecCarRepSWOverdue = Sr.where(trash_quad: 'SW',
    sr_type:'Recycling Cart Repair or Replace',
    expression:['Overdue']).
    distinct.count(:case_number)
  @missedRecCarRepSWPercentOverdue =
  "#{((@missedRecCarRepSWOverdue.to_f.round(2)/
  @missedRecCarRepSWTotal.to_f.round(2))*100).round(2)}%"
  @missedRecCarRepSWPercentNotOverdue =
    "#{((1-(@missedRecCarRepSWOverdue.to_f.round(2)/
    @missedRecCarRepSWTotal.to_f.round(2)))*100).round(2)}%"
  @missedRecCarRepSWNotOverdue = Sr.where(trash_quad: 'SW',
    sr_type:'Recycling Cart Repair or Replace',
    expression:['Not Overdue']).
    distinct.count(:case_number)
  @missedRecCarRepSWOverdueDigits =
    (1-(@missedRecCarRepSWOverdue.to_f/@missedRecCarRepSWTotal.to_f))
  @missedRecCarRepSWGrade= OpenSr.qualityGrade(@missedRecCarRepSWOverdueDigits)

  @missedSWMEscaSWTotal = Sr.where(trash_quad: 'SW',
    sr_type:'SWM Escalation',
    expression:['Overdue','Not Overdue']).
    distinct.count(:case_number)
  @missedSWMEscaSWOverdue =
  Sr.where(trash_quad: 'SW',
    sr_type:'SWM Escalation',
    expression:['Overdue']).
    distinct.count(:case_number)
  @missedSWMEscaSWPercentOverdue =
    "#{((@missedSWMEscaSWOverdue.to_f.round(2)/
    @missedSWMEscaSWTotal.to_f.round(2))*100).round(2)}%"
  @missedSWMEscaSWPercentNotOverdue =
    "#{((1-(@missedSWMEscaSWOverdue.to_f.round(2)/
    @missedSWMEscaSWTotal.to_f.round(2)))*100).round(2)}%"
  @missedSWMEscaSWNotOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'SWM Escalation',
      expression:['Not Overdue']).
      distinct.count(:case_number)
  @missedSWMEscaSWOverdueDigits =
    (1-
      (@missedSWMEscaSWOverdue.to_f.round(2)/
        @missedSWMEscaSWTotal.to_f.round(2)
      )
    )

  @missedSWMEscaSWGrade=
    OpenSr.qualityGrade(@missedSWMEscaSWOverdueDigits)

  @missedMisGarbSWTotal =
  Sr.where(trash_quad: 'SW',
    sr_type:'Missed Garbage Pickup',
    expression:['Overdue','Not Overdue']).
    distinct.count(:case_number)
  @missedMisGarbSWOverdue = Sr.
  where(trash_quad: 'SW',
    sr_type:'Missed Garbage Pickup',
    expression:['Overdue']).
    distinct.count(:case_number)
  @missedMisGarbSWPercentOverdue =
  "#{((@missedMisGarbSWOverdue.to_f.round(2)/
  @missedMisGarbSWTotal.to_f.round(2))*100).round(2)}%"
  @missedMisGarbSWPercentNotOverdue =
  "#{((1-(@missedMisGarbSWOverdue.to_f.round(2)/
  @missedMisGarbSWTotal.to_f.round(2)))*100).round(2)}%"
  @missedMisGarbSWNotOverdue = Sr.
  where(trash_quad: 'SW',
    sr_type:'Missed Garbage Pickup',
    expression:['Not Overdue']).
    distinct.count(:case_number)
  @missedMisGarbSWOverdueDigits =
    (1-(@missedMisGarbSWOverdue.to_f/@missedMisGarbSWTotal.to_f))
  @missedMisGarbSWGrade= OpenSr.qualityGrade(@missedMisGarbSWOverdueDigits)

  @missedTrashDumpSWTotal = Sr.
    where(trash_quad: 'SW',
      sr_type:'Trash Dumping or Illegal Dumpsite',
      expression:['Overdue','Not Overdue']).
      distinct.count(:case_number)
  @missedTrashDumpSWOverdue = Sr.
    where(trash_quad: 'SW',
      sr_type:'Trash Dumping or Illegal Dumpsite',
      expression:['Overdue']).
      distinct.count(:case_number)
  @missedTrashDumpSWPercentOverdue =
    "#{((@missedTrashDumpSWOverdue.to_f.round(2)/
    @missedTrashDumpSWTotal.to_f.round(2))*100).round(2)}%"
  @missedMTrashDumpSWNotOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'Trash Dumping or Illegal Dumpsite',
      expression:['Not Overdue']).
      distinct.count(:case_number)
  @missedTrashDumpSWPercentNotOverdue =
  "#{(((1-(@missedTrashDumpSWOverdue.to_f/@missedTrashDumpSWTotal.to_f))*100).round(2))}%"

  @missedTrashDumpSWNotOverdue =
  Sr.where(trash_quad: 'SW',
    sr_type:'Trash Dumping or Illegal Dumpsite',
    expression:['Not Overdue']).
    distinct.count(:case_number)
  @missedTrashDumpSWNotOverdueDigits =
    (1-(@missedTrashDumpSWOverdue.to_f/@missedTrashDumpSWTotal.to_f))
  @missedTrashDumpSWGrade= OpenSr.qualityGrade(@missedTrashDumpSWNotOverdueDigits)

  @missedAddACanSWTotal =
  Sr.where(trash_quad: 'SW',
    sr_type:'Add A Can',
    expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedAddACanSWOverdue =
  Sr.where(trash_quad: 'SW',
    sr_type:'Add A Can',
    expression:['Overdue']).distinct.count(:case_number)
  @missedAddACanSWPercentOverdue =
  "#{((@missedAddACanSWOverdue.to_f.round(2)/
  @missedAddACanSWTotal.to_f.round(2))*100).round(2)}%"
  @missedAddACanSWNotOverdue =
  Sr.where(trash_quad: 'SW',
    sr_type:'Add A Can',
    expression:['Not Overdue']).distinct.count(:case_number)
  @missedAddACanSWPercentNotOverdue =
    "#{(((1-(@missedAddACanSWOverdue.to_f/@missedAddACanSWTotal.to_f))*100).round(2))}%"
  @missedAddACanSWNotOverdue =
  Sr.where(trash_quad: 'SW',
    sr_type:'Add A Can',
    expression:['Not Overdue']).distinct.count(:case_number)
  @missedAddACanSWOverdueDigits =
    (1-(@missedAddACanSWOverdue.to_f/@missedAddACanSWTotal.to_f))
  @missedAddACanSWGrade= OpenSr.qualityGrade(@missedAddACanSWOverdueDigits)

  @missedStormDebSWTotal =
  Sr.where(trash_quad: 'SW',
    sr_type:'Storm Debris Collection',
    expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedStormDebSWOverdue =
  Sr.where(trash_quad: 'SW',
    sr_type:'Storm Debris Collection',
    expression:['Overdue']).distinct.count(:case_number)
  @missedStormDebSWPercentOverdue =
  "#{((@missedStormDebSWOverdue.to_f.round(2)/
  @missedStormDebSWTotal.to_f.round(2))*100).round(2)}%"
  @missedStormDebSWNotOverdue = Sr.
    where(trash_quad: 'SW',
      sr_type:'Storm Debris Collection',
      expression:['Not Overdue']).distinct.count(:case_number)
  @missedStormDebSWPercentNotOverdue =
  "#{((@missedStormDebSWNotOverdue.to_f.round(2)/
  @missedStormDebSWTotal.to_f.round(2))*100).round(2)}%"
  @missedStormDebSWNotOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'Storm Debris Collection',
      expression:['Not Overdue']).distinct.count(:case_number)
  @missedStormDebSWOverdueDigits =
    (1-(@missedStormDebSWOverdue.to_f/@missedStormDebSWTotal.to_f))
  @missedStormDebSWGrade= OpenSr.qualityGrade(@missedStormDebSWOverdueDigits)

  @missedDeadAniColSWTotal =
    Sr.where(trash_quad: 'SW',
      sr_type:'Dead Animal Collection',
      expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedDeadAniColSWOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'Dead Animal Collection',
      expression:['Overdue']).distinct.count(:case_number)
  @missedDeadAniColSWPercentOverdue =
    "#{((@missedDeadAniColSWOverdue.to_f.round(2)/
    @missedDeadAniColSWTotal.to_f.round(2))*100).round(2)}%"
  @missedDeadAniColSWNotOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'Dead Animal Collection',
      expression:['Not Overdue']).distinct.count(:case_number)
  @missedDeadAniColSWPercentNotOverdue =
    "#{((@missedDeadAniColSWNotOverdue.to_f.round(2)/
    @missedDeadAniColSWTotal.to_f.round(2))*100).round(2)}%"
  @missedDeadAniColSWNotOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'Dead Animal Collection',
      expression:['Not Overdue']).distinct.count(:case_number)
  @missedDeadAniColSWOverdueDigits =
    (1-(@missedDeadAniColSWOverdue.to_f/@missedDeadAniColSWTotal.to_f))
  @missedDeadAniColSWGrade=
    OpenSr.qualityGrade(@missedDeadAniColSWOverdueDigits)

  @missedAddACanCancelSWTotal =
    Sr.where(trash_quad: 'SW',
      sr_type:'Add A Can CANCELLATION',
      expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedAddACanCancelSWOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'Add A Can CANCELLATION',
      expression:['Overdue']).distinct.count(:case_number)
  @missedAddACanCancelSWPercentOverdue =
    "#{((@missedAddACanCancelSWOverdue.to_f.round(2)/
    @missedAddACanCancelSWTotal.to_f.round(2))*100).round(2)}%"
  @missedAddACanCancelSWNotOverdue =
  Sr.where(trash_quad: 'SW',
    sr_type:'Add A Can CANCELLATION',
    expression:['Not Overdue']).distinct.count(:case_number)
  @missedAddACanCancelSWPercentNotOverdue =
    "#{(((1-(@missedAddACanCancelSWOverdue.to_f/@missedAddACanCancelSWTotal.to_f))*100).round(2))}%"
  @missedAddACanCancelSWNotOverdue =
  Sr.where(trash_quad: 'SW',
    sr_type:'Add A Can CANCELLATION',
    expression:['Not Overdue']).distinct.count(:case_number)
  @missedAddACanCancelSWOverdueDigits =
    (1-(@missedAddACanCancelSWOverdue.to_f/@missedAddACanCancelSWTotal.to_f))
  @missedAddACanCancelSWGrade=
    OpenSr.qualityGrade(@missedAddACanCancelSWOverdueDigits)

  @missedMisRecPicUpSWTotal =
    Sr.where(trash_quad: 'SW',
      sr_type:'Missed Recycling Pickup',
      expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedMisRecPicUpSWOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'Missed Recycling Pickup',
      expression:['Overdue']).distinct.count(:case_number)
  @missedMisRecPicUpSWPercentOverdue =
    "#{((@missedMisRecPicUpSWOverdue.to_f.round(2)/
    @missedMisRecPicUpSWTotal.to_f.round(2))*100).round(2)}%"
  @missedMisRecPicUpSWNotOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'Missed Recycling Pickup',
      expression:['Not Overdue']).distinct.count(:case_number)
  @missedMisRecPicUpSWPercentNotOverdue =
   "#{(((1-(@missedMisRecPicUpSWOverdue/@missedMisRecPicUpSWTotal))*100).round(2))}%"
  @missedMisRecPicUpSWNotOverdue = Sr.
    where(trash_quad: 'SW',
      sr_type:'Missed Recycling Pickup',
       expression:['Not Overdue']).distinct.count(:case_number)

  @missedMisRecPicUpSWOverdueDigits =
    @missedMisRecPicUpSWNotOverdue.to_f/@missedMisRecPicUpSWTotal.to_f
  @missedMisRecPicUpSWGrade= OpenSr.
    qualityGrade(@missedMisRecPicUpSWOverdueDigits)

  @missedPOrVCompSWTotal = Sr.where(trash_quad: 'SW',
    sr_type:'Personnel or Vehicle Complaint',
     expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedPOrVCompSWOverdue = Sr.
    where(trash_quad: 'SW',
      sr_type:'Personnel or Vehicle Complaint',
       expression:['Overdue']).distinct.count(:case_number)
  @missedPOrVCompSWPercentOverdue =
    "#{((@missedPOrVCompSWOverdue.to_f.round(2)/
    @missedPOrVCompSWTotal.to_f.round(2))*100).round(2)}%"
  @missedPOrVCompSWNotOverdue = Sr.
    where(trash_quad: 'SW',
      sr_type:'Personnel or Vehicle Complaint',
      expression:['Not Overdue']).distinct.count(:case_number)
  @missedPOrVCompSWPercentNotOverdue =
    "#{(((1-(@missedPOrVCompSWOverdue.to_f/@missedPOrVCompSWTotal.to_f))*100).round(2))}%"
  @missedPOrVCompSWNotOverdue = Sr.
    where(trash_quad: 'SW',
      sr_type:'Personnel or Vehicle Complaint',
      expression:['Not Overdue']).distinct.count(:case_number)
  @missedPOrVCompSWOverdueDigits =
    (1-(@missedPOrVCompSWOverdue.to_f/@missedPOrVCompSWTotal.to_f))
  @missedPOrVCompSWGrade= OpenSr.
  qualityGrade(@missedPOrVCompSWOverdueDigits)

  @missedPhyChaPikSWTotal = Sr.
    where(trash_quad: 'SW',
      sr_type:'Physically Challenged Pickup',
       expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedPhyChaPikSWOverdue = Sr.
    where(trash_quad: 'SW',
      sr_type:'Physically Challenged Pickup',
       expression:['Overdue']).distinct.count(:case_number)
  @missedPhyChaPikSWPercentOverdue =
    "#{((@missedPhyChaPikSWOverdue.to_f.round(2)/
    @missedPhyChaPikSWTotal.to_f.round(2))*100).round(2)}%"
  @missedPhyChaPikSWPercentNotOverdue =
    "#{(((1-(@missedPhyChaPikSWOverdue.to_f/@missedPhyChaPikSWTotal.to_f))*100).round(2))}%"
  @missedPhyChaPikSWNotOverdue = Sr.
  where(trash_quad: 'SW',
    sr_type:'Physically Challenged Pickup',
    expression:['Not Overdue']).distinct.count(:case_number)
  @missedPhyChaPikSWNotOverdueDigits =
    (1-(@missedPhyChaPikSWOverdue.to_f/@missedPhyChaPikSWTotal.to_f))
  @missedPhyChaPikSWGrade= OpenSr.
    qualityGrade(@missedPhyChaPikSWNotOverdueDigits)
  # binding.pry
  @SWQuadSrTotal = Sr.where(status:'Open',
     expression:['Overdue', 'Not Overdue'],
      trash_quad: 'SW',
       sr_type: ['Missed Heavy Trash Pickup',
         'Container Problem',
         'New Resident Container',
         'Recycling Participation NEW',
         'Recycling Cart Repair or Replace',
         'SWM Escalation',
         'Missed Garbage Pickup',
         'Trash Dumping or Illegal Dumpsite',
         'Add A Can',
         'Storm Debris Collection',
         'Dead Animal Collection',
         'Add A Can CANCELLATION',
         'Missed Recycling Pickup',
         'Personnel or Vehicle Complaint',
         'Physically Challenged Pickup']).distinct.count(:case_number)
  @SWQuadSrOverdue = Sr.where(status:'Open',
      expression:'Overdue',
       trash_quad: 'SW',
        sr_type: ['Missed Heavy Trash Pickup',
          'Container Problem',
          'New Resident Container',
          'Recycling Participation NEW',
          'Recycling Cart Repair or Replace',
          'SWM Escalation',
          'Missed Garbage Pickup',
          'Trash Dumping or Illegal Dumpsite',
          'Add A Can',
          'Storm Debris Collection',
          'Dead Animal Collection',
          'Add A Can CANCELLATION',
          'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint',
          'Physically Challenged Pickup']).distinct.count(:case_number)
  @SWQuadPercentOverdue = "#{((@SWQuadSrOverdue.to_f/@SWQuadSrTotal.to_f)*100).round(2)}%"
  @SWQuadSrNotOverdue = Sr.where(status:'Open',
    expression:'Not Overdue',
    trash_quad: 'SW',
    sr_type: ['Missed Heavy Trash Pickup',
      'Container Problem',
      'New Resident Container',
      'Recycling Participation NEW',
      'Recycling Cart Repair or Replace',
      'SWM Escalation',
      'Missed Garbage Pickup',
      'Trash Dumping or Illegal Dumpsite',
      'Add A Can', 'Storm Debris Collection',
      'Dead Animal Collection',
      'Add A Can CANCELLATION',
      'Missed Recycling Pickup',
      'Personnel or Vehicle Complaint',
      'Physically Challenged Pickup']).distinct.count(:case_number)
  @SWQuadPercentNotOverdue = "#{(((1-(@SWQuadSrOverdue.to_f/@SWQuadSrTotal.to_f))*100).round(2))}%"
  @SWQuadNotOverdueDigits = (1-(@SWQuadSrOverdue.to_f/@SWQuadSrTotal.to_f))
  @SWQuadQualityGrade = OpenSr.qualityGrade(@SWQuadNotOverdueDigits)
#SE QUAD
  @missedHvySETotal = Sr.where(trash_quad: 'SE',
    sr_type:'Missed Heavy Trash Pickup',
    expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedHvySEOverdue = Sr.where(trash_quad: 'SE',sr_type:'Missed Heavy Trash Pickup',expression:['Overdue']).distinct.count(:case_number)
  @missedHvySEPercentOverdue =
  "#{((@missedHvySEOverdue.to_f.round(2)/@missedHvySETotal.to_f.round(2))*100).round(2)}%"
  @missedHvySEPercentNotOverdue =
  "#{((1-(@missedHvySEOverdue.to_f.round(2)/@missedHvySETotal.to_f.round(2)))*100).round(2)}%"
  @missedHvySENotOverdue = Sr.where(trash_quad: 'SE',
    sr_type:'Missed Heavy Trash Pickup',
     expression:['Not Overdue']).distinct.count(:case_number)
  @missedHvySENotOverdueDigits = (1-(@missedHvySEOverdue.to_f/@missedHvySETotal.to_f))
  @missedHvySEGrade= OpenSr.qualityGrade(@missedHvySENotOverdueDigits)

  @missedConProbSETotal = Sr.where(trash_quad: 'SE',
    sr_type:'Container Problem', expression:['Overdue','Not Overdue']).
    distinct.count(:case_number)
  @missedConProbSEOverdue = Sr.where(trash_quad: 'SE',
    sr_type:'Container Problem', expression:['Overdue']).
    distinct.count(:case_number)
  @missedConProbSEPercentOverdue =
  "#{((@missedConProbSEOverdue.to_f.round(2)/@missedConProbSETotal.to_f.round(2))*100).round(2)}%"
  @missedConProbSEPercentNotOverdue =
  "#{((1-(@missedConProbSEOverdue.to_f.round(2)/@missedConProbSETotal.to_f.round(2)))*100).round(2)}%"
  @missedConProbSENotOverdue = Sr.where(trash_quad: 'SE',
    sr_type:'Container Problem', expression:['Not Overdue']).
    distinct.count(:case_number)
  @missedConProbSEOverdueDigits = @missedConProbSENotOverdue.to_f/@missedConProbSETotal.to_f
  @missedConProbSEGrade= OpenSr.qualityGrade(@missedConProbSEOverdueDigits)

  @missedNewResSETotal = Sr.where(trash_quad: 'SE',
    sr_type:'New Resident Container', expression:['Overdue','Not Overdue']).
    distinct.count(:case_number)
  @missedNewResSEOverdue = Sr.where(trash_quad: 'SE',
    sr_type:'New Resident Container', expression:['Overdue']).
    distinct.count(:case_number)
  @missedNewResSEPercentOverdue = "#{((@missedNewResSEOverdue.to_f.round(2)/@missedNewResSETotal.to_f.round(2))*100).round(2)}%"
  # @missedNewResSEPercenNotOverdue = @missedNewResSENotOverdue.to_f.round(2)/@missedNewResSETotal
  @missedNewResSEPercentNotOverdue = "#{((1-(@missedNewResSEOverdue.to_f.round(2)/@missedNewResSETotal.to_f.round(2)))*100).round(2)}%"
  @missedNewResSENotOverdue = Sr.where(trash_quad: 'SE',
    sr_type:'New Resident Container', expression:['Not Overdue']).
    distinct.count(:case_number)
  @missedNewResSEOverdueDigits =
  (1-(@missedNewResSEOverdue.to_f/@missedNewResSETotal.to_f))
  @missedNewResSEGrade= OpenSr.qualityGrade(@missedNewResSEOverdueDigits)

  @missedRecNewSETotal = Sr.where(trash_quad: 'SE',
    sr_type:'Recycling Participation NEW',
    expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedRecNewSEOverdue = Sr.where(trash_quad: 'SE',
    sr_type:'Recycling Participation NEW', expression:['Overdue']).
    distinct.count(:case_number)
  @missedRecNewSEPercentOverdue =
  "#{((@missedRecNewSEOverdue.to_f.round(2)/@missedRecNewSETotal.to_f.round(2))*100).round(2)}%"
  @missedRecNewSEPercentNotOverdue =
  "#{((1-(@missedRecNewSEOverdue.to_f.round(2)/@missedRecNewSETotal.to_f.round(2)))*100).round(2)}%"
  @missedRecNewSENotOverdue = Sr.where(trash_quad: 'SE',
    sr_type:'Recycling Participation NEW', expression:['Not Overdue']).
    distinct.count(:case_number)
  @missedRecNewSENotOverdueDigits =
    (1-(@missedRecNewSEOverdue.to_f.round(2)/@missedRecNewSETotal.to_f.round(2)))
  @missedRecNewSEGrade= OpenSr.qualityGrade(@missedRecNewSENotOverdueDigits)

  @missedRecCarRepSETotal = Sr.where(trash_quad: 'SE',
    sr_type:'Recycling Cart Repair or Replace',
     expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedRecCarRepSEOverdue = Sr.where(trash_quad: 'SE',
    sr_type:'Recycling Cart Repair or Replace',
    expression:['Overdue']).distinct.count(:case_number)
  @missedRecCarRepSEPercentOverdue =
  "#{((@missedRecCarRepSEOverdue.to_f.round(2)/@missedRecCarRepSETotal.to_f.round(2))*100).round(2)}%"
  @missedRecCarRepSEPercentNotOverdue =
  "#{((1-(@missedRecCarRepSEOverdue.to_f.round(2)/@missedRecCarRepSETotal.to_f.round(2)))*100).round(2)}%"
  @missedRecCarRepSENotOverdue = Sr.where(trash_quad: 'SE',
    sr_type:'Recycling Cart Repair or Replace',
     expression:['Not Overdue']).distinct.count(:case_number)
  @missedRecCarRepSEONotOverdueDigits = (1-(@missedRecCarRepSEOverdue.to_f/@missedRecCarRepSETotal.to_f))
  @missedRecCarRepSEGrade= OpenSr.qualityGrade(@missedRecCarRepSEONotOverdueDigits)

  @missedSWMEscaSETotal = Sr.where(trash_quad: 'SE',sr_type:'SWM Escalation',
    expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedSWMEscaSEOverdue = Sr.where(trash_quad: 'SE',sr_type:'SWM Escalation',
     expression:['Overdue']).distinct.count(:case_number)
  @missedSWMEscaSEPercentOverdue =
    "#{((@missedSWMEscaSEOverdue.to_f.round(2)/@missedSWMEscaSETotal.to_f.round(2))*100).round(2)}%"
  @missedSWMEscaSEPercentNotOverdue =
    "#{((1-(@missedSWMEscaSEOverdue.to_f.round(2)/@missedSWMEscaSETotal.to_f.round(2)))*100).round(2)}%"
  @missedSWMEscaSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'SWM Escalation',
    expression:['Not Overdue']).distinct.count(:case_number)
  @missedSWMEscaSEOverdueDigits = (1-(@missedSWMEscaSEOverdue.to_f/@missedSWMEscaSETotal.to_f))
  @missedSWMEscaSEGrade= OpenSr.qualityGrade(@missedSWMEscaSEOverdueDigits)

  @missedMisGarbSETotal = Sr.where(trash_quad: 'SE',sr_type:'Missed Garbage Pickup',
    expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedMisGarbSEOverdue = Sr.where(trash_quad: 'SE',sr_type:'Missed Garbage Pickup',
    expression:['Overdue']).distinct.count(:case_number)
  @missedMisGarbSEPercentOverdue =
    "#{((@missedMisGarbSEOverdue.to_f.round(2)/@missedMisGarbSETotal.to_f.round(2))*100).round(2)}%"
  @missedMisGarbSEPercentNotOverdue =
    "#{((1-(@missedMisGarbSEOverdue.to_f.round(2)/@missedMisGarbSETotal.to_f.round(2)))*100).round(2)}%"
  @missedMisGarbSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Missed Garbage Pickup',
    expression:['Not Overdue']).distinct.count(:case_number)
  @missedMisGarbSEOverdueDigits = (1-(@missedMisGarbSEOverdue.to_f/@missedMisGarbSETotal.to_f))
  @missedMisGarbSEGrade= OpenSr.qualityGrade(@missedMisGarbSEOverdueDigits)

  @missedTrashDumpSETotal = Sr.where(trash_quad: 'SE',sr_type:'Trash Dumping or Illegal Dumpsite',
    expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedTrashDumpSEOverdue = Sr.where(trash_quad: 'SE',
    sr_type:'Trash Dumping or Illegal Dumpsite',
    expression:['Overdue']).distinct.count(:case_number)
  @missedTrashDumpSEPercentOverdue =
    "#{((@missedTrashDumpSEOverdue.to_f.round(2)/@missedTrashDumpSETotal.to_f.round(2))*100).round(2)}%"
  @missedTrashDumpSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Trash Dumping or Illegal Dumpsite',
    expression:['Not Overdue']).distinct.count(:case_number)
  @missedTrashDumpSEPercentNotOverdue =
    "#{(((1-(@missedTrashDumpSEOverdue.to_f/@missedTrashDumpSETotal.to_f))*100).round(2))}%"
  @missedTrashDumpSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Trash Dumping or Illegal Dumpsite',
    expression:['Not Overdue']).distinct.count(:case_number)
  @missedTrashDumpSEOverdueDigits = (1-(@missedTrashDumpSEOverdue.to_f/@missedTrashDumpSETotal.to_f))
  @missedTrashDumpSEGrade= OpenSr.qualityGrade(@missedTrashDumpSEOverdueDigits)

  @missedAddACanSETotal = Sr.where(trash_quad: 'SE',sr_type:'Add A Can', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedAddACanSEOverdue = Sr.where(trash_quad: 'SE',sr_type:'Add A Can', expression:['Overdue']).distinct.count(:case_number)
  @missedAddACanSEPercentOverdue = "#{((@missedAddACanSEOverdue.to_f.round(2)/@missedAddACanSETotal.to_f.round(2))*100).round(2)}%"
  @missedAddACanSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Add A Can', expression:['Not Overdue']).distinct.count(:case_number)
  @missedAddACanSEPercentNotOverdue = "#{((@missedAddACanSENotOverdue.to_f.round(2)/@missedAddACanSETotal.to_f.round(2))*100).round(2)}%"
  @missedAddACanSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Add A Can', expression:['Not Overdue']).distinct.count(:case_number)
  @missedAddACanSEOverdueDigits = @missedAddACanSENotOverdue.to_f/@missedAddACanSETotal.to_f
  @missedAddACanSEGrade= OpenSr.qualityGrade(@missedAddACanSEOverdueDigits)

  @missedMisRecPicUpSETotal = Sr.where(trash_quad: 'SE',sr_type:'Missed Recycling Pickup', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedMisRecPicUpSEOverdue = Sr.where(trash_quad: 'SE',sr_type:'Missed Recycling Pickup', expression:['Overdue']).distinct.count(:case_number)
  @missedMisRecPicUpSEPercentOverdue = "#{((@missedMisRecPicUpSEOverdue.to_f.round(2)/@missedMisRecPicUpSETotal.to_f.round(2))*100).round(2)}%"
  @missedMisRecPicUpSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Missed Recycling Pickup', expression:['Not Overdue']).distinct.count(:case_number)
  @missedMisRecPicUpSEPercentNotOverdue = "#{((1-(@missedMisRecPicUpSEOverdue.to_f/@missedMisRecPicUpSETotal.to_f))*100).round(2)}%"
  @missedMisRecPicUpSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Missed Recycling Pickup', expression:['Not Overdue']).distinct.count(:case_number)
  @missedMisRecPicUpSENotOverdueDigits = (1-(@missedMisRecPicUpSEOverdue.to_f/@missedMisRecPicUpSETotal.to_f))
  @missedMisRecPicUpSEGrade= OpenSr.qualityGrade(@missedMisRecPicUpSENotOverdueDigits)

  @missedStormDebSETotal = Sr.where(trash_quad: 'SE',sr_type:'Storm Debris Collection', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedStormDebSEOverdue = Sr.where(trash_quad: 'SE',sr_type:'Storm Debris Collection', expression:['Overdue']).distinct.count(:case_number)
  @missedStormDebSEPercentOverdue = "#{((@missedStormDebSEOverdue.to_f.round(2)/@missedStormDebSETotal.to_f.round(2))*100).round(2)}%"
  @missedStormDebSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Storm Debris Collection', expression:['Not Overdue']).distinct.count(:case_number)
  @missedStormDebSEPercentNotOverdue = "#{((@missedStormDebSENotOverdue.to_f.round(2)/@missedStormDebSETotal.to_f.round(2))*100).round(2)}%"
  @missedStormDebSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Storm Debris Collection', expression:['Not Overdue']).distinct.count(:case_number)
  @missedStormDebSEOverdueDigits = (1-(@missedStormDebSEOverdue.to_f/@missedStormDebSETotal.to_f))
  @missedStormDebSEGrade= OpenSr.qualityGrade(@missedStormDebSEOverdueDigits)

  @missedDeadAniColSETotal = Sr.where(trash_quad: 'SE',sr_type:'Dead Animal Collection', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedDeadAniColSEOverdue = Sr.where(trash_quad: 'SE',sr_type:'Dead Animal Collection', expression:['Overdue']).distinct.count(:case_number)
  @missedDeadAniColSEPercentOverdue = "#{((@missedDeadAniColSEOverdue.to_f.round(2)/@missedDeadAniColSETotal.to_f.round(2))*100).round(2)}%"
  @missedDeadAniColSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Dead Animal Collection', expression:['Not Overdue']).distinct.count(:case_number)
  @missedDeadAniColSEPercentNotOverdue = "#{((@missedDeadAniColSENotOverdue.to_f.round(2)/@missedDeadAniColSETotal.to_f.round(2))*100).round(2)}%"
  @missedDeadAniColSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Dead Animal Collection', expression:['Not Overdue']).distinct.count(:case_number)
  @missedDeadAniColSEOverdueDigits = (1-(@missedDeadAniColSEOverdue.to_f/@missedDeadAniColSETotal.to_f))
  @missedDeadAniColSEGrade= OpenSr.qualityGrade(@missedDeadAniColSEOverdueDigits)

  @missedAddACanCancelSETotal = Sr.where(trash_quad: 'SE',sr_type:'Add A Can CANCELLATION', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedAddACanCancelSEOverdue = Sr.where(trash_quad: 'SE',sr_type:'Add A Can CANCELLATION', expression:['Overdue']).distinct.count(:case_number)
  @missedAddACanCancelSEPercentOverdue = "#{((@missedAddACanCancelSEOverdue.to_f.round(2)/@missedAddACanCancelSETotal.to_f.round(2))*100).round(2)}%"
  @missedAddACanCancelSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Add A Can CANCELLATION', expression:['Not Overdue']).distinct.count(:case_number)
  @missedAddACanCancelSEPercentNotOverdue = "#{((@missedAddACanCancelSENotOverdue.to_f.round(2)/@missedAddACanCancelSETotal.to_f.round(2))*100).round(2)}%"
  @missedAddACanCancelSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Add A Can CANCELLATION', expression:['Not Overdue']).distinct.count(:case_number)
  @missedAddACanCancelSEOverdueDigits = (1-(@missedAddACanCancelSEOverdue.to_f/@missedAddACanCancelSETotal.to_f))
  @missedAddACanCancelSEGrade= OpenSr.qualityGrade(@missedAddACanCancelSEOverdueDigits)

  @missedPOrVCompSETotal = Sr.where(trash_quad: 'SE',sr_type:'Personnel or Vehicle Complaint', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedPOrVCompSEOverdue = Sr.where(trash_quad: 'SE',sr_type:'Personnel or Vehicle Complaint', expression:['Overdue']).distinct.count(:case_number)
  @missedPOrVCompSEPercentOverdue = "#{((@missedPOrVCompSEOverdue.to_f.round(2)/@missedPOrVCompSETotal.to_f.round(2))*100).round(2)}%"
  @missedPOrVCompSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Personnel or Vehicle Complaint', expression:['Not Overdue']).distinct.count(:case_number)
  @missedPOrVCompSEPercentNotOverdue = "#{(1-(@missedPOrVCompSEOverdue/@missedPOrVCompSETotal))}%"
  @missedPOrVCompSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Personnel or Vehicle Complaint', expression:['Not Overdue']).distinct.count(:case_number)
  @missedPOrVCompSENotOverdueDigits = (1-(@missedPOrVCompSEOverdue.to_f/@missedPOrVCompSETotal.to_f))
  @missedPOrVCompSEGrade= OpenSr.qualityGrade(@missedPOrVCompSENotOverdueDigits)

  @missedPhyChaPikSETotal = Sr.where(trash_quad: 'SE',sr_type:'Physically Challenged Pickup', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedPhyChaPikSEOverdue = Sr.where(trash_quad: 'SE',sr_type:'Physically Challenged Pickup', expression:['Overdue']).distinct.count(:case_number)
  @missedPhyChaPikSEPercentOverdue = "#{((@missedPhyChaPikSEOverdue.to_f.round(2)/@missedPhyChaPikSETotal.to_f.round(2))*100).round(2)}%"
  @missedPhyChaPikSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Physically Challenged Pickup', expression:['Not Overdue']).distinct.count(:case_number)
  @missedPhyChaPikSEPercentNotOverdue = "#{(((1-(@missedPhyChaPikSEOverdue.to_f/@missedPhyChaPikSETotal.to_f))*100).round(2))}%"
  @missedPhyChaPikSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Physically Challenged Pickup', expression:['Not Overdue']).distinct.count(:case_number)
  @missedPhyChaPikSEOverdueDigits = (1-(@missedPhyChaPikSEOverdue.to_f/@missedPhyChaPikSETotal.to_f))
  @missedPhyChaPikSEGrade= OpenSr.qualityGrade(@missedPhyChaPikSEOverdueDigits)

  @SEQuadSrTotal = Sr.where(status:'Open',
    expression:['Overdue', 'Not Overdue'],
    trash_quad: 'SE',
    sr_type: ['Missed Heavy Trash Pickup',
      'Container Problem','New Resident Container',
      'Recycling Participation NEW' ,
      'Recycling Cart Repair or Replace',
      'SWM Escalation','Missed Garbage Pickup',
      'Trash Dumping or Illegal Dumpsite',
       'Add A Can', 'Storm Debris Collection',
        'Dead Animal Collection', 'Add A Can CANCELLATION',
         'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
         'Physically Challenged Pickup']).distinct.count(:case_number)
  @SEQuadSrOverdue = Sr.where(status:'Open',
    expression:'Overdue',
    trash_quad: 'SE',
    sr_type: ['Missed Heavy Trash Pickup','Container Problem',
      'New Resident Container', 'Recycling Participation NEW',
      'Recycling Cart Repair or Replace','SWM Escalation',
      'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
      'Add A Can', 'Missed Recycling Pickup',
      'Storm Debris Collection', 'Dead Animal Collection',
      'Add A Can CANCELLATION', 'Personnel or Vehicle Complaint',
      'Physically Challenged Pickup']).distinct.count(:case_number)
  @SEQuadPercentOverdue = "#{((@SEQuadSrOverdue.to_f/@SEQuadSrTotal.to_f)*100).round(2)}%"
  @SEQuadSrNotOverdue = Sr.where(status:'Open',
    expression:'Not Overdue',
    trash_quad: 'SE',
    sr_type: ['Missed Heavy Trash Pickup',
      'Container Problem',
      'New Resident Container',
      'Recycling Participation NEW',
      'Recycling Cart Repair or Replace',
      'SWM Escalation',
      'Missed Garbage Pickup',
      'Trash Dumping or Illegal Dumpsite',
      'Add A Can',
      'Storm Debris Collection',
      'Dead Animal Collection',
      'Add A Can CANCELLATION',
      'Missed Recycling Pickup',
      'Personnel or Vehicle Complaint',
      'Physically Challenged Pickup']).distinct.count(:case_number)
  @SEQuadPercentNotOverdue = "#{((1-(@SEQuadSrOverdue.to_f/@SEQuadSrTotal.to_f))*100).round(2)}%"
  @SEQuadNotOverdueDigits = (1-(@SEQuadSrOverdue.to_f/@SEQuadSrTotal.to_f))
  @SEQuadQualityGrade = OpenSr.qualityGrade(@SEQuadNotOverdueDigits)
#NORTH EAST
  @missedHvyNETotal = Sr.where(trash_quad: 'NE',
    status: 'Open',
    sr_type:'Missed Heavy Trash Pickup',
    expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedHvyNEOverdue = Sr.where(trash_quad: 'NE',
    status:'Open',
    sr_type: 'Missed Heavy Trash Pickup',
    expression:['Overdue']).distinct.count(:case_number)
  @missedHvyNEPercentOverdue = "#{((@missedHvyNEOverdue.to_f.round(2)/@missedHvyNETotal.to_f.round(2))*100).round(2)}%"
  @missedHvyNEPercentNotOverdue = "#{((1-(@missedHvyNEOverdue.to_f.round(2)/@missedHvyNETotal.to_f.round(2)))*100).round(2)}%"
  @missedHvyNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Missed Heavy Trash Pickup', expression:['Not Overdue']).distinct.count(:case_number)
  @missedHvyNEOverdueDigits = (1-(@missedHvyNEOverdue.to_f/@missedHvyNETotal.to_f))
  @missedHvyNEGrade= OpenSr.qualityGrade(@missedHvyNEOverdueDigits)

  @missedConProbNETotal = Sr.where(trash_quad: 'NE',sr_type:'Container Problem', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedConProbNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Container Problem', expression:['Overdue']).distinct.count(:case_number)
  @missedConProbNEPercentOverdue = "#{((@missedConProbNEOverdue.to_f.round(2)/@missedConProbNETotal.to_f.round(2))*100).round(2)}%"
  @missedConProbNEPercentNotOverdue = "#{((1-(@missedConProbNEOverdue.to_f.round(2)/@missedConProbNETotal.to_f.round(2)))*100).round(2)}%"
  @missedConProbNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Container Problem', expression:['Not Overdue']).distinct.count(:case_number)
  @missedConProbOverdueDigits = (1-(@missedConProbNEOverdue.to_f/@missedConProbNETotal.to_f))
  @missedConProbNEGrade= OpenSr.qualityGrade(@missedConProbOverdueDigits)

  @missedNewResNETotal = Sr.where(trash_quad: 'NE',sr_type:'New Resident Container', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedNewResNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'New Resident Container', expression:['Overdue']).distinct.count(:case_number)
  @missedNewResNEPercentOverdue = "#{((@missedNewResNEOverdue.to_f.round(2)/@missedNewResNETotal.to_f.round(2))*100).round(2)}%"
  @missedNewResNEPercentNotOverdue = "#{((1-(@missedNewResNEOverdue.to_f.round(2)/@missedNewResNETotal.to_f.round(2)))*100).round(2)}%"
  @missedNewResNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'New Resident Container', expression:['Not Overdue']).distinct.count(:case_number)
  @missedNewResNEOverdueDigits = (1-(@missedNewResNEOverdue.to_f.round(2)/@missedNewResNETotal.to_f.round(2)))
  @missedNewResNEGrade= OpenSr.qualityGrade(@missedNewResNEOverdueDigits)

  @missedRecNewNETotal = Sr.where(trash_quad: 'NE',sr_type:'Recycling Participation NEW', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedRecNewNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Recycling Participation NEW', expression:['Overdue']).distinct.count(:case_number)
  @missedRecNewNEPercentOverdue = "#{((@missedRecNewNEOverdue.to_f.round(2)/@missedRecNewNETotal.to_f.round(2))*100).round(2)}%"
  @missedRecNewNEPercentNotOverdue = "#{((1-(@missedRecNewNEOverdue.to_f.round(2)/@missedRecNewNETotal.to_f.round(2)))*100).round(2)}%"
  @missedRecNewNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Recycling Participation NEW', expression:['Not Overdue']).distinct.count(:case_number)
  @missedRecNewNEOverdueDigits = (1-(@missedRecNewNEOverdue.to_f/@missedRecNewNETotal.to_f))
  @missedRecNewNEGrade= OpenSr.qualityGrade(@missedRecNewNEOverdueDigits)

  @missedRecCarRepNETotal = Sr.where(trash_quad: 'NE',sr_type:'Recycling Cart Repair or Replace', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedRecCarRepNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Recycling Cart Repair or Replace', expression:['Overdue']).distinct.count(:case_number)
  @missedRecCarRepNEPercentOverdue = "#{((@missedRecCarRepNEOverdue.to_f.round(2)/@missedRecCarRepNETotal.to_f.round(2))*100).round(2)}%"
  @missedRecCarRepNEPercentNotOverdue = "#{((1-(@missedRecCarRepNEOverdue.to_f.round(2)/@missedRecCarRepNETotal.to_f.round(2)))*100).round(2)}%"
  @missedRecCarRepNENotOverdue = (@missedRecCarRepNETotal- @missedRecCarRepNEOverdue)
  @missedRecCarRepNEOverdueDigits = (1-(@missedRecCarRepNEOverdue.to_f/@missedRecCarRepNETotal.to_f))
  @missedRecCarRepNEGrade= OpenSr.qualityGrade(@missedRecCarRepNEOverdueDigits)

  @missedSWMEscaNETotal = Sr.where(trash_quad: 'NE',sr_type:'SWM Escalation', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedSWMEscaNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'SWM Escalation', expression:['Overdue']).distinct.count(:case_number)
  @missedSWMEscaNEPercentOverdue = "#{((@missedSWMEscaNEOverdue.to_f.round(2)/@missedSWMEscaNETotal.to_f.round(2))*100).round(2)}%"
  @missedSWMEscaNEPercentNotOverdue = "#{((1-(@missedSWMEscaNEOverdue.to_f.round(2)/@missedSWMEscaNETotal.to_f.round(2)))*100).round(2)}%"
  @missedSWMEscaNENotOverdue = @missedSWMEscaNETotal - @missedSWMEscaNEOverdue
  @missedSWMEscaNEOverdueDigits = (1-(@missedSWMEscaNEOverdue.to_f/@missedSWMEscaNETotal.to_f))
  @missedSWMEscaNEGrade= OpenSr.qualityGrade(@missedSWMEscaNEOverdueDigits)

  @missedMisGarbNETotal = Sr.where(trash_quad: 'NE',sr_type:'Missed Garbage Pickup', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedMisGarbNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Missed Garbage Pickup', expression:['Overdue']).distinct.count(:case_number)
  @missedMisGarbNEPercentOverdue = "#{((@missedMisGarbNEOverdue.to_f.round(2)/@missedMisGarbNETotal.to_f.round(2))*100).round(2)}%"
  @missedMisGarbNEPercentNotOverdue = "#{((1-(@missedMisGarbNEOverdue.to_f.round(2)/@missedMisGarbNETotal.to_f.round(2)))*100).round(2)}%"
  @missedMisGarbNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Missed Garbage Pickup', expression:['Not Overdue']).distinct.count(:case_number)
  @missedMisGarbNEOverdueDigits = (1-(@missedMisGarbNEOverdue.to_f/@missedMisGarbNETotal.to_f))
  @missedMisGarbNEGrade= OpenSr.qualityGrade(@missedMisGarbNEOverdueDigits)

  @missedTrashDumpNETotal = Sr.where(trash_quad: 'NE',sr_type:'Trash Dumping or Illegal Dumpsite', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedTrashDumpNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Trash Dumping or Illegal Dumpsite', expression:['Overdue']).distinct.count(:case_number)
  @missedTrashDumpNEPercentOverdue = "#{((@missedTrashDumpNEOverdue.to_f.round(2)/@missedTrashDumpNETotal.to_f.round(2))*100).round(2)}%"
  @missedMTrashDumpNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Trash Dumping or Illegal Dumpsite', expression:['Not Overdue']).distinct.count(:case_number)
  @missedTrashDumpNEPercentNotOverdue = "#{(((1-(@missedTrashDumpNEOverdue.to_f/@missedTrashDumpNETotal.to_f))*100).round(2))}%"
  @missedTrashDumpNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Trash Dumping or Illegal Dumpsite', expression:['Not Overdue']).distinct.count(:case_number)
  @missedTrashDumpNENotOverdueDigits = (1-(@missedTrashDumpNEOverdue.to_f/@missedTrashDumpNETotal.to_f))
  @missedTrashDumpNEGrade= OpenSr.qualityGrade(@missedTrashDumpNENotOverdueDigits)

  @missedAddACanNETotal= Sr.where(trash_quad: 'NE',sr_type:'Add A Can', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedAddACanNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Add A Can', expression:['Overdue']).distinct.count(:case_number)
  @missedAddACanNEPercentOverdue = "#{((@missedAddACanNEOverdue.to_f.round(2)/@missedAddACanNETotal.to_f.round(2))*100).round(2)}%"
  @missedAddACanNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Add A Can', expression:['Not Overdue']).distinct.count(:case_number)
  @missedAddACanNEPercentNotOverdue = "#{(((1-(@missedAddACanNEOverdue.to_f/@missedAddACanNETotal.to_f))*100).round(2))}%"
  @missedAddACanNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Add A Can', expression:['Not Overdue']).distinct.count(:case_number)
  @missedAddACanNEOverdueDigits = (1-(@missedAddACanNEOverdue.to_f/@missedAddACanNETotal.to_f))
  @missedAddACanNEGrade= OpenSr.qualityGrade(@missedAddACanNEOverdueDigits)

  @missedMisRecPicUpNETotal = Sr.where(trash_quad: 'NE',sr_type:'Missed Recycling Pickup', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedMisRecPicUpNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Missed Recycling Pickup', expression:['Overdue']).distinct.count(:case_number)
  @missedMisRecPicUpNEPercentOverdue = "#{((@missedMisRecPicUpNEOverdue.to_f.round(2)/@missedMisRecPicUpNETotal.to_f.round(2))*100).round(2)}%"
  @missedMisRecPicUpNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Missed Recycling Pickup', expression:['Not Overdue']).distinct.count(:case_number)
  @missedMisRecPicUpNEPercentNotOverdue = "#{((@missedMisRecPicUpNENotOverdue.to_f.round(2)/@missedMisRecPicUpNETotal.to_f.round(2))*100).round(2)}%"
  @missedMisRecPicUpNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Missed Recycling Pickup', expression:['Not Overdue']).distinct.count(:case_number)
  @missedMisRecPicUpNEOverdueDigits = (1-(@missedMisRecPicUpNEOverdue.to_f/@missedMisRecPicUpNETotal.to_f))
  @missedMisRecPicUpNEGrade= OpenSr.qualityGrade(@missedMisRecPicUpNEOverdueDigits)

  @missedStormDebNETotal = Sr.where(trash_quad: 'NE',sr_type:'Storm Debris Collection', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedStormDebNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Storm Debris Collection', expression:['Overdue']).distinct.count(:case_number)
  @missedStormDebNEPercentOverdue = "#{((@missedStormDebNEOverdue.to_f.round(2)/@missedStormDebNETotal.to_f.round(2))*100).round(2)}%"
  @missedStormDebNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Storm Debris Collection', expression:['Not Overdue']).distinct.count(:case_number)
  @missedStormDebNEPercentNotOverdue = "#{((@missedStormDebNENotOverdue.to_f.round(2)/@missedStormDebNETotal.to_f.round(2))*100).round(2)}%"
  @missedStormDebNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Storm Debris Collection', expression:['Not Overdue']).distinct.count(:case_number)
  @missedStormDebNEOverdueDigits = (1-(@missedStormDebNEOverdue.to_f/@missedStormDebNETotal.to_f))
  @missedStormDebNEGrade= OpenSr.qualityGrade(@missedStormDebNEOverdueDigits)

  @missedDeadAniColNETotal = Sr.where(trash_quad: 'NE',sr_type:'Dead Animal Collection', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedDeadAniColNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Dead Animal Collection', expression:['Overdue']).distinct.count(:case_number)
  @missedDeadAniColNEPercentOverdue = "#{((@missedDeadAniColNEOverdue.to_f.round(2)/@missedDeadAniColNETotal.to_f.round(2))*100).round(2)}%"
  @missedDeadAniColNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Dead Animal Collection', expression:['Not Overdue']).distinct.count(:case_number)
  @missedDeadAniColNEPercentNotOverdue = "#{((@missedDeadAniColNENotOverdue.to_f.round(2)/@missedDeadAniColNETotal.to_f.round(2))*100).round(2)}%"
  @missedDeadAniColNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Dead Animal Collection', expression:['Not Overdue']).distinct.count(:case_number)
  @missedDeadAniColNEOverdueDigits = (1-(@missedDeadAniColNEOverdue.to_f/@missedDeadAniColNETotal.to_f))
  @missedDeadAniColNEGrade= OpenSr.qualityGrade(@missedDeadAniColNEOverdueDigits)

  @missedAddACanCancelNETotal = Sr.where(trash_quad: 'NE',sr_type:'Add A Can CANCELLATION', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedAddACanCancelNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Add A Can CANCELLATION', expression:['Overdue']).distinct.count(:case_number)
  @missedAddACanCancelNEPercentOverdue = "#{((@missedAddACanCancelNEOverdue.to_f.round(2)/@missedAddACanCancelNETotal.to_f.round(2))*100).round(2)}%"
  @missedAddACanCancelNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Add A Can CANCELLATION', expression:['Not Overdue']).distinct.count(:case_number)
  @missedAddACanCancelNEPercentNotOverdue = "#{(((1-(@missedAddACanCancelNEOverdue.to_f/@missedAddACanCancelNETotal.to_f))*100).round(2))}%"
  @missedAddACanCancelNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Add A Can CANCELLATION', expression:['Not Overdue']).distinct.count(:case_number)
  @missedAddACanCancelNEOverdueDigits = (1-(@missedAddACanCancelNEOverdue.to_f/@missedAddACanCancelNETotal.to_f))
  @missedAddACanCancelNEGrade= OpenSr.qualityGrade(@missedAddACanCancelNEOverdueDigits)

  @missedPOrVCompNETotal = Sr.where(trash_quad: 'NE',sr_type:'Personnel or Vehicle Complaint', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedPOrVCompNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Personnel or Vehicle Complaint', expression:['Overdue']).distinct.count(:case_number)
  @missedPOrVCompNEPercentOverdue = "#{((@missedPOrVCompNEOverdue.to_f.round(2)/@missedPOrVCompNETotal.to_f.round(2))*100).round(2)}%"
  @missedPOrVCompNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Personnel or Vehicle Complaint', expression:['Not Overdue']).distinct.count(:case_number)
  @missedPOrVCompNEPercentNotOverdue = "#{((@missedPOrVCompNENotOverdue.to_f.round(2)/@missedPOrVCompNETotal.to_f.round(2))*100).round(2)}%"
  @missedPOrVCompNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Personnel or Vehicle Complaint', expression:['Not Overdue']).distinct.count(:case_number)
  @missedPOrVCompNEOverdueDigits = (1-(@missedPOrVCompNEOverdue.to_f/@missedPOrVCompNETotal.to_f))
  @missedPOrVCompNEGrade= OpenSr.qualityGrade(@missedPOrVCompNEOverdueDigits)

  @missedPhyChaPikNETotal = Sr.where(trash_quad: 'NE',sr_type:'Physically Challenged Pickup', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
  @missedPhyChaPikNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Physically Challenged Pickup', expression:['Overdue']).distinct.count(:case_number)
  @missedPhyChaPikNEPercentOverdue = "#{((@missedPhyChaPikNEOverdue.to_f.round(2)/@missedPhyChaPikNETotal.to_f.round(2))*100).round(2)}%"
  @missedPhyChaPikNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Physically Challenged Pickup', expression:['Not Overdue']).distinct.count(:case_number)
  @missedPhyChaPikNEPercentNotOverdue = "#{(((1-(@missedPhyChaPikNEOverdue.to_f/@missedPhyChaPikNETotal.to_f))*100).round(2))}%"
  @missedPhyChaPikNENotOverdue = @missedPhyChaPikNETotal-  @missedPhyChaPikNEOverdue
  @missedPhyChaPikNEOverdueDigits = (1-(@missedPhyChaPikNEOverdue.to_f/@missedPhyChaPikNETotal.to_f))
  @missedPhyChaPikNEGrade= OpenSr.qualityGrade(@missedPhyChaPikNEOverdueDigits)

  @NEQuadSrTotal = Sr.where(status:'Open',
    expression:['Overdue', 'Not Overdue'],
    trash_quad: 'NE',
    sr_type: ['Missed Heavy Trash Pickup',
      'Container Problem',
      'New Resident Container',
      'Recycling Participation NEW',
      'Recycling Cart Repair or Replace',
      'SWM Escalation',
      'Missed Garbage Pickup',
      'Trash Dumping or Illegal Dumpsite',
      'Add A Can',
      'Storm Debris Collection',
      'Dead Animal Collection',
      'Add A Can CANCELLATION',
      'Missed Recycling Pickup',
      'Personnel or Vehicle Complaint',
      'Physically Challenged Pickup']).distinct.count(:case_number)
  @NEQuadSrOverdue = Sr.where(status:'Open',
    expression:'Overdue',
    trash_quad: 'NE',
    sr_type: ['Missed Heavy Trash Pickup',
      'Container Problem',
      'New Resident Container',
      'Recycling Participation NEW',
      'Recycling Cart Repair or Replace',
      'SWM Escalation',
      'Missed Garbage Pickup',
      'Trash Dumping or Illegal Dumpsite',
      'Add A Can',
      'Storm Debris Collection',
      'Dead Animal Collection',
      'Add A Can CANCELLATION',
      'Missed Recycling Pickup',
      'Personnel or Vehicle Complaint',
      'Physically Challenged Pickup']).distinct.count(:case_number)
  @NEQuadPercentOverdue = "#{((@NEQuadSrOverdue.to_f/@NEQuadSrTotal.to_f)*100).round(2)}%"
  @NEQuadSrNotOverdue = Sr.where(status:'Open',
    expression:'Not Overdue',
    trash_quad: 'NE',
    sr_type: ['Missed Heavy Trash Pickup',
      'Container Problem',
      'New Resident Container',
      'Recycling Participation NEW',
      'Recycling Cart Repair or Replace',
      'SWM Escalation',
      'Missed Garbage Pickup',
      'Trash Dumping or Illegal Dumpsite',
      'Add A Can',
      'Storm Debris Collection',
      'Dead Animal Collection',
      'Add A Can CANCELLATION',
      'Missed Recycling Pickup',
      'Personnel or Vehicle Complaint',
      'Physically Challenged Pickup']).distinct.count(:case_number)
  @NEQuadPercentNotOverdue = "#{((1-(@NEQuadSrOverdue.to_f/@NEQuadSrTotal.to_f))*100).round(2)}%"
  @NEQuadNotOverdueDigits = (1-(@NEQuadSrOverdue.to_f/@NEQuadSrTotal.to_f))
  @NEQuadQualityGrade = OpenSr.qualityGrade(@NEQuadNotOverdueDigits)

#NORTH WEST
      @missedHvyNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Missed Heavy Trash Pickup', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
      @missedHvyNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Missed Heavy Trash Pickup', expression:['Overdue']).distinct.count(:case_number)
      @missedHvyNWPercentOverdue = "#{((@missedHvyNWOverdue.to_f.round(2)/@missedHvyNWTotal.to_f.round(2))*100).round(2)}%"
      @missedHvyNWPercentNotOverdue = "#{((1-(@missedHvyNWOverdue.to_f.round(2)/@missedHvyNWTotal.to_f.round(2)))*100).round(2)}%"
      @missedHvyNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Missed Heavy Trash Pickup', expression:['Not Overdue']).distinct.count(:case_number)
      @missedHvyNWOverdueDigits = (1-(@missedHvyNWOverdue.to_f/@missedHvyNWTotal.to_f))
      @missedHvyNWGrade= OpenSr.qualityGrade(@missedHvyNWOverdueDigits)

      @missedConProbNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Container Problem', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
      @missedConProbNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Container Problem', expression:['Overdue']).distinct.count(:case_number)
      @missedConProbNWPercentOverdue = "#{((@missedConProbNWOverdue.to_f.round(2)/@missedConProbNWTotal.to_f.round(2))*100).round(2)}%"
      @missedConProbNWPercentNotOverdue = "#{((1-(@missedConProbNWOverdue.to_f.round(2)/@missedConProbNWTotal.to_f.round(2)))*100).round(2)}%"
      @missedConProbNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Container Problem', expression:['Not Overdue']).distinct.count(:case_number)
      @missedConProbNWOverdueDigits = (1-(@missedConProbNWOverdue.to_f/@missedConProbNWTotal.to_f))
      @missedConProbNWGrade= OpenSr.qualityGrade(@missedConProbNWOverdueDigits)

      @missedNewResNWTotal = Sr.where(trash_quad: 'NW',sr_type:'New Resident Container', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
      @missedNewResNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'New Resident Container', expression:['Overdue']).distinct.count(:case_number)
      @missedNewResNWPercentOverdue = "#{((@missedNewResNWOverdue.to_f.round(2)/@missedNewResNWTotal.to_f.round(2))*100).round(2)}%"
      @missedNewResNWPercentNotOverdue = "#{((1-(@missedNewResNWOverdue.to_f.round(2)/@missedNewResNWTotal.to_f.round(2)))*100).round(2)}%"
      @missedNewResNWNotOverdue = @missedNewResNWTotal- @missedNewResNWOverdue
      @missedNewResNWOverdueDigits = (1-(@missedNewResNWOverdue.to_f/@missedNewResNWTotal.to_f))
      @missedNewResNWGrade= OpenSr.qualityGrade(@missedNewResNWOverdueDigits)

      @missedRecNewNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Recycling Participation NEW', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
      @missedRecNewNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Recycling Participation NEW', expression:['Overdue']).distinct.count(:case_number)
      @missedRecNewNWPercentOverdue = "#{((@missedRecNewNWOverdue.to_f.round(2)/@missedRecNewNWTotal.to_f.round(2))*100).round(2)}%"
      @missedRecNewNWPercentNotOverdue = "#{((1-(@missedRecNewNWOverdue.to_f.round(2)/@missedRecNewNWTotal.to_f.round(2)))*100).round(2)}%"
      @missedRecNewNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Recycling Participation NEW', expression:['Not Overdue']).distinct.count(:case_number)
      @missedRecNewNWOverdueDigits = (1-(@missedRecNewNWOverdue.to_f/@missedRecNewNWTotal.to_f))
      @missedRecNewNWGrade= OpenSr.qualityGrade(@missedRecNewNWOverdueDigits)

      @missedRecCarRepNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Recycling Cart Repair or Replace', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
      @missedRecCarRepNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Recycling Cart Repair or Replace', expression:['Overdue']).distinct.count(:case_number)
      @missedRecCarRepNWPercentOverdue = "#{((@missedRecCarRepNWOverdue.to_f.round(2)/@missedRecCarRepNWTotal.to_f.round(2))*100).round(2)}%"
      @missedRecCarRepNWPercentNotOverdue = "#{((1-(@missedRecCarRepNWOverdue.to_f.round(2)/@missedRecCarRepNWTotal.to_f.round(2)))*100).round(2)}%"
      @missedRecCarRepNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Recycling Cart Repair or Replace', expression:['Not Overdue']).distinct.count(:case_number)
      @missedRecCarRepNWOverdueDigits = (1-(@missedRecCarRepNWOverdue.to_f/@missedRecCarRepNWTotal.to_f))
      @missedRecCarRepNWGrade= OpenSr.qualityGrade(@missedRecCarRepNWOverdueDigits)

      @missedSWMEscaNWTotal = Sr.where(trash_quad: 'NW',sr_type:'SWM Escalation', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
      @missedSWMEscaNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'SWM Escalation', expression:['Overdue']).distinct.count(:case_number)
      @missedSWMEscaNWPercentOverdue = "#{((@missedSWMEscaNWOverdue.to_f.round(2)/@missedSWMEscaNWTotal.to_f.round(2))*100).round(2)}%"
      @missedSWMEscaNWPercentNotOverdue = "#{((1-(@missedSWMEscaNWOverdue.to_f.round(2)/@missedSWMEscaNWTotal.to_f.round(2)))*100).round(2)}%"
      @missedSWMEscaNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'SWM Escalation', expression:['Not Overdue']).distinct.count(:case_number)
      @missedSWMEscaNWOverdueDigits = (1-(@missedSWMEscaNWOverdue.to_f/@missedSWMEscaNWTotal.to_f))
      @missedSWMEscaNWGrade= OpenSr.qualityGrade(@missedSWMEscaNWOverdueDigits)

      @missedMisGarbNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Missed Garbage Pickup', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
      @missedMisGarbNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Missed Garbage Pickup', expression:['Overdue']).distinct.count(:case_number)
      @missedMisGarbNWPercentOverdue = "#{((@missedMisGarbNWOverdue.to_f.round(2)/@missedMisGarbNWTotal.to_f.round(2))*100).round(2)}%"
      @missedMisGarbNWPercentNotOverdue = "#{((1-(@missedMisGarbNWOverdue.to_f.round(2)/@missedMisGarbNWTotal.to_f.round(2)))*100).round(2)}%"
      @missedMisGarbNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Missed Garbage Pickup', expression:['Not Overdue']).distinct.count(:case_number)
      @missedMisGarbNWOverdueDigits = (1-(@missedMisGarbNWOverdue.to_f/@missedMisGarbNWTotal.to_f))
      @missedMisGarbNWGrade= OpenSr.qualityGrade(@missedMisGarbNWOverdueDigits)

      @missedTrashDumpNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Trash Dumping or Illegal Dumpsite', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
      @missedTrashDumpNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Trash Dumping or Illegal Dumpsite', expression:['Overdue']).distinct.count(:case_number)
      @missedTrashDumpNWPercentOverdue = "#{((@missedTrashDumpNWOverdue.to_f.round(2)/@missedTrashDumpNWTotal.to_f.round(2))*100).round(2)}%"
      @missedMTrashDumpNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Trash Dumping or Illegal Dumpsite', expression:['Not Overdue']).distinct.count(:case_number)
      @missedTrashDumpNWPercentNotOverdue = "#{((@missedMTrashDumpNWNotOverdue.to_f.round(2)/@missedTrashDumpNWTotal.to_f.round(2))*100).round(2)}%"
      @missedTrashDumpNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Trash Dumping or Illegal Dumpsite', expression:['Not Overdue']).distinct.count(:case_number)
      @missedTrashDumpNWOverdueDigits = (1-(@missedTrashDumpNWOverdue.to_f/@missedTrashDumpNWTotal.to_f))
      @missedTrashDumpNWGrade= OpenSr.qualityGrade(@missedTrashDumpNWOverdueDigits)

      @missedAddACanNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Add A Can', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
      @missedAddACanNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Add A Can', expression:['Overdue']).distinct.count(:case_number)
      @missedAddACanNWPercentOverdue = "#{((@missedAddACanNWOverdue.to_f.round(2)/@missedAddACanNWTotal.to_f.round(2))*100).round(2)}%"
      @missedAddACanNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Add A Can', expression:['Not Overdue']).distinct.count(:case_number)
      @missedAddACanNWPercentNotOverdue = "#{((@missedAddACanNWNotOverdue.to_f.round(2)/@missedAddACanNWTotal.to_f.round(2))*100).round(2)}%"
      @missedAddACanNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Add A Can', expression:['Not Overdue']).distinct.count(:case_number)
      @missedAddACanNWOverdueDigits = (1-(@missedAddACanNWOverdue.to_f/@missedAddACanNWTotal.to_f))
      @missedAddACanNWGrade= OpenSr.qualityGrade(@missedAddACanNWOverdueDigits)

      @missedMisRecPicUpNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Missed Recycling Pickup', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
      @missedMisRecPicUpNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Missed Recycling Pickup', expression:['Overdue']).distinct.count(:case_number)
      @missedMisRecPicUpNWPercentOverdue = "#{((@missedMisRecPicUpNWOverdue.to_f.round(2)/@missedMisRecPicUpNWTotal.to_f.round(2))*100).round(2)}%"
      @missedMisRecPicUpNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Missed Recycling Pickup', expression:['Not Overdue']).distinct.count(:case_number)
      @missedMisRecPicUpNWPercentNotOverdue = "#{(((1-(@missedMisRecPicUpNWOverdue.to_f/@missedMisRecPicUpNWTotal.to_f))*100).round(2))}%"
      @missedMisRecPicUpNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Missed Recycling Pickup', expression:['Not Overdue']).distinct.count(:case_number)
      @missedMisRecPicUpNWOverdueDigits = (1-(@missedMisRecPicUpNWOverdue.to_f/@missedMisRecPicUpNWTotal.to_f))
      @missedMisRecPicUpNWGrade= OpenSr.qualityGrade(@missedMisRecPicUpNWOverdueDigits)

      @missedStormDebNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Storm Debris Collection', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
      @missedStormDebNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Storm Debris Collection', expression:['Overdue']).distinct.count(:case_number)
      @missedStormDebNWPercentOverdue = "#{((@missedStormDebNWOverdue.to_f.round(2)/@missedStormDebNWTotal.to_f.round(2))*100).round(2)}%"
      @missedStormDebNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Storm Debris Collection', expression:['Not Overdue']).distinct.count(:case_number)
      @missedStormDebNWPercentNotOverdue = "#{((@missedStormDebNWNotOverdue.to_f.round(2)/@missedStormDebNWTotal.to_f.round(2))*100).round(2)}%"
      @missedStormDebNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Storm Debris Collection', expression:['Not Overdue']).distinct.count(:case_number)
      @missedStormDebNWOverdueDigits = (1-(@missedStormDebNWOverdue.to_f/@missedStormDebNWTotal.to_f))
      @missedStormDebNWGrade= OpenSr.qualityGrade(@missedStormDebNWOverdueDigits)

      @missedDeadAniColNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Dead Animal Collection', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
      @missedDeadAniColNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Dead Animal Collection', expression:['Overdue']).distinct.count(:case_number)
      @missedDeadAniColNWPercentOverdue = "#{((@missedDeadAniColNWOverdue.to_f.round(2)/@missedDeadAniColNWTotal.to_f.round(2))*100).round(2)}%"
      @missedDeadAniColNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Dead Animal Collection', expression:['Not Overdue']).distinct.count(:case_number)
      @missedDeadAniColNWPercentNotOverdue = "#{((@missedDeadAniColNWNotOverdue.to_f.round(2)/@missedDeadAniColNWTotal.to_f.round(2))*100).round(2)}%"
      @missedDeadAniColNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Dead Animal Collection', expression:['Not Overdue']).distinct.count(:case_number)
      @missedDeadAniColNWOverdueDigits = (1-(@missedDeadAniColNWOverdue.to_f/@missedDeadAniColNWTotal.to_f))
      @missedDeadAniColNWGrade= OpenSr.qualityGrade(@missedDeadAniColNWOverdueDigits)

      @missedAddACanCancelNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Add A Can CANCELLATION', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
      @missedAddACanCancelNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Add A Can CANCELLATION', expression:['Overdue']).distinct.count(:case_number)
      @missedAddACanCancelNWPercentOverdue = "#{((@missedAddACanCancelNWOverdue.to_f.round(2)/@missedAddACanCancelNWTotal.to_f.round(2))*100).round(2)}%"
      @missedAddACanCancelNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Add A Can CANCELLATION', expression:['Not Overdue']).distinct.count(:case_number)
      @missedAddACanCancelNWPercentNotOverdue = "#{((@missedAddACanCancelNWNotOverdue.to_f.round(2)/@missedAddACanCancelNWTotal.to_f.round(2))*100).round(2)}%"
      @missedAddACanCancelNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Add A Can CANCELLATION', expression:['Not Overdue']).distinct.count(:case_number)
      @missedAddACanCancelNWOverdueDigits = (1-(@missedAddACanCancelNWOverdue.to_f/@missedAddACanCancelNWTotal.to_f))
      @missedAddACanCancelNWGrade= OpenSr.qualityGrade(@missedAddACanCancelNWOverdueDigits)

      @missedPOrVCompNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Personnel or Vehicle Complaint', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
      @missedPOrVCompNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Personnel or Vehicle Complaint', expression:['Overdue']).distinct.count(:case_number)
      @missedPOrVCompNWPercentOverdue = "#{((@missedPOrVCompNWOverdue.to_f.round(2)/@missedPOrVCompNWTotal.to_f.round(2))*100).round(2)}%"
      @missedPOrVCompNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Personnel or Vehicle Complaint', expression:['Not Overdue']).distinct.count(:case_number)
      @missedPOrVCompNWPercentNotOverdue = "#{(((1-(@missedPOrVCompNWOverdue.to_f/@missedPOrVCompNWTotal.to_f))*100).round(2))}%"
      @missedPOrVCompNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Personnel or Vehicle Complaint', expression:['Not Overdue']).distinct.count(:case_number)
      @missedPOrVCompNWOverdueDigits = (1-(@missedPOrVCompNWOverdue.to_f/@missedPOrVCompNWTotal.to_f))
      @missedPOrVCompNWGrade= OpenSr.qualityGrade(@missedPOrVCompNWOverdueDigits)

      @missedPhyChaPikNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Physically Challenged Pickup', expression:['Overdue','Not Overdue']).distinct.count(:case_number)
      @missedPhyChaPikNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Physically Challenged Pickup', expression:['Overdue']).distinct.count(:case_number)
      @missedPhyChaPikNWPercentOverdue = "#{((@missedPhyChaPikNWOverdue.to_f.round(2)/@missedPhyChaPikNWTotal.to_f.round(2))*100).round(2)}%"
      @missedPhyChaPikNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Physically Challenged Pickup', expression:['Not Overdue']).distinct.count(:case_number)
      @missedPhyChaPikNWPercentNotOverdue = "#{((@missedPhyChaPikNWNotOverdue.to_f.round(2)/@missedPhyChaPikNWTotal.to_f.round(2))*100).round(2)}%"
      @missedPhyChaPikNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Physically Challenged Pickup', expression:['Not Overdue']).distinct.count(:case_number)
      @missedPhyChaPikNWOverdueDigits = (1-(@missedPhyChaPikNWOverdue.to_f/@missedPhyChaPikNWTotal.to_f))
      @missedPhyChaPikNWGrade= OpenSr.qualityGrade(@missedPhyChaPikNWOverdueDigits)

      @NWQuadSrTotal = Sr.where(status:'Open',
        expression:['Overdue', 'Not Overdue'],
        trash_quad: 'NW',
        sr_type: ['Missed Heavy Trash Pickup',
          'Container Problem',
          'New Resident Container',
          'Recycling Participation NEW',
          'Recycling Cart Repair or Replace',
          'SWM Escalation',
          'Missed Garbage Pickup',
          'Trash Dumping or Illegal Dumpsite',
          'Add A Can',
          'Storm Debris Collection',
          'Dead Animal Collection',
          'Add A Can CANCELLATION',
          'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint',
          'Physically Challenged Pickup']).distinct.count(:case_number)
      @NWQuadSrOverdue = Sr.where(status:'Open',
        expression:'Overdue',
        trash_quad: 'NW',
        sr_type: ['Missed Heavy Trash Pickup',
          'Container Problem',
          'New Resident Container',
          'Recycling Participation NEW',
          'Recycling Cart Repair or Replace',
          'SWM Escalation',
          'Missed Garbage Pickup',
          'Trash Dumping or Illegal Dumpsite',
          'Add A Can',
          'Storm Debris Collection',
          'Dead Animal Collection',
          'Add A Can CANCELLATION',
          'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint',
          'Physically Challenged Pickup']).distinct.count(:case_number)
      @NWQuadPercentOverdue = "#{(((@NWQuadSrOverdue.to_f/@NWQuadSrTotal.to_f)*100).round(2))}%"
      @NWQuadSrNotOverdue = Sr.where(status:'Open',
        expression:'Not Overdue',
        trash_quad: 'NW',
        sr_type: ['Missed Heavy Trash Pickup',
          'Container Problem',
          'New Resident Container',
          'Recycling Participation NEW',
          'Recycling Cart Repair or Replace',
          'SWM Escalation',
          'Missed Garbage Pickup',
          'Trash Dumping or Illegal Dumpsite',
          'Add A Can',
          'Storm Debris Collection',
          'Dead Animal Collection',
          'Add A Can CANCELLATION',
          'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint',
          'Physically Challenged Pickup']).distinct.count(:case_number)
      @NWQuadPercentNotOverdue = "#{(((1-(@NWQuadSrOverdue.to_f/@NWQuadSrTotal.to_f))*100).round(2))}%"
      @NWQuadNotOverdueDigits = (1-(@NWQuadSrOverdue.to_f/@NWQuadSrTotal.to_f))
      @NWQuadQualityGrade = OpenSr.qualityGrade(@NWQuadNotOverdueDigits)
  end
  def monthly_requests_summary
    @July2019_Container_Related = Sr.july_2019_containers_related
    @August2019_Container_Related = Sr.august_2019_containers_related
    @Sept_2019_containers_related = Sr.sept_2019_containers_related
    @Oct_2019_containers_related = Sr.oct_2019_containers_related
    @Nov_2019_containers_related = Sr.nov_2019_containers_related
    @Dec_2019_containers_related = Sr.dec_2019_containers_related
    @jan_2020_containers_related = Sr.jan_2020_containers_related
    @feb_2020_containers_related = Sr.feb_2020_containers_related
    @mar_2020_containers_related = Sr.mar_2020_containers_related
    @apr_2020_containers_related= Sr.april_2020_containers_related
    @may_2020_containers_related= Sr.may_2020_containers_related
    @jun_2020_containers_related= Sr.june_2020_containers_related
    @fy_2021_containers_related= Sr.fy_2021_containers_related
    @total_containers_related =  Sr.total_containers_related

    @Jul_2019_missed_garbage = Sr.july_2019_missed_garbage
    @Aug_2019_missed_garbage = Sr.august_2019_missed_garbage
    @Sept_2019_missed_garbage = Sr.sept_2019_missed_garbage
    @Oct_2019_missed_garbage = Sr.oct_2019_missed_garbage
    @Nov_2019_missed_garbage = Sr.nov_2019_missed_garbage
    @Dec_2019_missed_garbage = Sr.dec_2019_missed_garbage
    @jan_2020_missed_garbage = Sr.jan_2020_missed_garbage
    @feb_2020_missed_garbage = Sr.feb_2020_missed_garbage
    @mar_2020_missed_garbage = Sr.mar_2020_missed_garbage
    @apr_2020_missed_garbage= Sr.april_2020_missed_garbage
    @may_2020_missed_garbage= Sr.may_2020_missed_garbage
    @jun_2020_missed_garbage= Sr.june_2020_missed_garbage
    @fy_2021_missed_garbage= Sr.fy_2021_missed_garbage
    @total_missed_garbage= Sr.total_missed_garbage

    @Jul_2019_missed_hvy = Sr.july_2019_missed_hvy
    @Aug_2019_missed_hvy = Sr.august_2019_missed_hvy
    @Sept_2019_missed_hvy = Sr.sept_2019_missed_hvy
    @Oct_2019_missed_hvy = Sr.oct_2019_missed_hvy
    @Nov_2019_missed_hvy = Sr.nov_2019_missed_hvy
    @Dec_2019_missed_hvy = Sr.dec_2019_missed_hvy
    @jan_2020_missed_hvy = Sr.jan_2020_missed_hvy
    @feb_2020_missed_hvy = Sr.feb_2020_missed_hvy
    @mar_2020_missed_hvy = Sr.mar_2020_missed_hvy
    @apr_2020_missed_hvy= Sr.april_2020_missed_hvy
    @may_2020_missed_hvy= Sr.may_2020_missed_hvy
    @jun_2020_missed_hvy= Sr.june_2020_missed_hvy
    @fy_2021_missed_hvy= Sr.fy_2021_missed_hvy
    @total_missed_hvy= Sr.total_missed_hvy

    @Jul_2019_missed_rec = Sr.july_2019_missed_rec
    @Aug_2019_missed_rec = Sr.august_2019_missed_rec
    @Sept_2019_missed_rec = Sr.sept_2019_missed_rec
    @Oct_2019_missed_rec = Sr.oct_2019_missed_rec
    @Nov_2019_missed_rec = Sr.nov_2019_missed_rec
    @Dec_2019_missed_rec = Sr.dec_2019_missed_rec
    @jan_2020_missed_rec = Sr.jan_2020_missed_rec
    @feb_2020_missed_rec = Sr.feb_2020_missed_rec
    @mar_2020_missed_rec = Sr.mar_2020_missed_rec
    @apr_2020_missed_rec= Sr.april_2020_missed_rec
    @may_2020_missed_rec= Sr.may_2020_missed_rec
    @jun_2020_missed_rec= Sr.june_2020_missed_rec
    @fy_2021_missed_rec= Sr.fy_2021_missed_rec
    @total_missed_rec= Sr.total_missed_rec

    @Jul_2019_missed_yar = Sr.july_2019_missed_yar
    @Aug_2019_missed_yar = Sr.august_2019_missed_yar
    @Sept_2019_missed_yar = Sr.sept_2019_missed_yar
    @Oct_2019_missed_yar = Sr.oct_2019_missed_yar
    @Nov_2019_missed_yar = Sr.nov_2019_missed_yar
    @Dec_2019_missed_yar = Sr.dec_2019_missed_yar
    @jan_2020_missed_yar = Sr.jan_2020_missed_yar
    @feb_2020_missed_yar = Sr.feb_2020_missed_yar
    @mar_2020_missed_yar = Sr.mar_2020_missed_yar
    @apr_2020_missed_yar= Sr.april_2020_missed_yar
    @may_2020_missed_yar= Sr.may_2020_missed_yar
    @jun_2020_missed_yar= Sr.june_2020_missed_yar
    @fy_2021_missed_yar= Sr.fy_2021_missed_yar
    @total_missed_yar= Sr.total_missed_yar

    @july_2019_sr_total= Sr.july_2019_sr_total
    @august_2019_sr_total= Sr.august_2019_sr_total
    @september_2019_sr_total= Sr.september_2019_sr_total
    @october_2019_sr_total= Sr.october_2019_sr_total
    @november_2019_sr_total= Sr.november_2019_sr_total
    @december_2019_sr_total= Sr.december_2019_sr_total
    @jan_2020_sr_total= Sr.jan_2020_sr_total
    @feb_2020_sr_total= Sr.feb_2020_sr_total
    @mar_2020_sr_total= Sr.mar_2020_sr_total
    @apr_2020_sr_total= Sr.apr_2020_sr_total
    @may_2020_sr_total= Sr.may_2020_sr_total
    @jun_2020_sr_total= Sr.jun_2020_sr_total
    @fy2021_sr_total=  Sr.fy2021_sr_total
    @fy2020_2021_sr_total= Sr.fy2020_2021_sr_total
  end
  def cans_requests_FY20
    render "cans_related_FY20"
  end
  def misc_summary
    @NewResidentContainerOverdue = Sr.
      where(sr_type: 'New Resident Container',
        status: 'Open', expression: 'Overdue').count
    @NewResidentContainerNotOverdue = Sr.
      where(sr_type: 'New Resident Container',
        status: 'Open', expression: 'Not Overdue').count
    @NewResidentContainerTotal =
      @NewResidentContainerOverdue +
      @NewResidentContainerNotOverdue
    @NewResidentContainerPercentOverdue =
      "#{((@NewResidentContainerOverdue.to_f/
      @NewResidentContainerTotal.to_f)*100).round(2)}%"
    @NewResidentContainerPercentNotOverdue =
      "#{((@NewResidentContainerNotOverdue.to_f/
      @NewResidentContainerTotal.to_f)*100).round(2)}%"
    @NewResidentContainerDigits =
      @NewResidentContainerPercentNotOverdue.to_f/
      @NewResidentContainerTotal.to_f
    @NewResidentContainerGrade =
      OpenSr.qualityGrade(@NewResidentContainerDigits)

    @PerOrVehComplaintOverdue = Sr.
      where(sr_type: 'Personnel or Vehicle Complaint',
        status: 'Open', expression: 'Overdue').count
    @PerOrVecComplaintNotOverdue = Sr.
      where(sr_type: 'Personnel or Vehicle Complaint',
        status: 'Open', expression: 'Not Overdue').count
    @PerOrVecComplaintTotal = @PerOrVehComplaintOverdue +
    @PerOrVecComplaintNotOverdue
    @PerOrVecComplaintPercentOverdue =
      "#{((@PerOrVehComplaintOverdue.to_f/
      @NewResidentContainerTotal.to_f)*100).round(2)}%"
    @PerOrVecComplaintPercentNotOverdue =
      "#{((@PerOrVehComplaintNotOverdue.to_f/
      @NewResidentContainerTotal.to_f)*100).round(2)}%"
    @PerOrVecComplaintDigits =
      @PerOrVehComplaintNotOverdue.to_f/
      @PerOrVecComplaintNotOverdue.to_f
    @PerOrVecComplaintGrade = OpenSr.qualityGrade(@PerOrVecComplaintDigits)

    @PropDamOverdue = Sr.
      where(sr_type: 'Property Damage',
        status: 'Open', expression: 'Overdue').count
    @PropDamNotOverdue = Sr.
      where(sr_type: 'Property Damage',
        status: 'Open', expression: 'Not Overdue').count
    @PropDamTotal = @PropDamOverdue + @PropDamNotOverdue
    @PropDamPercentOverdue =
      "#{((@PropDamOverdue.to_f/
      @PropDamTotal.to_f)*100).round(2)}"
    @PropDamPercentNotOverdue =
      "#{((@PropDamNotOverdue.to_f/
      @PropDamTotal.to_f)*100).round(2)}"
    @PropDamDigits =
      @PropDamNotOverdue.to_f/
      @PropDamNotOverdue.to_f
    @PropDamGrade = OpenSr.qualityGrade(@PropDamDigits)

    @RecBinCarRetrieveOverdue = Sr.
      where(sr_type: 'Recycle Bin/Cart Retrieve',
        status: 'Open', expression: 'Overdue').count
    @RecBinCarRetrieveNotOverdue = Sr.
      where(sr_type: 'Recycle Bin/Cart Retrieve',
        status: 'Open', expression: 'Overdue').count
    @RecBinCarRetrieveTotal =
      @RecBinCarRetrieveOverdue +
      @RecBinCarRetrieveNotOverdue
    @RecBinCarRetrievePercentOverdue =
      "#{((@RecBinCarRetrieveOverdue.to_f/
      @RecBinCarRetrieveTotal.to_f)*100).round(2)}%"
    @RecBinCarRetrievePercentNotOverdue =
      "#{((@RecBinCarRetrieveNotOverdue.to_f/
      @RecBinCarRetrieveTotal.to_f)*100).round(2)}%"
    @RecBinCarRetrieveDigits =
      @RecBinCarRetrieveNotOverdue.to_f/
      @RecBinCarRetrieveNotOverdue.to_f
    @RecBinCarRetrieveGrade = OpenSr.qualityGrade(@RecBinCarRetrieveDigits)

    @StormDebrisCollectOverdue = Sr.
    where(sr_type: 'Storm Debris Collection',
    status: 'Open', expression: 'Overdue').count
    @StormDebrisCollectNotOverdue = Sr.
    where(sr_type: 'Storm Debris Collection',
    status: 'Open', expression: 'Not Overdue').count
    @StormDebrisCollectTotal =
      @StormDebrisCollectOverdue +
      @StormDebrisCollectNotOverdue
    @StormDebrisCollectPercentOverdue =
      "#{((@StormDebrisCollectOverdue.to_f/
      @StormDebrisCollectTotal.to_f)*100).round(2)}%"
    @StormDebrisCollectPercentNotOverdue=
      "#{((@StormDebrisCollectNotOverdue.to_f/
      @StormDebrisCollectTotal.to_f)*100).round(2)}%"
    @StormDebrisCollectDigits =
      @StormDebrisCollectNotOverdue.to_f/
      @StormDebrisCollectTotal.to_f
    @StormDebrisCollectGrade =
      OpenSr.qualityGrade(@StormDebrisCollectDigits)

    @TrashDumpingOrIllegalDumpSiteOverdue = Sr.
      where(sr_type: 'Trash Dumping or Illegal Dumpsite',
        status: 'Open', expression: 'Overdue').count
    @TrashDumpingOrIllegalDumpSiteNotOverdue = Sr.
      where(sr_type: 'Trash Dumping or Illegal Dumpsite',
        status: 'Open', expression: 'Not Overdue').count
    @TrashDumpingOrIllegalDumpSiteTotal =
      @TrashDumpingOrIllegalDumpSiteOverdue +
      @TrashDumpingOrIllegalDumpSiteNotOverdue
    @TrashDumpingOrIllegalDumpSitePercentOverdue =
      "#{((@TrashDumpingOrIllegalDumpSiteOverdue.to_f/
      @TrashDumpingOrIllegalDumpSiteTotal.to_f)*100).round(2)}%"

    @TrashDumpingOrIllegalDumpSitePercentNotOverdue =
      "#{((@TrashDumpingOrIllegalDumpSiteNotOverdue.to_f/
      @TrashDumpingOrIllegalDumpSiteTotal.to_f)*100).round(2)}%"

    @TrashDumpingOrIllegalDumpSiteDigits =
      @TrashDumpingOrIllegalDumpSiteNotOverdue.to_f/
      @TrashDumpingOrIllegalDumpSiteTotal.to_f
    @TrashDumpingOrIllegalDumpSiteGrade =
    OpenSr.qualityGrade(@TrashDumpingOrIllegalDumpSiteDigits)

    @AddACanOverdue = Sr.
    where(sr_type: 'Add A Can',
    status: 'Open', expression: 'Overdue').count

    @AddACanNotOverdue = Sr.
    where(sr_type: 'Add A Can',
    status: 'Open', expression: 'Not Overdue').count

    @AddACanTotal= @AddACanOverdue + @AddACanNotOverdue

    @AddACanPercentOverdue=
    "#{((@AddACanOverdue.to_f/@AddACanTotal.to_f)*100).round(2)}%"
    @AddACanPercentNotOverdue=
      "#{((@AddACanNotOverdue.to_f/@AddACanTotal.to_f)*100).round(2)}%"
    @AddACanDigits = @AddACanNotOverdue.to_f/@AddACanTotal.to_f
    @AddACanGrade = OpenSr.qualityGrade(@AddACanDigits)

    @SWM_CustomerEscalationOverdue = Sr.
      where(sr_type: 'SWM_CustomerEscalation',
        status: 'Open', expression: 'Overdue').count
    @SWM_CustomerEscalationNotOverdue = Sr.
      where(sr_type: 'SWM_CustomerEscalation',
        status: 'Open', expression: 'Not Overdue').count
    @SWM_CustomerEscalationTotal =
      @SWM_CustomerEscalationOverdue +
      @SWM_CustomerEscalationNotOverdue
    @SWM_CustomerEscalationPercentOverdue =
      "#{((@SWM_CustomerEscalationOverdue.to_f/
      @SWM_CustomerEscalationTotal.to_f)*100).round(2)}"

    @SWM_CustomerEscalationPercentNotOverdue =
      "#{((@SWM_CustomerEscalationNotOverdue.to_f/
      @SWM_CustomerEscalationTotal.to_f)*100).round(2)}"

    @SWM_CustomerEscalationDigits =
      @SWM_CustomerEscalationNotOverdue.to_f/
      @SWM_CustomerTotal.to_f

    @SWM_CustomerEscalationGrade =
    OpenSr.qualityGrade(@SWM_CustomerEscalationDigits)

    @SWM_EscalationOverdue = Sr.
    where(sr_type: 'SWM Escalation',
    status: 'Open', expression: 'Overdue').count

    @SWM_EscalationNotOverdue = Sr.
    where(sr_type: 'SWM Escalation',
    status: 'Open', expression: 'Not Overdue').count

    @SWM_EscalationTotal = Sr.
    where(sr_type: 'SWM Escalation',
    status: 'Open',expression: 'Overdue').count + Sr.
    where(sr_type: 'SWM Escalation',
    status: 'Open', expression: 'Not Overdue').count

    @SWM_EscalationPercentOverdue =
    "#{((@SWM_EscalationOverdue.to_f/
    @SWM_EscalationTotal.to_f)*100).round(2)}%"

    @SWM_EscalationPercentNotOverdue =
    "#{((@SWM_EscalationNotOverdue.to_f/
    @SWM_EscalationTotal.to_f)*100).round(2)}%"

    @SWM_EscalationDigits = @SWM_EscalationNotOverdue.to_f/
    @SWM_EscalationTotal.to_f

    @SWM_EscalationGrade = OpenSr.qualityGrade(@SWM_EscalationDigits)

    @NonResidentialCollectionServiceNEWOverdue = Sr.
    where(sr_type: 'Non Residential Collection Service NEW',
    status:'Open', expression: 'Overdue').count
    @NonResidentialCollectionServiceNEWNotOverdue = Sr.
    where(sr_type: 'Non Residential Collection Service NEW',
    status:'Open', expression: 'Not Overdue').count

    @NonResidentialCollectionServiceNEWTotal =
    @NonResidentialCollectionServiceNEWOverdue +
    @NonResidentialCollectionServiceNEWNotOverdue

    @NonResidentialCollectionServiceNEWPercentOverdue =
    "#{((@NonResidentialCollectionServiceNEWOverdue.to_f/
    @NonResidentialCollectionServiceNEWTotal.to_f)*100).round(2)}%"
    @NonResidentialCollectionServiceNEWPercentNotOverdue =
    "#{((@NonResidentialCollectionServiceNEWNotOverdue.to_f/
    @NonResidentialCollectionServiceNEWTotal.to_f)*100).round(2)}%"

    @NonResidentialCollectionServiceNEWDigits=
    @NonResidentialCollectionServiceNEWNotOverdue.to_f/
    @NonResidentialCollectionServiceNEWTotal.to_f

    @NonResidentialCollectionServiceNEWGrade =
    OpenSr.qualityGrade(@NonResidentialCollectionServiceNEWDigits)

    @PhysicallyChallengedPickupOverdue = Sr.
      where(sr_type: 'Physically Challenged Pickup',
        status: 'Open',  expression: 'Overdue').count
    @PhysicallyChallengedPickupNotOverdue = Sr.
      where(sr_type: 'Physically Challenged Pickup',
        status: 'Open', expression: 'Not Overdue').count
    @PhysicallyChallengedPickupTotal =
      @PhysicallyChallengedPickupOverdue +
      @PhysicallyChallengedPickupNotOverdue
    @PhysicallyChallengedPickupPercentOverdue =
    "#{((@PhysicallyChallengedPickupOverdue.to_f/
    @PhysicallyChallengedPickupTotal.to_f)*100).round(2)}%"
    @PhysicallyChallengedPickupPercentNotOverdue =
    "#{((@PhysicallyChallengedPickupNotOverdue.to_f/
    @PhysicallyChallengedPickupTotal.to_f)*100).round(2)}%"
    @PhysicallyChallengedPickupDigit =
      @PhysicallyChallengedPickupNotOverdue.to_f/
      @PhysicallyChallengedPickupTotal.to_f
    @PhysicallyChallengedPickupGrade =
      OpenSr.qualityGrade(@PhysicallyChallengedPickupDigit)

    @DumpsterComplaintOverdue = Sr.
    where(sr_type: 'Dumpster Complaint',
    status: 'Open', expression: 'Overdue').count
    @DumpsterComplaintNotOverdue = Sr.
    where(sr_type: 'Dumpster Complaint',
    status: 'Open',  expression: 'Not Overdue').count
    @DumpsterComplaintTotal = @DumpsterComplaintOverdue + @DumpsterComplaintNotOverdue
    @DumpsterComplaintPercentOverdue =
    "#{((@DumpsterComplaintOverdue.to_f/@DumpsterComplaintTotal.to_f)*100).round(2)}%"
    @DumpsterComplaintPercentNotOverdue =
    "#{((@DumpsterComplaintNotOverdue.to_f/@DumpsterComplaintTotal.to_f)*100).round(2)}%"
    @DumpsterComplaintDigits = @DumpsterComplaintOverdue.to_f/@DumpsterComplaintTotal.to_f
    @DumpsterComplaintGrade = OpenSr.qualityGrade(@DumpsterComplaintDigits)

    @DumpsterPermitOverdue= Sr.
    where(sr_type: 'Dumpster Permit',
    status: 'Open', expression: 'Overdue').count
    @DumpsterPermitNotOverdue = Sr.
    where(sr_type: 'Dumpster Permit',
    status: 'Open', expression: 'Not Overdue').count
    @DumpsterPermitTotal = Sr.
    where(sr_type: 'Dumpster Permit',
    status: 'Open').count + Sr.
    where(sr_type: 'Dumpster Permit',
    status: 'Open').count
    @DumpsterPermitPercentOverdue =
    "#{((@DumpsterPermitOverdue.to_f/@DumpsterPermitTotal.to_f)*100).round(2)}%"
    @DumpsterPermitPercentNotOverdue =
    "#{((@DumpsterPermitNotOverdue.to_f/@DumpsterPermitTotal.to_f)*100).round(2)}%"
    @DumpsterPermitDigits =
    (@DumpsterPermitNotOverdue.to_f/@DumpsterPermitTotal.to_f)
    @DumpsterPermitGrade = OpenSr.qualityGrade(@DumpsterPermitDigits)

    @SWM_UncollectedOverdue = Sr.
    where(sr_type: 'SWM_Uncollected',
    status: 'Open', expression: 'Overdue').count
    @SWM_UncollectedNotOverdue = Sr.
    where(sr_type: 'SWM_Uncollected',
    status: 'Open', expression: 'Not Overdue').count
    @SWM_UncollectedTotal = @SWM_UncollectedOverdue + @SWM_UncollectedNotOverdue
    @SWM_UncollectedPercentOverdue=
    "#{((@SWM_UncollectedOverdue.to_f/@SWM_UncollectedTotal.to_f)*100).round(2)}%"
    @SWM_UncollectedPercentNotOverdue=
    "#{((@SWM_UncollectedNotOverdue.to_f/@SWM_UncollectedTotal.to_f)*100).round(2)}%"
    @SWM_UncollectedDigits = @SWM_UncollectedNotOverdue.to_f/@SWM_UncollectedTotal.to_f
    @SWM_UncollectedGrade= OpenSr.qualityGrade(@SWM_UncollectedDigits)

    @UncollectedServiceUnitsOverdue = Sr.
    where(sr_type: 'Uncollected Service Units',
    status: 'Open').count
    @UncollectedServiceUnitsTotal = @UncollectedServiceUnitsOverdue

    @SWM_MissComplaintOverdue = Sr.
    where(sr_type: 'SWM_MissComplaint',
    status: 'Open', expression: 'Overdue').count
    @SWM_MissComplaintNotOverdue = Sr.
    where(sr_type: 'SWM_MissComplaint',
    status: 'Open', expression: 'Not Overdue').count
    @SWM_MissComplaintTotal = @SWM_MissComplaintOverdue + @SWM_MissComplaintNotOverdue
    @SWM_MissComplaintPercentOverdue =
    "#{((@SWM_MissComplaintOverdue.to_f/@SWM_MissComplaintTotal.to_f)*100).round(2)}"
    @SWM_MissComplaintPercentNotOverdue =
    "#{((@SWM_MissComplaintNotOverdue.to_f/@SWM_MissComplaintTotal.to_f)*100).round(2)}"
    @SWM_MissComplaintDigit = @SWM_MissComplaintNotOverdue.to_f/@SWM_MissComplaintTotal.to_f
    @SWM_MissComplaintGrade = OpenSr.qualityGrade(@SWM_MissComplaintDigit)

  end

  def load_csv
    @data_frame = Daru::DataFrame.from_csv 'C:/Users/e128289/Downloads/data-1583248669665.csv'
    @data_frame2 = @data_frame.pivot_table(index:['sr_type'],values:'tally', vectors:['quad_status'],  agg:  :sum)
  end
  def result
      load_csv
      #binding.pry
  end
  def test
      render('/srs/test.html.erb')
  end
  def executive
    render('/srs/executive.html.erb')
  end

end

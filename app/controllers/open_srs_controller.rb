class OpenSrsController < ApplicationController
    def cans_related_requests
      @SWM_Escalation_cans_related_list_FY2021=
        Sr.sWM_Escalation_cans_related_list_FY2021
      @SWM_Escalation_cans_related_list_FY2020=
        Sr.sWM_Escalation_cans_related_list_FY2020
      @SWM_Escalation_cans_related_list_FY2019=
        Sr.sWM_Escalation_cans_related_list_FY2019
      @SWM_Escalation_cans_related_list_FY2018=
        Sr.sWM_Escalation_cans_related_list_FY2018
      @SWM_Escalation_cans_related_list_FY2017=
        Sr.sWM_Escalation_cans_related_list_FY2017

      @UnauthorizedContainerRetrieval_cans_related_list_FY2021=
          Sr.unauthorizedContainerRetrieval_cans_related_list_FY2021
      @UnauthorizedContainerRetrieval_cans_related_list_FY2020=
        Sr.unauthorizedContainerRetrieval_cans_related_list_FY2020
      @UnauthorizedContainerRetrieval_cans_related_list_FY2019=
        Sr.unauthorizedContainerRetrieval_cans_related_list_FY2019
      @UnauthorizedContainerRetrieval_cans_related_list_FY2018=
        Sr.unauthorizedContainerRetrieval_cans_related_list_FY2018
      @UnauthorizedContainerRetrieval_cans_related_list_FY2017=
        Sr.unauthorizedContainerRetrieval_cans_related_list_FY2017

      @RecyclingParticipationNEW_cans_related_list_FY2020=
          Sr.recyclingParticipationNEW_cans_related_list_FY2021
      @RecyclingParticipationNEW_cans_related_list_FY2020=
        Sr.recyclingParticipationNEW_cans_related_list_FY2020
      @RecyclingParticipationNEW_cans_related_list_FY2019=
        Sr.recyclingParticipationNEW_cans_related_list_FY2019
      @RecyclingParticipationNEW_cans_related_list_FY2018=
        Sr.recyclingParticipationNEW_cans_related_list_FY2018
      @RecyclingParticipationNEW_cans_related_list_FY2017=
        Sr.recyclingParticipationNEW_cans_related_list_FY2017

      @RecyclingCartRepairorReplace_cans_related_list_FY2020=
        Sr.recyclingCartRepairorReplace_cans_related_list_FY2020
      @RecyclingCartRepairorReplace_cans_related_list_FY2019=
        Sr.recyclingCartRepairorReplace_cans_related_list_FY2019
      @RecyclingCartRepairorReplace_cans_related_list_FY2018=
        Sr.recyclingCartRepairorReplace_cans_related_list_FY2018
      @RecyclingCartRepairorReplace_cans_related_list_FY2017=
        Sr.recyclingCartRepairorReplace_cans_related_list_FY2017

      @RecycleBinCartRetrieve_cans_related_list_FY2020 =
        Sr.recycleBinCartRetrieve_cans_related_list_FY2020
      @RecycleBinCartRetrieve_cans_related_list_FY2019 =
        Sr.recycleBinCartRetrieve_cans_related_list_FY2019
      @RecycleBinCartRetrieve_cans_related_list_FY2018 =
        Sr.recycleBinCartRetrieve_cans_related_list_FY2018
      @RecycleBinCartRetrieve_cans_related_list_FY2017 =
        Sr.recycleBinCartRetrieve_cans_related_list_FY2017


      @NewResidentContainer_cans_related_list_FY2020 = Sr.
      newResidentContainer_cans_related_list_FY2020
      @NewResidentContainer_cans_related_list_FY2019 = Sr.
      newResidentContainer_cans_related_list_FY2019
      @NewResidentContainer_cans_related_list_FY2018 = Sr.
      newResidentContainer_cans_related_list_FY2018
      @NewResidentContainer_cans_related_list_FY2017 = Sr.
      newResidentContainer_cans_related_list_FY2017



      @ContainerProblem_cans_related_list_FY2020 = Sr.
       containerProblem_cans_related_list_FY2020
      @ContainerProblem_cans_related_list_FY2019 = Sr.
       containerProblem_cans_related_list_FY2019
      @ContainerProblem_cans_related_list_FY2018 = Sr.
        containerProblem_cans_related_list_FY2018
      @ContainerProblem_cans_related_list_FY2017 = Sr.
       containerProblem_cans_related_list_FY2017

      @AddACartCANCELLATION_cans_related_list_FY2020 = Sr.
      addACartCANCELLATION_cans_related_list_FY2020
      @AddACartCANCELLATION_cans_related_list_FY2019 = Sr.
      addACartCANCELLATION_cans_related_list_FY2019
      @AddACartCANCELLATION_cans_related_list_FY2018 = Sr.
      addACartCANCELLATION_cans_related_list_FY2018
      @AddACartCANCELLATION_cans_related_list_FY2017 = Sr.
      addACanCANCELLATION_cans_related_list_FY2017

      @AddACart_cans_related_list_FY2020 = Sr.
      addACart_cans_related_list_FY2020
      @AddACart_cans_related_list_FY2019 = Sr.
      addACart_cans_related_list_FY2019
      @AddACart_cans_related_list_FY2018 = Sr.
      addACart_cans_related_list_FY2018
      @AddACart_cans_related_list_FY2017 = Sr.
      addACart_cans_related_list_FY2017

      @AddACanCANCELLATION_cans_related_list_FY2020= Sr.
      addACanCANCELLATION_cans_related_list_FY2020
      @AddACanCANCELLATION_cans_related_list_FY2019 = Sr.
      addACanCANCELLATION_cans_related_list_FY2019
      @AddACanCANCELLATION_cans_related_list_FY2018 = Sr.
      addACanCANCELLATION_cans_related_list_FY2018
      @AddACanCANCELLATION_cans_related_list_FY2017 = Sr.
      addACanCANCELLATION_cans_related_list_FY2017

      @NewMoveInService_cans_related_list_FY2020 = Sr.
      newMoveInService_cans_related_list_FY2020
      @NewMoveInService_cans_related_list_FY2019 = Sr.
      newMoveInService_cans_related_list_FY2019
      @NewMoveInService_cans_related_list_FY2018 = Sr.
      newMoveInService_cans_related_list_FY2018
      @NewMoveInService_cans_related_list_FY2017 = Sr.
      newMoveInService_cans_related_list_FY2017

      @AddACanFY2020 = Sr.
      addACan_related_list_FY2020
      @AddACanFY2019 = Sr.
      addACan_related_list_FY2019
      @AddACanFY2018 = Sr.
      addACan_related_list_FY2018
      @AddACanFY2017 = Sr.
      addACan_related_list_FY2017

      @Total_cans_related_list_FY2020 = Sr.
        cans_related_list_FY2020_count
      @Total_cans_related_list_FY2019 = Sr.
        cans_related_list_FY2019_count
      @Total_cans_related_list_FY2018 = Sr.
        cans_related_list_FY2018_count
      @Total_cans_related_list_FY2017 = Sr.
        cans_related_list_FY2017_count

      render 'cans_related_requests'

    end
    def daily_update
      OpenSr.daily_update_from_url
      OpenSr.daily_update_from_lagan
      Sr.pivot
      render 'summary1'
    end

    def map
      render 'map2'
    end

    def monthly_quality_grade

      @deptSWwide_May_2020_actual_due_and_closed_cases =
        OpenSr.swMay2020_actual_due_and_closed_cases

      @deptSWwide_May_2020_sla_due_cases =
        OpenSr.swMay2020_sla_due_cases

      @deptSWwide_May_2020_updated_as_percent_of_closed_cases=
      @deptSWwide_May_2020_actual_due_and_closed_cases.to_f.round(2)/
      @deptSWwide_May_2020_sla_due_cases.to_f.round(2)

      @deptSWWide_May_2020_grade =
        OpenSr.qualityGrade(
          @deptSWwide_May_2020_updated_as_percent_of_closed_cases)

      @deptSEwide_May_2020_actual_due_and_closed_cases =
      OpenSr.seMay2020_actual_due_and_closed_cases

      @deptSEwide_May_2020_sla_due_cases =
      OpenSr.seMay2020_sla_due_cases

      @deptSEwide_May_2020_updated_as_percent_of_closed_cases=
      # binding.pry
      @deptSEwide_May_2020_actual_due_and_closed_cases.to_f.round(2)/
      @deptSEwide_May_2020_sla_due_cases.to_f.round(2)

      @deptSEWide_May_2020_grade =
      OpenSr.qualityGrade(
        @deptSEwide_May_2020_updated_as_percent_of_closed_cases)


      @deptNWwide_May_2020_actual_due_and_closed_cases =
      OpenSr.nwMay2020_actual_due_and_closed_cases

      @deptNWwide_May_2020_sla_due_cases =
      OpenSr.nwMay2020_sla_due_cases

      @deptNWwide_May_2020_updated_as_percent_of_closed_cases=
      @deptNWwide_May_2020_actual_due_and_closed_cases.to_f.round(2)/
      @deptNWwide_May_2020_sla_due_cases.to_f.round(2)

      @deptNWWide_May_2020_grade=
      OpenSr.qualityGrade(
        @deptNWwide_May_2020_updated_as_percent_of_closed_cases)

      @deptNEwide_May_2020_actual_due_and_closed_cases =
      OpenSr.neMay2020_actual_due_and_closed_cases

      @deptNEwide_May_2020_sla_due_cases =
      OpenSr.neMay2020_sla_due_cases

      @deptNEwide_May_2020_updated_as_percent_of_closed_cases=
      # binding.pry
      @deptNEwide_May_2020_actual_due_and_closed_cases.to_f.round(2)/
        @deptNEwide_May_2020_sla_due_cases.to_f.round(2)

      @deptNEWide_May_2020_grade =
      OpenSr.qualityGrade(
        @deptNEwide_May_2020_updated_as_percent_of_closed_cases)

      @deptNEwide_May_2020_actual_due_and_closed_cases =
      OpenSr.neMay2020_actual_due_and_closed_cases

      @deptNEwide_May_2020_sla_due_cases =
      OpenSr.neMay2020_sla_due_cases

      @deptNEwide_April_2020_actual_due_and_closed_cases =
      OpenSr.neApril2020_actual_due_and_closed_cases

      @deptNEwide_April_2020_sla_due_cases =
      OpenSr.neApril2020_sla_due_cases

      @deptNEwide_April_2020_updated_as_percent_of_closed_cases=
      # binding.pry
      @deptNEwide_April_2020_actual_due_and_closed_cases.to_f.round(2)/
        @deptNEwide_April_2020_sla_due_cases.to_f.round(2)

      @deptNEWide_April_2020_grade =
      OpenSr.qualityGrade(
        @deptNEwide_April_2020_updated_as_percent_of_closed_cases)

      @deptSEwide_April_2020_actual_due_and_closed_cases =
      OpenSr.seApril2020_actual_due_and_closed_cases

      @deptSEwide_April_2020_sla_due_cases =
      OpenSr.seApril2020_sla_due_cases

      @deptSEwide_April_2020_updated_as_percent_of_closed_cases=
      # binding.pry
      @deptSEwide_April_2020_actual_due_and_closed_cases.to_f.round(2)/
      @deptSEwide_April_2020_sla_due_cases.to_f.round(2)

      @deptSEWide_April_2020_grade =
      OpenSr.qualityGrade(
        @deptSEwide_April_2020_updated_as_percent_of_closed_cases)

      @deptNWwide_April_2020_actual_due_and_closed_cases =
      OpenSr.nwApril2020_actual_due_and_closed_cases

      @deptNWwide_April_2020_sla_due_cases =
      OpenSr.nwApril2020_sla_due_cases

      @deptNWwide_April_2020_updated_as_percent_of_closed_cases=
      @deptNWwide_April_2020_actual_due_and_closed_cases.to_f.round(2)/
      @deptNWwide_April_2020_sla_due_cases.to_f.round(2)

      @deptNWWide_April_2020_grade=
      OpenSr.qualityGrade(
        @deptNWwide_April_2020_updated_as_percent_of_closed_cases)

      @deptSWwide_April_2020_actual_due_and_closed_cases =
      OpenSr.swApril2020_actual_due_and_closed_cases

      @deptSWwide_April_2020_sla_due_cases =
      OpenSr.swApril2020_sla_due_cases

      @deptSWwide_April_2020_updated_as_percent_of_closed_cases=
      @deptSWwide_April_2020_actual_due_and_closed_cases.to_f.round(2)/
      @deptSWwide_April_2020_sla_due_cases.to_f.round(2)

      @deptSWWide_April_2020_grade =
        OpenSr.qualityGrade(
          @deptSWwide_April_2020_updated_as_percent_of_closed_cases)

      @deptSWwide_mar_2020_sla_cases_closed_but_updated_later =
      OpenSr.swMar2020_sla_cases_closed_but_updated_later

      @deptSWwide_mar_2020_sla_due_cases =
      OpenSr.swMar2020_sla_due_cases

      @deptSWwide_updated_as_percent_of_closed_cases =
      @deptSWwide_mar_2020_sla_cases_closed_but_updated_later.
      to_f.round(2)/@deptSWwide_mar_2020_sla_due_cases.to_f.round(2)

      @deptSWwide_mar_2020_updated_grade =
      OpenSr.qualityGrade(@deptSWwide_updated_as_percent_of_closed_cases)

      @deptSWwide_mar_2020_actual_due_and_closed_cases =
      OpenSr.deptSWwide_mar_2020_actual_due_and_closed_cases

      @deptSWwide_mar_2020_sla_percent_complete =
      @deptSWwide_mar_2020_actual_due_and_closed_cases.
      to_f.round(2)/@deptSWwide_mar_2020_sla_due_cases.to_f.round(2)

      @deptSWWide_mar_2020_grade=
      OpenSr.qualityGrade(@deptSWwide_mar_2020_sla_percent_complete)

      @deptNWwide_mar_2020_sla_cases_closed_but_updated_later =
      OpenSr.nwMar2020_sla_cases_closed_but_updated_later

      @deptNWwide_mar_2020_sla_due_cases =
      OpenSr.nwMar2020_sla_due_cases

      @deptNWwide_updated_as_percent_of_closed_cases =
      @deptNWwide_mar_2020_sla_cases_closed_but_updated_later.
      to_f.round(2)/@deptNWwide_mar_2020_sla_due_cases.to_f.round(2)

      @deptNWwide_mar_2020_updated_grade =
      OpenSr.qualityGrade(@deptNWwide_updated_as_percent_of_closed_cases)

      @deptNWwide_mar_2020_actual_due_and_closed_cases =
      OpenSr.deptNWwide_mar_2020_actual_due_and_closed_cases

      @deptNWwide_mar_2020_sla_percent_complete =
      @deptNWwide_mar_2020_actual_due_and_closed_cases.
      to_f.round(2)/@deptNWwide_mar_2020_sla_due_cases.to_f.round(2)
      # binding.pry
      @deptNWWide_mar_2020_grade=
      OpenSr.qualityGrade(@deptNWwide_mar_2020_sla_percent_complete)
      # binding.pry

      @deptSEwide_mar_2020_sla_cases_closed_but_updated_later =
      OpenSr.seMar2020_sla_cases_closed_but_updated_later

      @deptSEwide_mar_2020_sla_due_cases =
      OpenSr.seMar2020_sla_due_cases

      @deptSEwide_updated_as_percent_of_closed_cases =
      @deptSEwide_mar_2020_sla_cases_closed_but_updated_later.
      to_f.round(2)/@deptSEwide_mar_2020_sla_due_cases.to_f.round(2)

      @deptSEwide_mar_2020_updated_grade =
      OpenSr.qualityGrade(@deptSEwide_updated_as_percent_of_closed_cases)

      @deptSEwide_mar_2020_actual_due_and_closed_cases =
      OpenSr.deptSEwide_mar_2020_actual_due_and_closed_cases

      @deptSEwide_mar_2020_sla_percent_complete =
      @deptSEwide_mar_2020_actual_due_and_closed_cases.
      to_f.round(2)/@deptSEwide_mar_2020_sla_due_cases.to_f.round(2)
      # binding.pry
      @deptSEWide_mar_2020_grade=
      OpenSr.qualityGrade(@deptSEwide_mar_2020_sla_percent_complete)

      @deptNEwide_mar_2020_sla_cases_closed_but_updated_later =
      OpenSr.neMar2020_sla_cases_closed_but_updated_later

      @deptNEwide_mar_2020_sla_due_cases =
      OpenSr.neMar2020_sla_due_cases

      @deptNEwide_updated_as_percent_of_closed_cases =
      @deptNEwide_mar_2020_sla_cases_closed_but_updated_later.
      to_f.round(2)/@deptNEwide_mar_2020_sla_due_cases.to_f.round(2)

      @deptNEwide_mar_2020_updated_grade =
      OpenSr.qualityGrade(@deptNEwide_updated_as_percent_of_closed_cases)

      @deptNEwide_mar_2020_actual_due_and_closed_cases =
      OpenSr.deptNEwide_mar_2020_actual_due_and_closed_cases

      @deptNEwide_mar_2020_sla_percent_complete =
      @deptNEwide_mar_2020_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptNEwide_mar_2020_sla_due_cases.to_f.round(2)

      @deptNEWide_mar_2020_grade=
      OpenSr.qualityGrade(@deptNEwide_mar_2020_sla_percent_complete)

      feb_2020_start_date = Date.parse('2020-02-01')
      feb_2020_end_date = Date.parse('2020-02-29')
      @deptSWwide_feb_2020_sla_due_cases =
      Sr.where(due_date: feb_2020_start_date..feb_2020_end_date).
      where(department: 'SWM Solid Waste Management',
        trash_quad: 'SW',
        status: 'Closed',
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
          'Add A Can CANCELLATION', 'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint',
          'Physically Challenged Pickup',
          ]).
          count
      @deptSWwide_feb_2020_actual_due_and_closed_cases =
      Sr.where(date_closed: feb_2020_start_date..feb_2020_end_date).
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
          'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
          ]).count

      @deptSWwide_feb_2020_sla_percent_complete =
      @deptSWwide_feb_2020_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptSWwide_feb_2020_sla_due_cases.to_f.round(2)

      @deptSWWide_feb_2020_grade=
      OpenSr.qualityGrade(@deptSWwide_feb_2020_sla_percent_complete)

      @deptNWwide_feb_2020_sla_due_cases =
      Sr.where(due_date: feb_2020_start_date..feb_2020_end_date).
      where(department: 'SWM Solid Waste Management',
        trash_quad: 'NW',
        status: 'Close',
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
          'Add A Can CANCELLATION', 'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
          ]).count
      @deptNWwide_feb_2020_actual_due_and_closed_cases =
      Sr.where(date_closed: feb_2020_start_date..feb_2020_end_date).
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
          'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
          ]).
          count

      @deptNWwide_feb_2020_sla_percent_complete =
      @deptNWwide_feb_2020_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptNWwide_feb_2020_sla_due_cases.
      to_f.round(2)

      @deptNWWide_feb_2020_grade=
      OpenSr.qualityGrade(@deptNWwide_feb_2020_sla_percent_complete)

      @deptSEwide_feb_2020_sla_due_cases =
      Sr.where(due_date: feb_2020_start_date..feb_2020_end_date).
      where(department: 'SWM Solid Waste Management',
        trash_quad: 'SE',
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
          'Add A Can CANCELLATION', 'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
          ]).count
      @deptSEwide_feb_2020_actual_due_and_closed_cases =
      Sr.where(date_closed: feb_2020_start_date..feb_2020_end_date).
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
          'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
          ]).count

      @deptSEwide_feb_2020_sla_percent_complete =
      @deptSEwide_feb_2020_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptSEwide_feb_2020_sla_due_cases.
      to_f.round(2)

      @deptSEWide_feb_2020_grade=
      OpenSr.qualityGrade(@deptSEwide_feb_2020_sla_percent_complete)

      @deptNEwide_feb_2020_sla_due_cases =
      Sr.where(due_date: feb_2020_start_date..feb_2020_end_date).
      where(department: 'SWM Solid Waste Management',
        trash_quad: 'NE',
        status: 'Closed',
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
          'Add A Can CANCELLATION', 'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
          ]).count

      @deptNEwide_feb_2020_actual_due_and_closed_cases =
      Sr.where(date_closed: feb_2020_start_date..feb_2020_end_date).
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
          'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
          ]).count

      @deptNEwide_feb_2020_sla_percent_complete =
      @deptNEwide_feb_2020_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptNEwide_feb_2020_sla_due_cases.to_f.round(2)

      @deptNEWide_feb_2020_grade=
      OpenSr.qualityGrade(@deptNEwide_feb_2020_sla_percent_complete)

      start_date_jan_20 = Date.parse('2020-1-01')
      due_date_jan_20 = Date.parse('2020-1-31')
      @deptSWwide_jan_2020_sla_updated_cases =
      Sr.where(due_date: start_date_jan_20..due_date_jan_20).
      where(department: 'SWM Solid Waste Management',
        trash_quad: 'SW',
        status: 'Closed',
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
          'Add A Can CANCELLATION', 'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
          ]).count

      @deptSWwide_jan_2020_sla_due_cases =
      Sr.where(date_closed: start_date_jan_20..due_date_jan_20).
      where(department: 'SWM Solid Waste Management',
        trash_quad: 'SW',
        status: 'Closed',
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
          'Add A Can CANCELLATION', 'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
          ]).count

      @deptSWwide_jan_2020_actual_due_and_closed_cases =
      Sr.where("sr_create_date <= ? AND sr_create_date >= ?",
        start_date_jan_20, due_date_jan_20).
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
            'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
            ]).count

      @deptSWwide_jan_2020_sla_percent_complete =
      @deptSWwide_jan_2020_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptSWwide_jan_2020_sla_due_cases.to_f.round(2)

      @deptSWWide_jan_2020_grade=
      OpenSr.qualityGrade(@deptSWwide_jan_2020_sla_percent_complete)

      @deptNWwide_jan_2020_sla_due_cases =
      Sr.where("due_date <= ? AND due_date >= ?",
        start_date_jan_20, due_date_jan_20).
        where(department: 'SWM Solid Waste Management',
          trash_quad: 'NW',
          status: 'Closed',
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
            'Add A Can CANCELLATION', 'Missed Recycling Pickup',
            'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
            ]).count

      @deptNWwide_jan_2020_actual_due_and_closed_cases =
      Sr.where("date_closed <= ? AND date_closed >= ?",
        start_date_jan_20, due_date_jan_20).
        where(overdue:[-30..-2],
          department: 'SWM Solid Waste Management',
          status: 'Closed',
          trash_quad: 'NW',
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
            'Add A Can CANCELLATION', 'Missed Recycling Pickup',
            'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
            ]).count

      @deptNWwide_jan_2020_sla_percent_complete =
      @deptNWwide_jan_2020_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptNWwide_jan_2020_sla_due_cases.
      to_f.round(2)

      @deptNWWide_jan_2020_grade=
      OpenSr.qualityGrade(@deptNWwide_jan_2020_sla_percent_complete)

      @deptSEwide_jan_2020_sla_due_cases =
      Sr.where("due_date <= ? AND due_date >= ?",
        start_date_jan_20, due_date_jan_20).
        where(department: 'SWM Solid Waste Management',
          trash_quad: 'SE',
          status: 'Closed',
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
            'Add A Can CANCELLATION', 'Missed Recycling Pickup',
            'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
            ]).count

      @deptSEwide_jan_2020_actual_due_and_closed_cases =
      Sr.where("date_closed <= ? AND date_closed >= ?",
        start_date_jan_20, due_date_jan_20).
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
            'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
            ]).count

      @deptSEwide_jan_2020_sla_percent_complete =
      @deptSEwide_jan_2020_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptSEwide_jan_2020_sla_due_cases.to_f.round(2)

      @deptSEWide_jan_2020_grade=
      OpenSr.qualityGrade(@deptSEwide_jan_2020_sla_percent_complete)

      @deptNEwide_jan_2020_sla_due_cases =
      Sr.where("due_date <= ? AND due_date >= ?",
        start_date_jan_20, due_date_jan_20).
        where(department: 'SWM Solid Waste Management',
          trash_quad: 'NE',
          status: 'Closed',
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
            'Add A Can CANCELLATION', 'Missed Recycling Pickup',
            'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
            ]).count

      @deptNEwide_jan_2020_actual_due_and_closed_cases =
      Sr.where("date_closed <= ? AND date_closed >= ?",
        start_date_jan_20, due_date_jan_20).
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
            'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
            ]).count

      @deptNEwide_jan_2020_sla_percent_complete =
      @deptNEwide_jan_2020_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptNEwide_jan_2020_sla_due_cases.to_f.round(2)

      @deptNEWide_jan_2020_grade=
      OpenSr.qualityGrade(@deptNEwide_jan_2020_sla_percent_complete)


      start_date_dec_19 = Date.parse('2019-12-1')
      due_date_dec_19 = Date.parse('2019-12-31')
      @deptSWwide_dec_2019_sla_due_cases =
      OpenSr.deptSWwide_dec_2019_sla_due_cases

      @deptSWwide_dec_2019_actual_due_and_closed_cases =
      OpenSr.deptSWwide_dec_2019_actual_due_and_closed_cases

      @deptSWwide_dec_2019_sla_percent_complete =
      @deptSWwide_dec_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptSWwide_dec_2019_sla_due_cases.to_f.round(2)

      @deptSWWide_dec_2019_grade=
      OpenSr.qualityGrade(@deptSWwide_dec_2019_sla_percent_complete)

      @deptNWwide_dec_2019_sla_due_cases =
      Sr.where(sr_create_date: start_date_dec_19..due_date_dec_19).
      where(department: 'SWM Solid Waste Management',
        trash_quad: 'NW',
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
          'Add A Can CANCELLATION', 'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
          count
      @deptNWwide_dec_2019_actual_due_and_closed_cases =
      OpenSr.deptNWwide_dec_2019_actual_due_and_closed_cases

      @deptNWwide_dec_2019_sla_percent_complete =
      @deptNWwide_dec_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptNWwide_dec_2019_sla_due_cases.to_f.round(2)

      @deptNWWide_dec_2019_grade=
      OpenSr.qualityGrade(@deptNWwide_dec_2019_sla_percent_complete)

      @deptSEwide_dec_2019_sla_due_cases =
      Sr.where(sr_create_date: start_date_dec_19..due_date_dec_19).
      where(department: 'SWM Solid Waste Management',
        trash_quad: 'SE',
        status: 'Closed',
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection',
          'Dead Animal Collection',  'Add A Can CANCELLATION',
          'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
          'Physically Challenged Pickup']).count
      @deptSEwide_dec_2019_actual_due_and_closed_cases =
      OpenSr.deptSEwide_dec_2019_actual_due_and_closed_cases

      @deptSEwide_dec_2019_sla_percent_complete =
      @deptSEwide_dec_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptSEwide_dec_2019_sla_due_cases.to_f.round(2)

      @deptSEWide_dec_2019_grade=
      OpenSr.qualityGrade(@deptSEwide_dec_2019_sla_percent_complete)

      @deptNEwide_dec_2019_sla_due_cases =
      Sr.where(sr_create_date: start_date_dec_19..due_date_dec_19).
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

      @deptNEwide_dec_2019_actual_due_and_closed_cases =
      OpenSr.deptNEwide_dec_2019_actual_due_and_closed_cases

      @deptNEwide_dec_2019_sla_percent_complete =
      @deptNEwide_dec_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptNEwide_dec_2019_sla_due_cases.to_f.round(2)

      @deptNEWide_dec_2019_grade=
      OpenSr.qualityGrade(@deptNEwide_dec_2019_sla_percent_complete)

      start_date_nov_19 = Date.parse('2019-11-01')
      due_date_nov_19 = Date.parse('2019-11-30')
      @deptSWwide_nov_2019_sla_due_cases =
      Sr.where(sr_create_date: start_date_nov_19..due_date_nov_19).
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
      @deptSWwide_nov_2019_actual_due_and_closed_cases =
      Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date_nov_19, due_date_nov_19).
        where(overdue:[-30..-0.05],
          department: 'SWM Solid Waste Management',
          status: 'Closed',
          trash_quad: 'SW',
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup']).count

      @deptSWwide_nov_2019_sla_percent_complete =
      @deptSWwide_nov_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptSWwide_nov_2019_sla_due_cases.
      to_f.round(2)

      @deptSWWide_nov_2019_grade=
      OpenSr.qualityGrade(@deptSWwide_nov_2019_sla_percent_complete)

      @deptNWwide_nov_2019_sla_due_cases =
      Sr.where(sr_create_date: start_date_nov_19..due_date_nov_19).
      where(department: 'SWM Solid Waste Management',
        trash_quad: 'NW',
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
          'Add A Can CANCELLATION', 'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
          count

      @deptNWwide_nov_2019_actual_due_and_closed_cases =
      Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date_nov_19, due_date_nov_19).
        where(overdue:[-30..-0.05],
          department: 'SWM Solid Waste Management',
          status: 'Closed',
          trash_quad: 'NW',
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup']).count

      @deptNWwide_nov_2019_sla_percent_complete =
      @deptNWwide_nov_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptNWwide_nov_2019_sla_due_cases.to_f.round(2)

      @deptNWWide_nov_2019_grade=
      OpenSr.qualityGrade(@deptNWwide_nov_2019_sla_percent_complete)

      @deptSEwide_nov_2019_sla_due_cases =
      Sr.where(sr_create_date: start_date_nov_19..due_date_nov_19).
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

      @deptSEwide_nov_2019_actual_due_and_closed_cases =
      Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date_nov_19, due_date_nov_19).
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
            'Personnel or Vehicle Complaint', 'Physically Challenged Pickup'])
            .count
      @deptSEwide_nov_2019_sla_percent_complete =
      @deptSEwide_nov_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptSEwide_nov_2019_sla_due_cases.to_f.round(2)

      @deptSEWide_nov_2019_grade=
      OpenSr.qualityGrade(@deptSEwide_nov_2019_sla_percent_complete)

      @deptNEwide_nov_2019_sla_due_cases =
      Sr.where(sr_create_date: start_date_nov_19..due_date_nov_19).
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
      @deptNEwide_nov_2019_actual_due_and_closed_cases =
      Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date_nov_19, due_date_nov_19).
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
      @deptNEwide_nov_2019_sla_percent_complete =
      @deptNEwide_nov_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptNEwide_nov_2019_sla_due_cases.to_f.round(2)

      @deptNEWide_nov_2019_grade=
      OpenSr.qualityGrade(@deptNEwide_nov_2019_sla_percent_complete)

      start_date_oct_19 = Date.parse('2019-10-01')
      due_date_oct_19 = Date.parse('2019-10-31')
      @deptSWwide_oct_2019_sla_due_cases =
      OpenSr.deptNEwide_oct_2019_sla_due_cases

      @deptSWwide_oct_2019_actual_due_and_closed_cases =
      Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date_oct_19, due_date_oct_19).
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
            'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup']).
            count

      @deptSWwide_oct_2019_sla_percent_complete =
      @deptSWwide_oct_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptSWwide_oct_2019_sla_due_cases.
      to_f.round(2)

      @deptSWWide_oct_2019_grade=
      OpenSr.qualityGrade(@deptSWwide_oct_2019_sla_percent_complete)

      @deptNWwide_oct_2019_sla_due_cases =
      Sr.where(sr_create_date: start_date_oct_19..due_date_oct_19)
      .where(department: 'SWM Solid Waste Management',
        trash_quad: 'NW',
        status: 'Closed',
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection',
          'Dead Animal Collection',  'Add A Can CANCELLATION',
          'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
          'Physically Challenged Pickup']).count

      @deptNWwide_oct_2019_actual_due_and_closed_cases =
      Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date_oct_19, due_date_oct_19).
        where(overdue:[-30..-0.05],
          department: 'SWM Solid Waste Management',
          status: 'Closed',
          trash_quad: 'NW',
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection',  'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup']).
            count

      @deptNWwide_oct_2019_sla_percent_complete =
      @deptNWwide_oct_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptNWwide_oct_2019_sla_due_cases.
      to_f.round(2)

      @deptNWWide_oct_2019_grade=
      OpenSr.qualityGrade(@deptNWwide_oct_2019_sla_percent_complete)

      @deptSEwide_oct_2019_sla_due_cases =
      Sr.where(sr_create_date: start_date_oct_19..due_date_oct_19).
      where(department: 'SWM Solid Waste Management',
        trash_quad: 'SE',
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection',
          'Dead Animal Collection', 'Add A Can CANCELLATION',
          'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
          'Physically Challenged Pickup']).
          count
      @deptSEwide_oct_2019_actual_due_and_closed_cases =
      Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date_oct_19, due_date_oct_19).
        where(overdue:[-30..-0.05],
          department: 'SWM Solid Waste Management',
          status: 'Closed',
          trash_quad: 'SE',
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup']).
            count

      @deptSEwide_oct_2019_sla_percent_complete =
      @deptSEwide_oct_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptSEwide_oct_2019_sla_due_cases.
      to_f.round(2)

      @deptSEWide_oct_2019_grade=
      OpenSr.qualityGrade(@deptSEwide_oct_2019_sla_percent_complete)

      @deptNEwide_oct_2019_sla_due_cases =
      Sr.where(sr_create_date: start_date_oct_19..due_date_oct_19).
      where(department: 'SWM Solid Waste Management',
        trash_quad: 'NE',
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
          'Add A Can CANCELLATION', 'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint',
          'Physically Challenged Pickup']).count

      @deptNEwide_oct_2019_actual_due_and_closed_cases =
      Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date_oct_19, due_date_oct_19).
        where(overdue:[-30..-0.05],
          department: 'SWM Solid Waste Management',
          status: 'Closed',
          trash_quad: 'NE',
          sr_type: ['Missed Heavy Trash Pickup','Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
            'Add A Can CANCELLATION', 'Missed Recycling Pickup',
            'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup']).count

      @deptNEwide_oct_2019_sla_percent_complete =
      @deptNEwide_oct_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptNEwide_oct_2019_sla_due_cases.
      to_f.round(2)

      @deptNEWide_oct_2019_grade=
      OpenSr.qualityGrade(@deptNEwide_oct_2019_sla_percent_complete)

      sept_2019_start_date = Date.parse('2019-09-01')
      sept_2019_end_date = Date.parse('2019-09-30')
      @deptSWwide_sept_2019_sla_due_cases =
      Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        sept_2019_start_date, sept_2019_end_date).
        where(department: 'SWM Solid Waste Management',
          trash_quad: 'SW',
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup']).
            count
      @deptSWwide_sept_2019_actual_due_and_closed_cases =
      Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        sept_2019_start_date, sept_2019_end_date).
        where(overdue:[-30..-0.05],
          department: 'SWM Solid Waste Management',
          status: 'Closed',
          trash_quad: 'SW',
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup']).count

      @deptSWwide_sept_2019_sla_percent_complete =
      @deptSWwide_sept_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptSWwide_sept_2019_sla_due_cases.to_f.round(2)

      @deptSWWide_sept_2019_grade=
      OpenSr.qualityGrade(@deptSWwide_sept_2019_sla_percent_complete)

      @deptNWwide_sept_2019_sla_due_cases =
      Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        sept_2019_start_date, sept_2019_end_date).
        where(department: 'SWM Solid Waste Management',
          trash_quad: 'NW',
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup']).
            count
      @deptNWwide_sept_2019_actual_due_and_closed_cases =
      Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        sept_2019_start_date, sept_2019_end_date).
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
            'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup']).
            count
      @deptNWwide_sept_2019_sla_percent_complete =
      @deptNWwide_sept_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptNWwide_sept_2019_sla_due_cases.to_f.round(2)

      @deptNWWide_sept_2019_grade=
      OpenSr.qualityGrade(@deptNWwide_sept_2019_sla_percent_complete)

      @deptSEwide_sept_2019_sla_due_cases =
      Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        sept_2019_start_date, sept_2019_end_date).
        where(department: 'SWM Solid Waste Management',
          trash_quad: 'SE',
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
            'Add A Can CANCELLATION', 'Missed Recycling Pickup',
            'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup']).
            count

      @deptSEwide_sept_2019_actual_due_and_closed_cases =
      Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        sept_2019_start_date, sept_2019_end_date).
        where(overdue:[-30..-0.05],
          department: 'SWM Solid Waste Management',
          status: 'Closed',
          trash_quad: 'SE',
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup']).
            count
      @deptSEwide_sept_2019_sla_percent_complete =
      @deptSEwide_sept_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptSEwide_sept_2019_sla_due_cases.to_f.round(2)

      @deptSEWide_sept_2019_grade=
      OpenSr.qualityGrade(@deptSEwide_sept_2019_sla_percent_complete)

      @deptNEwide_sept_2019_sla_due_cases =
      Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        sept_2019_start_date, sept_2019_end_date).
        where(department: 'SWM Solid Waste Management',
          trash_quad: 'NE',
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup']).
            count
      @deptNEwide_sept_2019_actual_due_and_closed_cases =
      Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        sept_2019_start_date, sept_2019_end_date).
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
            'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
            ]).count

      @deptNEwide_sept_2019_sla_percent_complete =
      @deptNEwide_sept_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptNEwide_sept_2019_sla_due_cases.
      to_f.round(2)

      @deptNEWide_sept_2019_grade=
      OpenSr.qualityGrade(@deptNEwide_sept_2019_sla_percent_complete)

      aug_2019_start_date = Date.parse('2019-08-01')
      aug_2019_end_date = Date.parse('2019-08-31')
      @deptSWwide_aug_2019_sla_due_cases =
      Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        aug_2019_start_date, aug_2019_end_date).
        where(department: 'SWM Solid Waste Management',
          trash_quad: 'SW',
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup',]).
            count
      @deptSWwide_aug_2019_actual_due_and_closed_cases =
      Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        aug_2019_start_date, aug_2019_end_date).
        where(overdue:[-30..-0.05],
          department: 'SWM Solid Waste Management',
          status: 'Closed',
          trash_quad: 'SW',
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup',]).
            count

      @deptSWwide_aug_2019_sla_percent_complete =
      @deptSWwide_aug_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptSWwide_aug_2019_sla_due_cases.
      to_f.round(2)
      @deptSWWide_aug_2019_grade=
      OpenSr.qualityGrade(@deptSWwide_aug_2019_sla_percent_complete)

      @deptNWwide_aug_2019_sla_due_cases = Sr.
      where("sr_create_date >= ? AND sr_create_date <= ?",
        aug_2019_start_date, aug_2019_end_date).
        where(department: 'SWM Solid Waste Management',
          trash_quad: 'NW',
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
            'Add A Can CANCELLATION', 'Missed Recycling Pickup',
            'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
            ]).
            count
      @deptNWwide_aug_2019_actual_due_and_closed_cases =
      Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        aug_2019_start_date, aug_2019_end_date).
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
            'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup',]).count
      @deptNWwide_aug_2019_sla_percent_complete =
      @deptNWwide_aug_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptNWwide_aug_2019_sla_due_cases.to_f.round(2)

      @deptNWWide_aug_2019_grade=
      OpenSr.qualityGrade(@deptNWwide_aug_2019_sla_percent_complete)

      @deptSEwide_aug_2019_sla_due_cases = Sr.
      where("sr_create_date >= ? AND sr_create_date <= ?",
        aug_2019_start_date,aug_2019_end_date).
         where(department: 'SWM Solid Waste Management',
           trash_quad: 'SE',
           sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
             'New Resident Container', 'Recycling Participation NEW',
             'Recycling Cart Repair or Replace', 'SWM Escalation',
             'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
             'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
             'Add A Can CANCELLATION', 'Missed Recycling Pickup',
             'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
             ]).
             count
      @deptSEwide_aug_2019_actual_due_and_closed_cases = Sr.
      where("sr_create_date >= ? AND sr_create_date <= ?",
         aug_2019_start_date, aug_2019_end_date).
         where(overdue:[-30..-0.05],
           department: 'SWM Solid Waste Management',
           status: 'Closed', trash_quad: 'SE',
           sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
             'New Resident Container', 'Recycling Participation NEW',
             'Recycling Cart Repair or Replace', 'SWM Escalation',
             'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
             'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
             'Add A Can CANCELLATION', 'Missed Recycling Pickup',
             'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
             ]).
             count
      @deptSEwide_aug_2019_sla_percent_complete =
      @deptSEwide_aug_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptSEwide_aug_2019_sla_due_cases.
      to_f.round(2)
      @deptSEWide_aug_2019_grade= OpenSr.
      qualityGrade(@deptSEwide_aug_2019_sla_percent_complete)

      @deptNEwide_aug_2019_sla_due_cases = Sr.
      where("sr_create_date >= ? AND sr_create_date <= ?",
        aug_2019_start_date, aug_2019_end_date).
      where(department: 'SWM Solid Waste Management',
         trash_quad: 'NE',
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
            'Add A Can CANCELLATION', 'Missed Recycling Pickup',
            'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
            ]).
            count
      @deptNEwide_aug_2019_actual_due_and_closed_cases = Sr.
      where("sr_create_date >= ? AND sr_create_date <= ?",
        aug_2019_start_date, aug_2019_end_date).
      where(overdue:[-30..-0.05],
        department: 'SWM Solid Waste Management',
        status: 'Closed', trash_quad: 'NE',
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
          'Add A Can CANCELLATION', 'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint', 'Physically Challenged Pickup',
          ]).
          count
      @deptNEwide_aug_2019_sla_percent_complete =
      @deptNEwide_aug_2019_actual_due_and_closed_cases.
      to_f.round(2)/
      @deptNEwide_aug_2019_sla_due_cases.
      to_f.round(2)
      @deptNEWide_aug_2019_grade=
      OpenSr.qualityGrade(@deptNEwide_aug_2019_sla_percent_complete)
    end
    def summary1
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
        count
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
        count
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
        count
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
        count
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
        count
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
        count
    @NPercentRound=(@NorthOverdue.to_f.round(2) / @North.to_f.round(2))*100
    @PercentOverdueNorth="#{@NPercentRound.round(2)}%"
    @NPercentNotRound=(@NorthNotOverdue.to_f.round(2) / @North.to_f.round(2))*100
    @PercentNotOverdueNorth="#{@NPercentNotRound.round(2)}%"
    @SPercentRound=(@SouthOverdue.to_f.round(2) / @South.to_f.round(2))*100
    @PercentOverdueSouth="#{@SPercentRound.round(2)}%"
    @SPercentNotRound= ((1-((@SouthOverdue.to_f.round(2)/@South.to_f.round(2))))*100)
    @PercentNotOverdueSouth="#{@SPercentNotRound.round(2)}%"
    @NorthQualityGrade = OpenSr.northQualityGrade
    @SouthQualityGrade = OpenSr.southQualityGrade
    #SW QUAD

    @missedHvySWTotal = Sr.where(heavy_trash_quad: 'SW',
      sr_type:'Missed Heavy Trash Pickup',
      expression:['Overdue','Not Overdue']).
      count

    @missedHvySWOverdue = Sr.where(heavy_trash_quad: 'SW',
      sr_type:'Missed Heavy Trash Pickup',
      expression:['Overdue']).count

    @missedHvySWPercentOverdue =
    "#{((@missedHvySWOverdue.to_f.round(2)/
    @missedHvySWTotal.to_f.round(2))*100).round(2)}%"

    @missedHvySWPercentNotOverdue =
    "#{((1-(@missedHvySWOverdue.to_f.round(2)/
    @missedHvySWTotal.to_f.round(2)))*100).round(2)}%"

    @missedHvySWNotOverdue = Sr.
    where(heavy_trash_quad: 'SW',
      sr_type:'Missed Heavy Trash Pickup',
      expression:['Not Overdue']).
      count

    @missedHvyOverdueDigits =
    @missedHvySWNotOverdue.to_f/
    @missedHvySWTotal.to_f

    @missedHvySWGrade=
    OpenSr.qualityGrade(@missedHvyOverdueDigits)

    @missedConProbSWTotal =
    Sr.where(trash_quad: 'SW',
      sr_type:'Container Problem',
      expression:['Overdue','Not Overdue']).count

    @missedConProbSWOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'Container Problem',
      expression:['Overdue']).count

    @missedConProbSWNotOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'Container Problem',
      expression:['Not Overdue']).count

    @missedConProbSWPercentOverdue =
    "#{((@missedConProbSWOverdue.to_f.round(2)/
    @missedConProbSWTotal.to_f.round(2))*100).round(2)}%"

    @missedConProbSWPercentNotOverdue =
    "#{((@missedConProbSWNotOverdue.to_f.round(2)/
    @missedConProbSWTotal.to_f.round(2))*100).round(2)}%"

    @missedConProbSWNotOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'Container Problem',
      expression:['Not Overdue']).count

    @missedConProbOverdueDigits =
    @missedConProbSWNotOverdue.to_f/@missedConProbSWTotal.to_f

    @missedConProbSWGrade= OpenSr.qualityGrade(@missedConProbOverdueDigits)

    @missedNewResSWTotal = Sr.where(trash_quad: 'SW',
      sr_type:'New Resident Container',
      status: 'Open',
      expression:['Overdue','Not Overdue']).count
    @missedNewResSWOverdue = Sr.where(trash_quad: 'SW',
      sr_type:'New Resident Container',
      expression:['Overdue']).count
    @missedNewResSWNotOverdue = Sr.
    where(trash_quad: 'SW',
      sr_type:'New Resident Container',
      expression:['Not Overdue']).
      count
    @missedNewResSWPercentOverdue =
    "#{((@missedNewResSWOverdue.to_f.round(2)/
    @missedNewResSWTotal.to_f.round(2))*100).round(2)}%"
    @missedNewResSWPercentNotOverdue =
    "#{((@missedNewResSWNotOverdue.to_f.round(2)/
    @missedNewResSWTotal.to_f.round(2))*100).round(2)}%"
    @missedNewResSWNotOverdue = Sr.
    where(trash_quad: 'SW',
      sr_type:'New Resident Container',
      expression:['Not Overdue']).count
    @missedNewResOverdueDigits =
    @missedNewResSWNotOverdue.to_f/
    @missedNewResSWTotal.to_f
    @missedNewResSWGrade= OpenSr.
    qualityGrade(@missedNewResOverdueDigits)

    @missedRecNewSWTotal = Sr.where(trash_quad: 'SW',
      sr_type:'Recycling Participation NEW',
      status: 'Open', expression:['Overdue','Not Overdue']).count
    @missedRecNewSWOverdue = Sr.where(trash_quad: 'SW',
      sr_type:'Recycling Participation NEW',
      status: 'Open', expression:['Overdue']).count
    @missedRecNewSWPercentOverdue =
    "#{((@missedRecNewSWOverdue.to_f.round(2)/
    @missedRecNewSWTotal.to_f.round(2))*100).round(2)}%"
    @missedRecNewSWPercentNotOverdue =
    "#{((1-(@missedRecNewSWOverdue.to_f.round(2)/
    @missedRecNewSWTotal.to_f.round(2)))*100).round(2)}%"
    @missedRecNewSWNotOverdue = Sr.
    where(trash_quad: 'SW',
      sr_type:'Recycling Participation NEW',
      expression:['Not Overdue']).count
    @missedRecNewOverdueDigits =
      @missedRecNewSWNotOverdue.to_f/@missedRecNewSWTotal.to_f
    @missedRecNewSWGrade= OpenSr.qualityGrade(@missedRecNewOverdueDigits)

    @missedRecCarRepSWTotal = Sr.where(recycle_quad: 'SW',
      sr_type:'Recycling Cart Repair or Replace',
      expression:['Overdue','Not Overdue']).
      count
    @missedRecCarRepSWOverdue = Sr.where(recycle_quad: 'SW',
      sr_type:'Recycling Cart Repair or Replace',
      expression:['Overdue']).count
    @missedRecCarRepSWPercentOverdue =
    "#{((@missedRecCarRepSWOverdue.to_f.round(2)/
    @missedRecCarRepSWTotal.to_f.round(2))*100).round(2)}%"
    @missedRecCarRepSWPercentNotOverdue =
      "#{((1-(@missedRecCarRepSWOverdue.to_f.round(2)/
      @missedRecCarRepSWTotal.to_f.round(2)))*100).round(2)}%"
    @missedRecCarRepSWNotOverdue = Sr.where(recycle_quad: 'SW',
      sr_type:'Recycling Cart Repair or Replace',
      expression:['Not Overdue']).count
    @missedRecCarRepSWOverdueDigits =
      @missedRecCarRepSWNotOverdue.to_f/@missedRecCarRepSWTotal.to_f
    @missedRecCarRepSWGrade= OpenSr.qualityGrade(@missedRecCarRepSWOverdueDigits)

    @missedSWMEscaSWTotal = Sr.where(trash_quad: 'SW',
      sr_type:'SWM Escalation',
      expression:['Overdue','Not Overdue']).
      count
    @missedSWMEscaSWOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'SWM Escalation',
      expression:['Overdue']).count
    @missedSWMEscaSWPercentOverdue =
    "#{((@missedSWMEscaSWOverdue.to_f.round(2)/
    @missedSWMEscaSWTotal.to_f.round(2))*100).round(2)}%"
    @missedSWMEscaSWPercentNotOverdue =
    "#{((1-(@missedSWMEscaSWOverdue.to_f.round(2)/
    @missedSWMEscaSWTotal.to_f.round(2)))*100).round(2)}%"
    @missedSWMEscaSWNotOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'SWM Escalation',
      expression:['Not Overdue']).count
    @missedSWMEscaSWOverdueDigits =
    @missedSWMEscaSWNotOverdue.to_f/@missedSWMEscaSWTotal.to_f
    @missedSWMEscaSWGrade=
    OpenSr.qualityGrade(@missedSWMEscaSWOverdueDigits)

    @missedMisGarbSWTotal =
    Sr.where(trash_quad: 'SW',
      sr_type:'Missed Garbage Pickup',
      expression:['Overdue','Not Overdue']).count
    @missedMisGarbSWOverdue = Sr.
    where(trash_quad: 'SW',
      sr_type:'Missed Garbage Pickup',
      expression:['Overdue']).count
    @missedMisGarbSWPercentOverdue =
    "#{((@missedMisGarbSWOverdue.to_f.round(2)/
    @missedMisGarbSWTotal.to_f.round(2))*100).round(2)}%"
    @missedMisGarbSWPercentNotOverdue =
    "#{((1-(@missedMisGarbSWOverdue.to_f.round(2)/
    @missedMisGarbSWTotal.to_f.round(2)))*100).round(2)}%"
    @missedMisGarbSWNotOverdue = Sr.
    where(trash_quad: 'SW',
      sr_type:'Missed Garbage Pickup',
      expression:['Not Overdue']).count
    @missedMisGarbSWOverdueDigits =
    @missedMisGarbSWNotOverdue.to_f/@missedMisGarbSWTotal.to_f
    @missedMisGarbSWGrade= OpenSr.qualityGrade(@missedMisGarbSWOverdueDigits)

    @missedTrashDumpSWTotal = Sr.
      where(trash_quad: 'SW',
        sr_type:'Trash Dumping or Illegal Dumpsite',
        expression:['Overdue','Not Overdue']).count
    @missedTrashDumpSWOverdue = Sr.
      where(trash_quad: 'SW',
        sr_type:'Trash Dumping or Illegal Dumpsite',
        expression:['Overdue']).count
    @missedTrashDumpSWPercentOverdue =
      "#{((@missedTrashDumpSWOverdue.to_f.round(2)/
      @missedTrashDumpSWTotal.to_f.round(2))*100).round(2)}%"
    @missedMTrashDumpSWNotOverdue =
      Sr.where(trash_quad: 'SW',
        sr_type:'Trash Dumping or Illegal Dumpsite',
        expression:['Not Overdue']).count
    @missedTrashDumpSWPercentNotOverdue =
    "#{((@missedMTrashDumpSWNotOverdue.to_f.round(2)/
    @missedTrashDumpSWTotal.to_f.round(2))*100).round(2)}%"

    @missedTrashDumpSWNotOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'Trash Dumping or Illegal Dumpsite',
      expression:['Not Overdue']).count
    @missedTrashDumpSWOverdueDigits =
    @missedTrashDumpSWNotOverdue.to_f/@missedTrashDumpSWTotal.to_f
    @missedTrashDumpSWGrade= OpenSr.qualityGrade(@missedTrashDumpSWOverdueDigits)

    @missedAddACanSWTotal =
    Sr.where(trash_quad: 'SW',
      sr_type:'Add A Can',
      expression:['Overdue','Not Overdue']).count
    @missedAddACanSWOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'Add A Can',
      expression:['Overdue']).count
    @missedAddACanSWPercentOverdue =
    "#{((@missedAddACanSWOverdue.to_f.round(2)/
    @missedAddACanSWTotal.to_f.round(2))*100).round(2)}%"
    @missedAddACanSWNotOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'Add A Can',
      expression:['Not Overdue']).count
    @missedAddACanSWPercentNotOverdue =
    "#{((@missedAddACanSWNotOverdue.to_f.round(2)/
    @missedAddACanSWTotal.to_f.round(2))*100).round(2)}%"
    @missedAddACanSWNotOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'Add A Can',
      expression:['Not Overdue']).count
    @missedAddACanSWOverdueDigits =
    @missedAddACanSWNotOverdue.to_f/@missedAddACanSWTotal.to_f
    @missedAddACanSWGrade= OpenSr.qualityGrade(@missedAddACanSWOverdueDigits)

    @missedStormDebSWTotal =
    Sr.where(trash_quad: 'SW',
      sr_type:'Storm Debris Collection',
      expression:['Overdue','Not Overdue']).count
    @missedStormDebSWOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'Storm Debris Collection',
      expression:['Overdue']).count
    @missedStormDebSWPercentOverdue =
    "#{((@missedStormDebSWOverdue.to_f.round(2)/
    @missedStormDebSWTotal.to_f.round(2))*100).round(2)}%"
    @missedStormDebSWNotOverdue = Sr.
      where(trash_quad: 'SW',
        sr_type:'Storm Debris Collection',
        expression:['Not Overdue']).count
    @missedStormDebSWPercentNotOverdue =
    "#{((@missedStormDebSWNotOverdue.to_f.round(2)/
    @missedStormDebSWTotal.to_f.round(2))*100).round(2)}%"
    @missedStormDebSWNotOverdue =
      Sr.where(trash_quad: 'SW',
        sr_type:'Storm Debris Collection',
        expression:['Not Overdue']).count
    @missedStormDebSWOverdueDigits =
    @missedStormDebSWNotOverdue.to_f/@missedStormDebSWTotal.to_f
    @missedStormDebSWGrade= OpenSr.qualityGrade(@missedStormDebSWOverdueDigits)

    @missedDeadAniColSWTotal =
      Sr.where(trash_quad: 'SW',
        sr_type:'Dead Animal Collection',
        expression:['Overdue','Not Overdue']).count
    @missedDeadAniColSWOverdue =
      Sr.where(trash_quad: 'SW',
        sr_type:'Dead Animal Collection',
        expression:['Overdue']).count
    @missedDeadAniColSWPercentOverdue =
      "#{((@missedDeadAniColSWOverdue.to_f.round(2)/
      @missedDeadAniColSWTotal.to_f.round(2))*100).round(2)}%"
    @missedDeadAniColSWNotOverdue =
      Sr.where(trash_quad: 'SW',
        sr_type:'Dead Animal Collection',
        expression:['Not Overdue']).count
    @missedDeadAniColSWPercentNotOverdue =
      "#{((@missedDeadAniColSWNotOverdue.to_f.round(2)/
      @missedDeadAniColSWTotal.to_f.round(2))*100).round(2)}%"
    @missedDeadAniColSWNotOverdue =
      Sr.where(trash_quad: 'SW',
        sr_type:'Dead Animal Collection',
        expression:['Not Overdue']).count
    @missedDeadAniColSWOverdueDigits =
      @missedDeadAniColSWNotOverdue.to_f/@missedDeadAniColSWTotal.to_f
    @missedDeadAniColSWGrade=
      OpenSr.qualityGrade(@missedDeadAniColSWOverdueDigits)

    @missedAddACanCancelSWTotal =
      Sr.where(trash_quad: 'SW',
        sr_type:'Add A Can CANCELLATION',
        expression:['Overdue','Not Overdue']).count
    @missedAddACanCancelSWOverdue =
      Sr.where(trash_quad: 'SW',
        sr_type:'Add A Can CANCELLATION',
        expression:['Overdue']).count
    @missedAddACanCancelSWPercentOverdue =
      "#{((@missedAddACanCancelSWOverdue.to_f.round(2)/
      @missedAddACanCancelSWTotal.to_f.round(2))*100).round(2)}%"
    @missedAddACanCancelSWNotOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'Add A Can CANCELLATION',
      expression:['Not Overdue']).count
    @missedAddACanCancelSWPercentNotOverdue =
    "#{((@missedAddACanCancelSWNotOverdue.to_f.round(2)/
    @missedAddACanCancelSWTotal.to_f.round(2))*100).round(2)}%"
    @missedAddACanCancelSWNotOverdue =
    Sr.where(trash_quad: 'SW',
      sr_type:'Add A Can CANCELLATION',
      expression:['Not Overdue']).count
    @missedAddACanCancelSWOverdueDigits =
    @missedAddACanCancelSWNotOverdue.to_f/@missedAddACanCancelSWTotal.to_f
    @missedAddACanCancelSWGrade=
      OpenSr.qualityGrade(@missedAddACanCancelSWOverdueDigits)

    @missedMisRecPicUpSWTotal =
      Sr.where(recycle_quad: 'SW',
        sr_type:'Missed Recycling Pickup',
        expression:['Overdue','Not Overdue']).count
    @missedMisRecPicUpSWOverdue =
      Sr.where(recycle_quad: 'SW',
        sr_type:'Missed Recycling Pickup',
        expression:['Overdue']).count
    @missedMisRecPicUpSWPercentOverdue =
      "#{((@missedMisRecPicUpSWOverdue.to_f.round(2)/
      @missedMisRecPicUpSWTotal.to_f.round(2))*100).round(2)}%"
    @missedMisRecPicUpSWNotOverdue =
      Sr.where(recycle_quad: 'SW',
        sr_type:'Missed Recycling Pickup',
        expression:['Not Overdue']).count
    @missedMisRecPicUpSWPercentNotOverdue =
    "#{((@missedMisRecPicUpSWNotOverdue.to_f.round(2)/
    @missedMisRecPicUpSWTotal.to_f.round(2))*100).round(2)}%"
    @missedMisRecPicUpSWNotOverdue = Sr.
      where(recycle_quad: 'SW',
        sr_type:'Missed Recycling Pickup',
         expression:['Not Overdue']).count

    @missedMisRecPicUpSWOverdueDigits =
      @missedMisRecPicUpSWNotOverdue.to_f/@missedMisRecPicUpSWTotal.to_f
    @missedMisRecPicUpSWGrade= OpenSr.
      qualityGrade(@missedMisRecPicUpSWOverdueDigits)

    @missedPOrVCompSWTotal = Sr.where(trash_quad: 'SW',
      sr_type:'Personnel or Vehicle Complaint',
       expression:['Overdue','Not Overdue']).count
    @missedPOrVCompSWOverdue = Sr.
      where(trash_quad: 'SW',
        sr_type:'Personnel or Vehicle Complaint',
         expression:['Overdue']).count
    @missedPOrVCompSWPercentOverdue =
      "#{((@missedPOrVCompSWOverdue.to_f.round(2)/
      @missedPOrVCompSWTotal.to_f.round(2))*100).round(2)}%"
    @missedPOrVCompSWNotOverdue = Sr.
      where(trash_quad: 'SW',
        sr_type:'Personnel or Vehicle Complaint',
        expression:['Not Overdue']).count
    @missedPOrVCompSWPercentNotOverdue =
      "#{((@missedPOrVCompSWNotOverdue.to_f.round(2)/
      @missedPOrVCompSWTotal.to_f.round(2))*100).round(2)}%"
    @missedPOrVCompSWNotOverdue = Sr.
      where(trash_quad: 'SW',
        sr_type:'Personnel or Vehicle Complaint',
        expression:['Not Overdue']).count
    @missedPOrVCompSWOverdueDigits = @missedPOrVCompSWNotOverdue.to_f/
    @missedPOrVCompSWTotal.to_f
    @missedPOrVCompSWGrade= OpenSr.
    qualityGrade(@missedPOrVCompSWOverdueDigits)

    @missedPhyChaPikSWTotal = Sr.
      where(trash_quad: 'SW',
        sr_type:'Physically Challenged Pickup',
         expression:['Overdue','Not Overdue']).count
    @missedPhyChaPikSWOverdue = Sr.
      where(trash_quad: 'SW',
        sr_type:'Physically Challenged Pickup',
         expression:['Overdue']).count
    @missedPhyChaPikSWPercentOverdue =
      "#{((@missedPhyChaPikSWOverdue.to_f.round(2)/
      @missedPhyChaPikSWTotal.to_f.round(2))*100).round(2)}%"
    @missedPhyChaPikSWNotOverdue = Sr.
      where(trash_quad: 'SW',
        sr_type:'Physically Challenged Pickup',
         expression:['Not Overdue']).count
    @missedPhyChaPikSWPercentNotOverdue =
      "#{((@missedPhyChaPikSWNotOverdue.to_f.round(2)/
      @missedPhyChaPikSWTotal.to_f.round(2))*100).round(2)}%"
    @missedPhyChaPikSWNotOverdue = Sr.
    where(trash_quad: 'SW',
      sr_type:'Physically Challenged Pickup',
      expression:['Not Overdue']).count
    @missedPhyChaPikSWOverdueDigits =
      @missedPhyChaPikSWNotOverdue.to_f/@missedPhyChaPikSWTotal.to_f
    @missedPhyChaPikSWGrade= OpenSr.
    qualityGrade(@missedPhyChaPikSWOverdueDigits)
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
           'Physically Challenged Pickup']).count
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
            'Physically Challenged Pickup']).count
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
        'Physically Challenged Pickup']).count
    @SWQuadPercentNotOverdue = "#{((@SWQuadSrNotOverdue.to_f/@SWQuadSrTotal.to_f)*100).round(2)}%"
    @SWQuadNotOverdueDigits = @SWQuadSrNotOverdue.to_f/@SWQuadSrTotal.to_f
    @SWQuadQualityGrade = OpenSr.qualityGrade(@SWQuadNotOverdueDigits)
#SE QUAD
    @missedHvySETotal = Sr.where(heavy_trash_quad: 'SE',
      sr_type:'Missed Heavy Trash Pickup',
      expression:['Overdue','Not Overdue']).count
    @missedHvySEOverdue = Sr.where(heavy_trash_quad: 'SE',sr_type:'Missed Heavy Trash Pickup',expression:['Overdue']).count
    @missedHvySEPercentOverdue =
    "#{((@missedHvySEOverdue.to_f.round(2)/@missedHvySETotal.to_f.round(2))*100).round(2)}%"
    @missedHvySEPercentNotOverdue =
    "#{((1-(@missedHvySEOverdue.to_f.round(2)/@missedHvySETotal.to_f.round(2)))*100).round(2)}%"
    @missedHvySENotOverdue = Sr.where(heavy_trash_quad: 'SE',
      sr_type:'Missed Heavy Trash Pickup',
       expression:['Not Overdue']).count
    @missedHvySEOverdueDigits = @missedHvySENotOverdue.to_f/@missedHvySETotal.to_f
    @missedHvySEGrade= OpenSr.qualityGrade(@missedHvySEOverdueDigits)

    @missedConProbSETotal = Sr.where(trash_quad: 'SE',
      sr_type:'Container Problem', expression:['Overdue','Not Overdue']).count
    @missedConProbSEOverdue = Sr.where(trash_quad: 'SE',
      sr_type:'Container Problem', expression:['Overdue']).count
    @missedConProbSEPercentOverdue =
    "#{((@missedConProbSEOverdue.to_f.round(2)/@missedConProbSETotal.to_f.round(2))*100).round(2)}%"
    @missedConProbSEPercentNotOverdue =
    "#{((1-(@missedConProbSEOverdue.to_f.round(2)/@missedConProbSETotal.to_f.round(2)))*100).round(2)}%"
    @missedConProbSENotOverdue = Sr.where(trash_quad: 'SE',
      sr_type:'Container Problem', expression:['Not Overdue']).count
    @missedConProbSEOverdueDigits = @missedConProbSENotOverdue.to_f/@missedConProbSETotal.to_f
    @missedConProbSEGrade= OpenSr.qualityGrade(@missedConProbSEOverdueDigits)

    @missedNewResSETotal = Sr.where(trash_quad: 'SE',
      sr_type:'New Resident Container', expression:['Overdue','Not Overdue']).count
    @missedNewResSEOverdue = Sr.where(trash_quad: 'SE',
      sr_type:'New Resident Container', expression:['Overdue']).count
    @missedNewResSEPercentOverdue = "#{((@missedNewResSEOverdue.to_f.round(2)/@missedNewResSETotal.to_f.round(2))*100).round(2)}%"
    @missedNewResSENotOverdue = Sr.where(trash_quad: 'SE',
      sr_type:'Container Problem', expression:['Not Overdue']).count
    # @missedNewResSEPercenNotOverdue = @missedNewResSENotOverdue.to_f.round(2)/@missedNewResSETotal
    @missedNewResSEPercentNotOverdue = "#{((1-(@missedNewResSEOverdue.to_f.round(2)/@missedNewResSETotal.to_f.round(2)))*100).round(2)}%"
    @missedNewResSENotOverdue = Sr.where(trash_quad: 'SE',
      sr_type:'New Resident Container', expression:['Not Overdue']).count
    @missedNewResSEOverdueDigits = @missedNewResSEPercenNotOverdue
    @missedNewResSEGrade= OpenSr.qualityGrade(@missedNewResSEOverdueDigits)

    @missedRecNewSETotal = Sr.where(trash_quad: 'SE',
      sr_type:'Recycling Participation NEW',
      expression:['Overdue','Not Overdue']).count
    @missedRecNewSEOverdue = Sr.where(trash_quad: 'SE',
      sr_type:'Recycling Participation NEW', expression:['Overdue']).count
    @missedRecNewSEPercentOverdue =
    "#{((@missedRecNewSEOverdue.to_f.round(2)/@missedRecNewSETotal.to_f.round(2))*100).round(2)}%"
    @missedRecNewSEPercentNotOverdue =
    "#{((1-(@missedRecNewSEOverdue.to_f.round(2)/@missedRecNewSETotal.to_f.round(2)))*100).round(2)}%"
    @missedRecNewSENotOverdue = Sr.where(trash_quad: 'SE',
      sr_type:'Recycling Participation NEW', expression:['Not Overdue']).count
    @missedRecNewSEOverdueDigits =
    @missedRecNewSENotOverdue.to_f/@missedRecNewSETotal.to_f
    @missedRecNewSEGrade= OpenSr.qualityGrade(@missedRecNewSEOverdueDigits)

    @missedRecCarRepSETotal = Sr.where(recycle_quad: 'SE',
      sr_type:'Recycling Cart Repair or Replace',
       expression:['Overdue','Not Overdue']).count
    @missedRecCarRepSEOverdue = Sr.where(recycle_quad: 'SE',
      sr_type:'Recycling Cart Repair or Replace',
      expression:['Overdue']).count
    @missedRecCarRepSEPercentOverdue =
    "#{((@missedRecCarRepSEOverdue.to_f.round(2)/@missedRecCarRepSETotal.to_f.round(2))*100).round(2)}%"
    @missedRecCarRepSEPercentNotOverdue =
    "#{((1-(@missedRecCarRepSEOverdue.to_f.round(2)/@missedRecCarRepSETotal.to_f.round(2)))*100).round(2)}%"
    @missedRecCarRepSENotOverdue = Sr.where(recycle_quad: 'SE',
      sr_type:'Recycling Cart Repair or Replace',
       expression:['Not Overdue']).count
    @missedRecCarRepSEOverdueDigits = @missedRecCarRepSENotOverdue.to_f/@missedRecCarRepSETotal.to_f
    @missedRecCarRepSEGrade= OpenSr.qualityGrade(@missedRecCarRepSEOverdueDigits)

    @missedSWMEscaSETotal = Sr.where(trash_quad: 'SE',sr_type:'SWM Escalation', expression:['Overdue','Not Overdue']).count
    @missedSWMEscaSEOverdue = Sr.where(trash_quad: 'SE',sr_type:'SWM Escalation', expression:['Overdue']).count
    @missedSWMEscaSEPercentOverdue = "#{((@missedSWMEscaSEOverdue.to_f.round(2)/@missedSWMEscaSETotal.to_f.round(2))*100).round(2)}%"
    @missedSWMEscaSEPercentNotOverdue = "#{((1-(@missedSWMEscaSEOverdue.to_f.round(2)/@missedSWMEscaSETotal.to_f.round(2)))*100).round(2)}%"
    @missedSWMEscaSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'SWM Escalation', expression:['Not Overdue']).count
    @missedSWMEscaSEOverdueDigits = @missedSWMEscaSENotOverdue.to_f/@missedSWMEscaSETotal.to_f
    @missedSWMEscaSEGrade= OpenSr.qualityGrade(@missedSWMEscaSEOverdueDigits)

    @missedMisGarbSETotal = Sr.where(trash_quad: 'SE',sr_type:'Missed Garbage Pickup', expression:['Overdue','Not Overdue']).count
    @missedMisGarbSEOverdue = Sr.where(trash_quad: 'SE',sr_type:'Missed Garbage Pickup', expression:['Overdue']).count
    @missedMisGarbSEPercentOverdue = "#{((@missedMisGarbSEOverdue.to_f.round(2)/@missedMisGarbSETotal.to_f.round(2))*100).round(2)}%"
    @missedMisGarbSEPercentNotOverdue = "#{((1-(@missedMisGarbSEOverdue.to_f.round(2)/@missedMisGarbSETotal.to_f.round(2)))*100).round(2)}%"
    @missedMisGarbSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Missed Garbage Pickup', expression:['Not Overdue']).count
    @missedMisGarbSEOverdueDigits = @missedMisGarbSENotOverdue.to_f/@missedMisGarbSETotal.to_f
    @missedMisGarbSEGrade= OpenSr.qualityGrade(@missedMisGarbSEOverdueDigits)

    @missedTrashDumpSETotal = Sr.where(trash_quad: 'SE',sr_type:'Trash Dumping or Illegal Dumpsite', expression:['Overdue','Not Overdue']).count
    @missedTrashDumpSEOverdue = Sr.where(trash_quad: 'SE',
      sr_type:'Trash Dumping or Illegal Dumpsite',
      expression:['Overdue']).count
    @missedTrashDumpSEPercentOverdue = "#{((@missedTrashDumpSEOverdue.to_f.round(2)/@missedTrashDumpSETotal.to_f.round(2))*100).round(2)}%"
    @missedTrashDumpSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Trash Dumping or Illegal Dumpsite', expression:['Not Overdue']).count
    @missedTrashDumpSEPercentNotOverdue = "#{(((@missedTrashDumpSENotOverdue.to_f/@missedTrashDumpSETotal.to_f)*100).round(2))}%"
    @missedTrashDumpSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Trash Dumping or Illegal Dumpsite', expression:['Not Overdue']).count
    @missedTrashDumpSEOverdueDigits = @missedTrashDumpSENotOverdue.to_f/@missedTrashDumpSETotal.to_f
    @missedTrashDumpSEGrade= OpenSr.qualityGrade(@missedTrashDumpSEOverdueDigits)

    @missedAddACanSETotal = Sr.where(trash_quad: 'SE',sr_type:'Add A Can', expression:['Overdue','Not Overdue']).count
    @missedAddACanSEOverdue = Sr.where(trash_quad: 'SE',sr_type:'Add A Can', expression:['Overdue']).count
    @missedAddACanSEPercentOverdue = "#{((@missedAddACanSEOverdue.to_f.round(2)/@missedAddACanSETotal.to_f.round(2))*100).round(2)}%"
    @missedAddACanSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Add A Can', expression:['Not Overdue']).count
    @missedAddACanSEPercentNotOverdue = "#{((@missedAddACanSENotOverdue.to_f.round(2)/@missedAddACanSETotal.to_f.round(2))*100).round(2)}%"
    @missedAddACanSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Add A Can', expression:['Not Overdue']).count
    @missedAddACanSEOverdueDigits = @missedAddACanSENotOverdue.to_f/@missedAddACanSETotal.to_f
    @missedAddACanSEGrade= OpenSr.qualityGrade(@missedAddACanSEOverdueDigits)

    @missedMisRecPicUpSETotal = Sr.where(recycle_quad: 'SE',sr_type:'Missed Recycling Pickup', expression:['Overdue','Not Overdue']).count
    @missedMisRecPicUpSEOverdue = Sr.where(recycle_quad: 'SE',sr_type:'Missed Recycling Pickup', expression:['Overdue']).count
    @missedMisRecPicUpSEPercentOverdue = "#{((@missedMisRecPicUpSEOverdue.to_f.round(2)/@missedMisRecPicUpSETotal.to_f.round(2))*100).round(2)}%"
    @missedMisRecPicUpSENotOverdue = Sr.where(recycle_quad: 'SE',sr_type:'Missed Recycling Pickup', expression:['Not Overdue']).count
    @missedMisRecPicUpSEPercentNotOverdue = "#{((@missedMisRecPicUpSENotOverdue.to_f.round(2)/@missedMisRecPicUpSETotal.to_f.round(2))*100).round(2)}%"
    @missedMisRecPicUpSENotOverdue = Sr.where(recycle_quad: 'SE',sr_type:'Missed Recycling Pickup', expression:['Not Overdue']).count
    @missedMisRecPicUpSEOverdueDigits = @missedMisRecPicUpSENotOverdue.to_f/@missedMisRecPicUpSETotal.to_f
    @missedMisRecPicUpSEGrade= OpenSr.qualityGrade(@missedMisRecPicUpSEOverdueDigits)

    @missedStormDebSETotal = Sr.where(trash_quad: 'SE',sr_type:'Storm Debris Collection', expression:['Overdue','Not Overdue']).count
    @missedStormDebSEOverdue = Sr.where(trash_quad: 'SE',sr_type:'Storm Debris Collection', expression:['Overdue']).count
    @missedStormDebSEPercentOverdue = "#{((@missedStormDebSEOverdue.to_f.round(2)/@missedStormDebSETotal.to_f.round(2))*100).round(2)}%"
    @missedStormDebSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Storm Debris Collection', expression:['Not Overdue']).count
    @missedStormDebSEPercentNotOverdue = "#{((@missedStormDebSENotOverdue.to_f.round(2)/@missedStormDebSETotal.to_f.round(2))*100).round(2)}%"
    @missedStormDebSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Storm Debris Collection', expression:['Not Overdue']).count
    @missedStormDebSEOverdueDigits = @missedStormDebSENotOverdue.to_f/@missedStormDebSETotal.to_f
    @missedStormDebSEGrade= OpenSr.qualityGrade(@missedStormDebSEOverdueDigits)

    @missedDeadAniColSETotal = Sr.where(trash_quad: 'SE',sr_type:'Dead Animal Collection', expression:['Overdue','Not Overdue']).count
    @missedDeadAniColSEOverdue = Sr.where(trash_quad: 'SE',sr_type:'Dead Animal Collection', expression:['Overdue']).count
    @missedDeadAniColSEPercentOverdue = "#{((@missedDeadAniColSEOverdue.to_f.round(2)/@missedDeadAniColSETotal.to_f.round(2))*100).round(2)}%"
    @missedDeadAniColSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Dead Animal Collection', expression:['Not Overdue']).count
    @missedDeadAniColSEPercentNotOverdue = "#{((@missedDeadAniColSENotOverdue.to_f.round(2)/@missedDeadAniColSETotal.to_f.round(2))*100).round(2)}%"
    @missedDeadAniColSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Dead Animal Collection', expression:['Not Overdue']).count
    @missedDeadAniColSEOverdueDigits = @missedDeadAniColSENotOverdue.to_f/@missedDeadAniColSETotal.to_f
    @missedDeadAniColSEGrade= OpenSr.qualityGrade(@missedDeadAniColSEOverdueDigits)

    @missedAddACanCancelSETotal = Sr.where(trash_quad: 'SE',sr_type:'Add A Can CANCELLATION', expression:['Overdue','Not Overdue']).count
    @missedAddACanCancelSEOverdue = Sr.where(trash_quad: 'SE',sr_type:'Add A Can CANCELLATION', expression:['Overdue']).count
    @missedAddACanCancelSEPercentOverdue = "#{((@missedAddACanCancelSEOverdue.to_f.round(2)/@missedAddACanCancelSETotal.to_f.round(2))*100).round(2)}%"
    @missedAddACanCancelSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Add A Can CANCELLATION', expression:['Not Overdue']).count
    @missedAddACanCancelSEPercentNotOverdue = "#{((@missedAddACanCancelSENotOverdue.to_f.round(2)/@missedAddACanCancelSETotal.to_f.round(2))*100).round(2)}%"
    @missedAddACanCancelSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Add A Can CANCELLATION', expression:['Not Overdue']).count
    @missedAddACanCancelSEOverdueDigits = @missedAddACanCancelSENotOverdue.to_f/@missedAddACanCancelSETotal.to_f
    @missedAddACanCancelSEGrade= OpenSr.qualityGrade(@missedAddACanCancelSEOverdueDigits)

    @missedPOrVCompSETotal = Sr.where(trash_quad: 'SE',sr_type:'Personnel or Vehicle Complaint', expression:['Overdue','Not Overdue']).count
    @missedPOrVCompSEOverdue = Sr.where(trash_quad: 'SE',sr_type:'Personnel or Vehicle Complaint', expression:['Overdue']).count
    @missedPOrVCompSEPercentOverdue = "#{((@missedPOrVCompSEOverdue.to_f.round(2)/@missedPOrVCompSETotal.to_f.round(2))*100).round(2)}%"
    @missedPOrVCompSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Personnel or Vehicle Complaint', expression:['Not Overdue']).count
    @missedPOrVCompSEPercentNotOverdue = "#{((@missedPOrVCompSENotOverdue.to_f.round(2)/@missedPOrVCompSETotal.to_f.round(2))*100).round(2)}%"
    @missedPOrVCompSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Personnel or Vehicle Complaint', expression:['Not Overdue']).count
    @missedPOrVCompSEOverdueDigits = @missedPOrVCompSENotOverdue.to_f/@missedPOrVCompSETotal.to_f
    @missedPOrVCompSEGrade= OpenSr.qualityGrade(@missedPOrVCompSEOverdueDigits)

    @missedPhyChaPikSETotal = Sr.where(trash_quad: 'SE',sr_type:'Physically Challenged Pickup', expression:['Overdue','Not Overdue']).count
    @missedPhyChaPikSEOverdue = Sr.where(trash_quad: 'SE',sr_type:'Physically Challenged Pickup', expression:['Overdue']).count
    @missedPhyChaPikSEPercentOverdue = "#{((@missedPhyChaPikSEOverdue.to_f.round(2)/@missedPhyChaPikSETotal.to_f.round(2))*100).round(2)}%"
    @missedPhyChaPikSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Physically Challenged Pickup', expression:['Not Overdue']).count
    @missedPhyChaPikSEPercentNotOverdue = "#{((@missedPhyChaPikSENotOverdue.to_f.round(2)/@missedPhyChaPikSETotal.to_f.round(2))*100).round(2)}%"
    @missedPhyChaPikSENotOverdue = Sr.where(trash_quad: 'SE',sr_type:'Physically Challenged Pickup', expression:['Not Overdue']).count
    @missedPhyChaPikSEOverdueDigits = @missedPhyChaPikSENotOverdue.to_f/@missedPhyChaPikSETotal.to_f
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
           'Physically Challenged Pickup']).count
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
        'Physically Challenged Pickup']).count
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
        'Physically Challenged Pickup']).count
    @SEQuadPercentNotOverdue = "#{((@SEQuadSrNotOverdue.to_f/@SEQuadSrTotal.to_f)*100).round(2)}%"
    @SEQuadNotOverdueDigits = @SEQuadSrNotOverdue.to_f/@SEQuadSrTotal.to_f
    @SEQuadQualityGrade = OpenSr.qualityGrade(@SEQuadNotOverdueDigits)
#NORTH EAST
    @missedHvyNETotal = Sr.where(heavy_trash_quad: 'NE',sr_type:'Missed Heavy Trash Pickup', expression:['Overdue','Not Overdue']).count
    @missedHvyNEOverdue = Sr.where(heavy_trash_quad: 'NE',sr_type:'Missed Heavy Trash Pickup', expression:['Overdue']).count
    @missedHvyNEPercentOverdue = "#{((@missedHvyNEOverdue.to_f.round(2)/@missedHvyNETotal.to_f.round(2))*100).round(2)}%"
    @missedHvyNEPercentNotOverdue = "#{((1-(@missedHvyNEOverdue.to_f.round(2)/@missedHvyNETotal.to_f.round(2)))*100).round(2)}%"
    @missedHvyNENotOverdue = Sr.where(heavy_trash_quad: 'NE',sr_type:'Missed Heavy Trash Pickup', expression:['Not Overdue']).count
    @missedHvyNEOverdueDigits = @missedHvyNENotOverdue.to_f/@missedHvyNETotal.to_f
    @missedHvyNEGrade= OpenSr.qualityGrade(@missedHvyNEOverdueDigits)

    @missedConProbNETotal = Sr.where(trash_quad: 'NE',sr_type:'Container Problem', expression:['Overdue','Not Overdue']).count
    @missedConProbNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Container Problem', expression:['Overdue']).count
    @missedConProbNEPercentOverdue = "#{((@missedConProbNEOverdue.to_f.round(2)/@missedConProbNETotal.to_f.round(2))*100).round(2)}%"
    @missedConProbNEPercentNotOverdue = "#{((1-(@missedConProbNEOverdue.to_f.round(2)/@missedConProbNETotal.to_f.round(2)))*100).round(2)}%"
    @missedConProbNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Container Problem', expression:['Not Overdue']).count
    @missedConProbOverdueDigits = @missedConProbNENotOverdue.to_f/@missedConProbNETotal.to_f
    @missedConProbNEGrade= OpenSr.qualityGrade(@missedConProbOverdueDigits)

    @missedNewResNETotal = Sr.where(trash_quad: 'NE',sr_type:'New Resident Container', expression:['Overdue','Not Overdue']).count
    @missedNewResNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'New Resident Container', expression:['Overdue']).count
    @missedNewResNEPercentOverdue = "#{((@missedNewResNEOverdue.to_f.round(2)/@missedNewResNETotal.to_f.round(2))*100).round(2)}%"
    @missedNewResNEPercentNotOverdue = "#{((1-(@missedNewResNEOverdue.to_f.round(2)/@missedNewResNETotal.to_f.round(2)))*100).round(2)}%"
    @missedNewResNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'New Resident Container', expression:['Not Overdue']).count
    @missedNewResNEOverdueDigits = @missedNewResNENotOverdue.to_f/@missedNewResNETotal.to_f
    @missedNewResNEGrade= OpenSr.qualityGrade(@missedNewResNEOverdueDigits)

    @missedRecNewNETotal = Sr.where(trash_quad: 'NE',sr_type:'Recycling Participation NEW', expression:['Overdue','Not Overdue']).count
    @missedRecNewNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Recycling Participation NEW', expression:['Overdue']).count
    @missedRecNewNEPercentOverdue = "#{((@missedRecNewNEOverdue.to_f.round(2)/@missedRecNewNETotal.to_f.round(2))*100).round(2)}%"
    @missedRecNewNEPercentNotOverdue = "#{((1-(@missedRecNewNEOverdue.to_f.round(2)/@missedRecNewNETotal.to_f.round(2)))*100).round(2)}%"
    @missedRecNewNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Recycling Participation NEW', expression:['Not Overdue']).count
    @missedRecNewNEOverdueDigits = @missedRecNewNENotOverdue.to_f/@missedRecNewNETotal.to_f
    @missedRecNewNEGrade= OpenSr.qualityGrade(@missedRecNewNEOverdueDigits)

    @missedRecCarRepNETotal = Sr.where(recycle_quad: 'NE',sr_type:'Recycling Cart Repair or Replace', expression:['Overdue','Not Overdue']).count
    @missedRecCarRepNEOverdue = Sr.where(recycle_quad: 'NE',sr_type:'Recycling Cart Repair or Replace', expression:['Overdue']).count
    @missedRecCarRepNEPercentOverdue = "#{((@missedRecCarRepNEOverdue.to_f.round(2)/@missedRecCarRepNETotal.to_f.round(2))*100).round(2)}%"
    @missedRecCarRepNEPercentNotOverdue = "#{((@missedRecCarRepNENotOverdue.to_f.round(2) / @missedRecCarRepNETotal.to_f.round(2)*100)).round(2)}%"
    @missedRecCarRepNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Recycling Cart Repair or Replace', expression:['Not Overdue']).count
    @missedRecCarRepNEOverdueDigits = @missedRecCarRepNENotOverdue.to_f/@missedRecCarRepNETotal.to_f
    @missedRecCarRepNEGrade= OpenSr.qualityGrade(@missedRecCarRepNEOverdueDigits)

    @missedSWMEscaNETotal = Sr.where(trash_quad: 'NE',sr_type:'SWM Escalation', expression:['Overdue','Not Overdue']).count
    @missedSWMEscaNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'SWM Escalation', expression:['Overdue']).count
    @missedSWMEscaNEPercentOverdue = "#{((@missedSWMEscaNEOverdue.to_f.round(2)/@missedSWMEscaNETotal.to_f.round(2))*100).round(2)}%"
    @missedSWMEscaNEPercentNotOverdue = "#{((1-(@missedSWMEscaNEOverdue.to_f.round(2)/@missedSWMEscaNETotal.to_f.round(2)))*100).round(2)}%"
    @missedSWMEscaNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'SWM Escalation', expression:['Not Overdue']).count
    @missedSWMEscaNEOverdueDigits = @missedSWMEscaNENotOverdue.to_f/@missedSWMEscaNETotal.to_f
    @missedSWMEscaNEGrade= OpenSr.qualityGrade(@missedSWMEscaNEOverdueDigits)

    @missedMisGarbNETotal = Sr.where(trash_quad: 'NE',sr_type:'Missed Garbage Pickup', expression:['Overdue','Not Overdue']).count
    @missedMisGarbNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Missed Garbage Pickup', expression:['Overdue']).count
    @missedMisGarbNEPercentOverdue = "#{((@missedMisGarbNEOverdue.to_f.round(2)/@missedMisGarbNETotal.to_f.round(2))*100).round(2)}%"
    @missedMisGarbNEPercentNotOverdue = "#{((1-(@missedMisGarbNEOverdue.to_f.round(2)/@missedMisGarbNETotal.to_f.round(2)))*100).round(2)}%"
    @missedMisGarbNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Missed Garbage Pickup', expression:['Not Overdue']).count
    @missedMisGarbNEOverdueDigits = @missedMisGarbNENotOverdue.to_f/@missedMisGarbNETotal.to_f
    @missedMisGarbNEGrade= OpenSr.qualityGrade(@missedMisGarbNEOverdueDigits)

    @missedTrashDumpNETotal = Sr.where(trash_quad: 'NE',sr_type:'Trash Dumping or Illegal Dumpsite', expression:['Overdue','Not Overdue']).count
    @missedTrashDumpNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Trash Dumping or Illegal Dumpsite', expression:['Overdue']).count
    @missedTrashDumpNEPercentOverdue = "#{((@missedTrashDumpNEOverdue.to_f.round(2)/@missedTrashDumpNETotal.to_f.round(2))*100).round(2)}%"
    @missedMTrashDumpNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Trash Dumping or Illegal Dumpsite', expression:['Not Overdue']).count
    @missedTrashDumpNEPercentNotOverdue = "#{((@missedMTrashDumpNENotOverdue.to_f.round(2)/@missedTrashDumpNETotal.to_f.round(2))*100).round(2)}%"
    @missedTrashDumpNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Trash Dumping or Illegal Dumpsite', expression:['Not Overdue']).count
    @missedTrashDumpNEOverdueDigits = @missedTrashDumpNENotOverdue.to_f/@missedTrashDumpNETotal.to_f
    @missedTrashDumpNEGrade= OpenSr.qualityGrade(@missedTrashDumpNEOverdueDigits)

    @missedAddACanNETotal = Sr.where(trash_quad: 'NE',sr_type:'Add A Can', expression:['Overdue','Not Overdue']).count
    @missedAddACanNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Add A Can', expression:['Overdue']).count
    @missedAddACanNEPercentOverdue = "#{((@missedAddACanNEOverdue.to_f.round(2)/@missedAddACanNETotal.to_f.round(2))*100).round(2)}%"
    @missedAddACanNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Add A Can', expression:['Not Overdue']).count
    @missedAddACanNEPercentNotOverdue = "#{((@missedAddACanNENotOverdue.to_f.round(2)/@missedAddACanNETotal.to_f.round(2))*100).round(2)}%"
    @missedAddACanNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Add A Can', expression:['Not Overdue']).count
    @missedAddACanNEOverdueDigits = @missedAddACanNENotOverdue.to_f/@missedAddACanNETotal.to_f
    @missedAddACanNEGrade= OpenSr.qualityGrade(@missedAddACanNEOverdueDigits)

    @missedMisRecPicUpNETotal = Sr.where(recycle_quad: 'NE',sr_type:'Missed Recycling Pickup', expression:['Overdue','Not Overdue']).count
    @missedMisRecPicUpNEOverdue = Sr.where(recycle_quad: 'NE',sr_type:'Missed Recycling Pickup', expression:['Overdue']).count
    @missedMisRecPicUpNEPercentOverdue = "#{((@missedMisRecPicUpNEOverdue.to_f.round(2)/@missedMisRecPicUpNETotal.to_f.round(2))*100).round(2)}%"
    @missedMisRecPicUpNENotOverdue = Sr.where(recycle_quad: 'NE',sr_type:'Missed Recycling Pickup', expression:['Not Overdue']).count
    @missedMisRecPicUpNEPercentNotOverdue = "#{((@missedMisRecPicUpNENotOverdue.to_f.round(2)/@missedMisRecPicUpNETotal.to_f.round(2))*100).round(2)}%"
    @missedMisRecPicUpNENotOverdue = Sr.where(recycle_quad: 'NE',sr_type:'Missed Recycling Pickup', expression:['Not Overdue']).count
    @missedMisRecPicUpNEOverdueDigits = @missedMisRecPicUpNENotOverdue.to_f/@missedMisRecPicUpNETotal.to_f
    @missedMisRecPicUpNEGrade= OpenSr.qualityGrade(@missedMisRecPicUpNEOverdueDigits)

    @missedStormDebNETotal = Sr.where(trash_quad: 'NE',sr_type:'Storm Debris Collection', expression:['Overdue','Not Overdue']).count
    @missedStormDebNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Storm Debris Collection', expression:['Overdue']).count
    @missedStormDebNEPercentOverdue = "#{((@missedStormDebNEOverdue.to_f.round(2)/@missedStormDebNETotal.to_f.round(2))*100).round(2)}%"
    @missedStormDebNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Storm Debris Collection', expression:['Not Overdue']).count
    @missedStormDebNEPercentNotOverdue = "#{((@missedStormDebNENotOverdue.to_f.round(2)/@missedStormDebNETotal.to_f.round(2))*100).round(2)}%"
    @missedStormDebNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Storm Debris Collection', expression:['Not Overdue']).count
    @missedStormDebNEOverdueDigits = @missedStormDebNENotOverdue.to_f/@missedStormDebNETotal.to_f
    @missedStormDebNEGrade= OpenSr.qualityGrade(@missedStormDebNEOverdueDigits)

    @missedDeadAniColNETotal = Sr.where(trash_quad: 'NE',sr_type:'Dead Animal Collection', expression:['Overdue','Not Overdue']).count
    @missedDeadAniColNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Dead Animal Collection', expression:['Overdue']).count
    @missedDeadAniColNEPercentOverdue = "#{((@missedDeadAniColNEOverdue.to_f.round(2)/@missedDeadAniColNETotal.to_f.round(2))*100).round(2)}%"
    @missedDeadAniColNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Dead Animal Collection', expression:['Not Overdue']).count
    @missedDeadAniColNEPercentNotOverdue = "#{((@missedDeadAniColNENotOverdue.to_f.round(2)/@missedDeadAniColNETotal.to_f.round(2))*100).round(2)}%"
    @missedDeadAniColNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Dead Animal Collection', expression:['Not Overdue']).count
    @missedDeadAniColNEOverdueDigits = @missedDeadAniColNENotOverdue.to_f/@missedDeadAniColNETotal.to_f
    @missedDeadAniColNEGrade= OpenSr.qualityGrade(@missedDeadAniColNEOverdueDigits)

    @missedAddACanCancelNETotal = Sr.where(trash_quad: 'NE',sr_type:'Add A Can CANCELLATION', expression:['Overdue','Not Overdue']).count
    @missedAddACanCancelNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Add A Can CANCELLATION', expression:['Overdue']).count
    @missedAddACanCancelNEPercentOverdue = "#{((@missedAddACanCancelNEOverdue.to_f.round(2)/@missedAddACanCancelNETotal.to_f.round(2))*100).round(2)}%"
    @missedAddACanCancelNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Add A Can CANCELLATION', expression:['Not Overdue']).count
    @missedAddACanCancelNEPercentNotOverdue = "#{((@missedAddACanCancelNENotOverdue.to_f.round(2)/@missedAddACanCancelNETotal.to_f.round(2))*100).round(2)}%"
    @missedAddACanCancelNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Add A Can CANCELLATION', expression:['Not Overdue']).count
    @missedAddACanCancelNEOverdueDigits = @missedAddACanCancelNENotOverdue.to_f/@missedAddACanCancelNETotal.to_f
    @missedAddACanCancelNEGrade= OpenSr.qualityGrade(@missedAddACanCancelNEOverdueDigits)

    @missedPOrVCompNETotal = Sr.where(trash_quad: 'NE',sr_type:'Personnel or Vehicle Complaint', expression:['Overdue','Not Overdue']).count
    @missedPOrVCompNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Personnel or Vehicle Complaint', expression:['Overdue']).count
    @missedPOrVCompNEPercentOverdue = "#{((@missedPOrVCompNEOverdue.to_f.round(2)/@missedPOrVCompNETotal.to_f.round(2))*100).round(2)}%"
    @missedPOrVCompNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Personnel or Vehicle Complaint', expression:['Not Overdue']).count
    @missedPOrVCompNEPercentNotOverdue = "#{((@missedPOrVCompNENotOverdue.to_f.round(2)/@missedPOrVCompNETotal.to_f.round(2))*100).round(2)}%"
    @missedPOrVCompNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Personnel or Vehicle Complaint', expression:['Not Overdue']).count
    @missedPOrVCompNEOverdueDigits = @missedPOrVCompNENotOverdue.to_f/@missedPOrVCompNETotal.to_f
    @missedPOrVCompNEGrade= OpenSr.qualityGrade(@missedPOrVCompNEOverdueDigits)

    @missedPhyChaPikNETotal = Sr.where(trash_quad: 'NE',sr_type:'Physically Challenged Pickup', expression:['Overdue','Not Overdue']).count
    @missedPhyChaPikNEOverdue = Sr.where(trash_quad: 'NE',sr_type:'Physically Challenged Pickup', expression:['Overdue']).count
    @missedPhyChaPikNEPercentOverdue = "#{((@missedPhyChaPikNEOverdue.to_f.round(2)/@missedPhyChaPikNETotal.to_f.round(2))*100).round(2)}%"
    @missedPhyChaPikNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Physically Challenged Pickup', expression:['Not Overdue']).count
    @missedPhyChaPikNEPercentNotOverdue = "#{((@missedPhyChaPikNENotOverdue.to_f.round(2)/@missedPhyChaPikNETotal.to_f.round(2))*100).round(2)}%"
    @missedPhyChaPikNENotOverdue = Sr.where(trash_quad: 'NE',sr_type:'Physically Challenged Pickup', expression:['Not Overdue']).count
    @missedPhyChaPikNEOverdueDigits = @missedPhyChaPikNENotOverdue.to_f/@missedPhyChaPikNETotal.to_f
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
        'Physically Challenged Pickup']).count
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
        'Physically Challenged Pickup']).count
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
        'Physically Challenged Pickup']).count
    @NEQuadPercentNotOverdue = "#{((@NEQuadSrNotOverdue.to_f/@NEQuadSrTotal.to_f)*100).round(2)}%"
    @NEQuadNotOverdueDigits = @NEQuadSrNotOverdue.to_f/@NEQuadSrTotal.to_f
    @NEQuadQualityGrade = OpenSr.qualityGrade(@NEQuadNotOverdueDigits)

#NORTH WEST
        @missedHvyNWTotal = Sr.where(heavy_trash_quad: 'NW',sr_type:'Missed Heavy Trash Pickup', expression:['Overdue','Not Overdue']).count
        @missedHvyNWOverdue = Sr.where(heavy_trash_quad: 'NW',sr_type:'Missed Heavy Trash Pickup', expression:['Overdue']).count
        @missedHvyNWPercentOverdue = "#{((@missedHvyNWOverdue.to_f.round(2)/@missedHvyNWTotal.to_f.round(2))*100).round(2)}%"
        @missedHvyNWPercentNotOverdue = "#{((1-(@missedHvyNWOverdue.to_f.round(2)/@missedHvyNWTotal.to_f.round(2)))*100).round(2)}%"
        @missedHvyNWNotOverdue = Sr.where(heavy_trash_quad: 'NW',sr_type:'Missed Heavy Trash Pickup', expression:['Not Overdue']).count
        @missedHvyNWOverdueDigits = @missedHvyNWNotOverdue.to_f/@missedHvyNWTotal.to_f
        @missedHvyNWGrade= OpenSr.qualityGrade(@missedHvyOverdueDigits)

        @missedConProbNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Container Problem', expression:['Overdue','Not Overdue']).count
        @missedConProbNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Container Problem', expression:['Overdue']).count
        @missedConProbNWPercentOverdue = "#{((@missedConProbNWOverdue.to_f.round(2)/@missedConProbNWTotal.to_f.round(2))*100).round(2)}%"
        @missedConProbNWPercentNotOverdue = "#{((1-(@missedConProbNWOverdue.to_f.round(2)/@missedConProbNWTotal.to_f.round(2)))*100).round(2)}%"
        @missedConProbNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Container Problem', expression:['Not Overdue']).count
        @missedConProbNWOverdueDigits = @missedConProbNWNotOverdue.to_f/@missedConProbNWTotal.to_f
        @missedConProbNWGrade= OpenSr.qualityGrade(@missedConProbNWOverdueDigits)

        @missedNewResNWTotal = Sr.where(trash_quad: 'NW',sr_type:'New Resident Container', expression:['Overdue','Not Overdue']).count
        @missedNewResNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'New Resident Container', expression:['Overdue']).count
        @missedNewResNWPercentOverdue = "#{((@missedNewResNWOverdue.to_f.round(2)/@missedNewResNWTotal.to_f.round(2))*100).round(2)}%"
        @missedNewResNWPercentNotOverdue = "#{((1-(@missedNewResNWOverdue.to_f.round(2)/@missedNewResNWTotal.to_f.round(2)))*100).round(2)}%"
        @missedNewResNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'New Resident Container', expression:['Not Overdue']).count
        @missedNewResNWOverdueDigits = @missedNewResNWNotOverdue.to_f/@missedNewResNWTotal.to_f
        @missedNewResNWGrade= OpenSr.qualityGrade(@missedNewResNWOverdueDigits)

        @missedRecNewNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Recycling Participation NEW', expression:['Overdue','Not Overdue']).count
        @missedRecNewNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Recycling Participation NEW', expression:['Overdue']).count
        @missedRecNewNWPercentOverdue = "#{((@missedRecNewNWOverdue.to_f.round(2)/@missedRecNewNWTotal.to_f.round(2))*100).round(2)}%"
        @missedRecNewNWPercentNotOverdue = "#{((1-(@missedRecNewNWOverdue.to_f.round(2)/@missedRecNewNWTotal.to_f.round(2)))*100).round(2)}%"
        @missedRecNewNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Recycling Participation NEW', expression:['Not Overdue']).count
        @missedRecNewNWOverdueDigits = @missedRecNewNWNotOverdue.to_f/@missedRecNewNWTotal.to_f
        @missedRecNewNWGrade= OpenSr.qualityGrade(@missedRecNewNWOverdueDigits)

        @missedRecCarRepNWTotal = Sr.where(recycle_quad: 'NW',sr_type:'Recycling Cart Repair or Replace', expression:['Overdue','Not Overdue']).count
        @missedRecCarRepNWOverdue = Sr.where(recycle_quad: 'NW',sr_type:'Recycling Cart Repair or Replace', expression:['Overdue']).count
        @missedRecCarRepNWPercentOverdue = "#{((@missedRecCarRepNWOverdue.to_f.round(2)/@missedRecCarRepNWTotal.to_f.round(2))*100).round(2)}%"
        @missedRecCarRepNWPercentNotOverdue = "#{((1-(@missedRecCarRepNWOverdue.to_f.round(2)/@missedRecCarRepNWTotal.to_f.round(2)))*100).round(2)}%"
        @missedRecCarRepNWNotOverdue = Sr.where(recycle_quad: 'NW',sr_type:'Recycling Cart Repair or Replace', expression:['Not Overdue']).count
        @missedRecCarRepNWOverdueDigits = @missedRecCarRepNWNotOverdue.to_f/@missedRecCarRepNWTotal.to_f
        @missedRecCarRepNWGrade= OpenSr.qualityGrade(@missedRecCarRepNWOverdueDigits)

        @missedSWMEscaNWTotal = Sr.where(trash_quad: 'NW',sr_type:'SWM Escalation', expression:['Overdue','Not Overdue']).count
        @missedSWMEscaNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'SWM Escalation', expression:['Overdue']).count
        @missedSWMEscaNWPercentOverdue = "#{((@missedSWMEscaNWOverdue.to_f.round(2)/@missedSWMEscaNWTotal.to_f.round(2))*100).round(2)}%"
        @missedSWMEscaNWPercentNotOverdue = "#{((1-(@missedSWMEscaNWOverdue.to_f.round(2)/@missedSWMEscaNWTotal.to_f.round(2)))*100).round(2)}%"
        @missedSWMEscaNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'SWM Escalation', expression:['Not Overdue']).count
        @missedSWMEscaNWOverdueDigits = @missedSWMEscaNWNotOverdue.to_f/@missedSWMEscaNWTotal.to_f
        @missedSWMEscaNWGrade= OpenSr.qualityGrade(@missedSWMEscaNWOverdueDigits)

        @missedMisGarbNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Missed Garbage Pickup', expression:['Overdue','Not Overdue']).count
        @missedMisGarbNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Missed Garbage Pickup', expression:['Overdue']).count
        @missedMisGarbNWPercentOverdue = "#{((@missedMisGarbNWOverdue.to_f.round(2)/@missedMisGarbNWTotal.to_f.round(2))*100).round(2)}%"
        @missedMisGarbNWPercentNotOverdue = "#{((1-(@missedMisGarbNWOverdue.to_f.round(2)/@missedMisGarbNWTotal.to_f.round(2)))*100).round(2)}%"
        @missedMisGarbNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Missed Garbage Pickup', expression:['Not Overdue']).count
        @missedMisGarbNWOverdueDigits = @missedMisGarbNWNotOverdue.to_f/@missedMisGarbNWTotal.to_f
        @missedMisGarbNWGrade= OpenSr.qualityGrade(@missedMisGarbNWOverdueDigits)

        @missedTrashDumpNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Trash Dumping or Illegal Dumpsite', expression:['Overdue','Not Overdue']).count
        @missedTrashDumpNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Trash Dumping or Illegal Dumpsite', expression:['Overdue']).count
        @missedTrashDumpNWPercentOverdue = "#{((@missedTrashDumpNWOverdue.to_f.round(2)/@missedTrashDumpNWTotal.to_f.round(2))*100).round(2)}%"
        @missedMTrashDumpNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Trash Dumping or Illegal Dumpsite', expression:['Not Overdue']).count
        @missedTrashDumpNWPercentNotOverdue = "#{((@missedMTrashDumpNWNotOverdue.to_f.round(2)/@missedTrashDumpNWTotal.to_f.round(2))*100).round(2)}%"
        @missedTrashDumpNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Trash Dumping or Illegal Dumpsite', expression:['Not Overdue']).count
        @missedTrashDumpNWOverdueDigits = @missedTrashDumpNWNotOverdue.to_f/@missedTrashDumpNWTotal.to_f
        @missedTrashDumpNWGrade= OpenSr.qualityGrade(@missedTrashDumpNWOverdueDigits)

        @missedAddACanNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Add A Can', expression:['Overdue','Not Overdue']).count
        @missedAddACanNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Add A Can', expression:['Overdue']).count
        @missedAddACanNWPercentOverdue = "#{((@missedAddACanNWOverdue.to_f.round(2)/@missedAddACanNWTotal.to_f.round(2))*100).round(2)}%"
        @missedAddACanNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Add A Can', expression:['Not Overdue']).count
        @missedAddACanNWPercentNotOverdue = "#{((@missedAddACanNWNotOverdue.to_f.round(2)/@missedAddACanNWTotal.to_f.round(2))*100).round(2)}%"
        @missedAddACanNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Add A Can', expression:['Not Overdue']).count
        @missedAddACanNWOverdueDigits = @missedAddACanNWNotOverdue.to_f/@missedAddACanNWTotal.to_f
        @missedAddACanNWGrade= OpenSr.qualityGrade(@missedAddACanNWOverdueDigits)

        @missedMisRecPicUpNWTotal = Sr.where(recycle_quad: 'NW',sr_type:'Missed Recycling Pickup', expression:['Overdue','Not Overdue']).count
        @missedMisRecPicUpNWOverdue = Sr.where(recycle_quad: 'NW',sr_type:'Missed Recycling Pickup', expression:['Overdue']).count
        @missedMisRecPicUpNWPercentOverdue = "#{((@missedMisRecPicUpNWOverdue.to_f.round(2)/@missedMisRecPicUpNWTotal.to_f.round(2))*100).round(2)}%"
        @missedMisRecPicUpNWNotOverdue = Sr.where(recycle_quad: 'NW',sr_type:'Missed Recycling Pickup', expression:['Not Overdue']).count
        @missedMisRecPicUpNWPercentNotOverdue = "#{((@missedMisRecPicUpNWNotOverdue.to_f.round(2)/@missedMisRecPicUpNWTotal.to_f.round(2))*100).round(2)}%"
        @missedMisRecPicUpNWNotOverdue = Sr.where(recycle_quad: 'NW',sr_type:'Missed Recycling Pickup', expression:['Not Overdue']).count
        @missedMisRecPicUpNWOverdueDigits = @missedMisRecPicUpNWNotOverdue.to_f/@missedMisRecPicUpNWTotal.to_f
        @missedMisRecPicUpNWGrade= OpenSr.qualityGrade(@missedMisRecPicUpNWOverdueDigits)

        @missedStormDebNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Storm Debris Collection', expression:['Overdue','Not Overdue']).count
        @missedStormDebNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Storm Debris Collection', expression:['Overdue']).count
        @missedStormDebNWPercentOverdue = "#{((@missedStormDebNWOverdue.to_f.round(2)/@missedStormDebNWTotal.to_f.round(2))*100).round(2)}%"
        @missedStormDebNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Storm Debris Collection', expression:['Not Overdue']).count
        @missedStormDebNWPercentNotOverdue = "#{((@missedStormDebNWNotOverdue.to_f.round(2)/@missedStormDebNWTotal.to_f.round(2))*100).round(2)}%"
        @missedStormDebNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Storm Debris Collection', expression:['Not Overdue']).count
        @missedStormDebNWOverdueDigits = @missedStormDebNWNotOverdue.to_f/@missedStormDebNWTotal.to_f
        @missedStormDebNWGrade= OpenSr.qualityGrade(@missedStormDebNWOverdueDigits)

        @missedDeadAniColNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Dead Animal Collection', expression:['Overdue','Not Overdue']).count
        @missedDeadAniColNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Dead Animal Collection', expression:['Overdue']).count
        @missedDeadAniColNWPercentOverdue = "#{((@missedDeadAniColNWOverdue.to_f.round(2)/@missedDeadAniColNWTotal.to_f.round(2))*100).round(2)}%"
        @missedDeadAniColNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Dead Animal Collection', expression:['Not Overdue']).count
        @missedDeadAniColNWPercentNotOverdue = "#{((@missedDeadAniColNWNotOverdue.to_f.round(2)/@missedDeadAniColNWTotal.to_f.round(2))*100).round(2)}%"
        @missedDeadAniColNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Dead Animal Collection', expression:['Not Overdue']).count
        @missedDeadAniColNWOverdueDigits = @missedDeadAniColNWNotOverdue.to_f/@missedDeadAniColNWTotal.to_f
        @missedDeadAniColNWGrade= OpenSr.qualityGrade(@missedDeadAniColNWOverdueDigits)

        @missedAddACanCancelNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Add A Can CANCELLATION', expression:['Overdue','Not Overdue']).count
        @missedAddACanCancelNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Add A Can CANCELLATION', expression:['Overdue']).count
        @missedAddACanCancelNWPercentOverdue = "#{((@missedAddACanCancelNWOverdue.to_f.round(2)/@missedAddACanCancelNWTotal.to_f.round(2))*100).round(2)}%"
        @missedAddACanCancelNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Add A Can CANCELLATION', expression:['Not Overdue']).count
        @missedAddACanCancelNWPercentNotOverdue = "#{((@missedAddACanCancelNWNotOverdue.to_f.round(2)/@missedAddACanCancelNWTotal.to_f.round(2))*100).round(2)}%"
        @missedAddACanCancelNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Add A Can CANCELLATION', expression:['Not Overdue']).count
        @missedAddACanCancelNWOverdueDigits = @missedAddACanCancelNWNotOverdue.to_f/@missedAddACanCancelNWTotal.to_f
        @missedAddACanCancelNWGrade= OpenSr.qualityGrade(@missedAddACanCancelNWOverdueDigits)

        @missedPOrVCompNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Personnel or Vehicle Complaint', expression:['Overdue','Not Overdue']).count
        @missedPOrVCompNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Personnel or Vehicle Complaint', expression:['Overdue']).count
        @missedPOrVCompNWPercentOverdue = "#{((@missedPOrVCompNWOverdue.to_f.round(2)/@missedPOrVCompNWTotal.to_f.round(2))*100).round(2)}%"
        @missedPOrVCompNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Personnel or Vehicle Complaint', expression:['Not Overdue']).count
        @missedPOrVCompNWPercentNotOverdue = "#{((@missedPOrVCompNWNotOverdue.to_f.round(2)/@missedPOrVCompNWTotal.to_f.round(2))*100).round(2)}%"
        @missedPOrVCompNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Personnel or Vehicle Complaint', expression:['Not Overdue']).count
        @missedPOrVCompNWOverdueDigits = @missedPOrVCompNWNotOverdue.to_f/@missedPOrVCompNWTotal.to_f
        @missedPOrVCompNWGrade= OpenSr.qualityGrade(@missedPOrVCompNWOverdueDigits)

        @missedPhyChaPikNWTotal = Sr.where(trash_quad: 'NW',sr_type:'Physically Challenged Pickup', expression:['Overdue','Not Overdue']).count
        @missedPhyChaPikNWOverdue = Sr.where(trash_quad: 'NW',sr_type:'Physically Challenged Pickup', expression:['Overdue']).count
        @missedPhyChaPikNWPercentOverdue = "#{((@missedPhyChaPikNWOverdue.to_f.round(2)/@missedPhyChaPikNWTotal.to_f.round(2))*100).round(2)}%"
        @missedPhyChaPikNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Physically Challenged Pickup', expression:['Not Overdue']).count
        @missedPhyChaPikNWPercentNotOverdue = "#{((@missedPhyChaPikNWNotOverdue.to_f.round(2)/@missedPhyChaPikNWTotal.to_f.round(2))*100).round(2)}%"
        @missedPhyChaPikNWNotOverdue = Sr.where(trash_quad: 'NW',sr_type:'Physically Challenged Pickup', expression:['Not Overdue']).count
        @missedPhyChaPikNWOverdueDigits = @missedPhyChaPikNWNotOverdue.to_f/@missedPhyChaPikNWTotal.to_f
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
            'Physically Challenged Pickup']).count
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
            'Physically Challenged Pickup']).count
        @NWQuadPercentOverdue = "#{((@NWQuadSrOverdue.to_f/@NWQuadSrTotal.to_f)*100).round(2)}%"
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
            'Physically Challenged Pickup']).count
        @NWQuadPercentNotOverdue = "#{((@NWQuadSrNotOverdue.to_f/@NWQuadSrTotal.to_f)*100).round(2)}%"
        @NWQuadNotOverdueDigits = @NWQuadSrNotOverdue.to_f/@NWQuadSrTotal.to_f
        @NWQuadQualityGrade = OpenSr.qualityGrade(@NWQuadNotOverdueDigits)
  end

  def test
      render '/open_srs/test.html'
  end

  def test2
      render '/open_srs/test2.html'
  end

  def test3
      render '/open_srs/test3.html'
  end

  def test4
      render '/open_srs/test4.html'
  end

  def test5
      render '/open_srs/test5.html'
  end

  def test6
      render '/open_srs/test6.html'
  end

  def test7
      render '/open_srs/test7.html'
  end

  def test8
      render '/open_srs/test8.html'
  end

  def test9
      render '/open_srs/test9.html'
  end

  def test10
    # binding.pry
    @result10 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['NE_Overdue', 'NW_Overdue', 'SE_Overdue', 'SW_Overdue']).
    order(:sec_name)
  end

  def test11
    @result11 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['NE_Overdue', 'NW_Overdue', 'SE_Overdue', 'SW_Overdue']).
    order(:sec_name)
  end

  def test12
    @result12 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['NE_Overdue', 'NW_Overdue', 'SE_Overdue', 'SW_Overdue']).
    order(:sec_name)
  end

  def test13
    @result13 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['NE_Overdue', 'NW_Overdue', 'SE_Overdue', 'SW_Overdue']).
    order(:sec_name)
  end

  def test14
    @result14 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Heavy Trash Pickup'], quad_statu: ['NE_Overdue', 'NW_Overdue', 'SE_Overdue', 'SW_Overdue']).
    order(:sec_name)
  end

  def test15
    @result15 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Heavy Trash Pickup'], quad_statu: ['NE_Overdue', 'NW_Overdue', 'SE_Overdue', 'SW_Overdue']).
    order(:sec_name)
  end

  def test16
    @result16 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Heavy Trash Pickup'], quad_statu: ['NE_Overdue', 'NW_Overdue', 'SE_Overdue', 'SW_Overdue']).
    order(:sec_name)
  end

  def test17
    @result17 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Heavy Trash Pickup'], quad_statu: ['NE_Overdue', 'NW_Overdue', 'SE_Overdue', 'SW_Overdue']).
    order(:sec_name)
  end

  def test18
    @result18 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['NE_Overdue', 'NW_Overdue', 'SE_Overdue', 'SW_Overdue']).
    order(:sec_name)
  end

  def test19
    @result19 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['NE_Overdue', 'NW_Overdue', 'SE_Overdue', 'SW_Overdue']).
    order(:sec_name)
  end

  def test20
    @result20 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['NE_Overdue', 'NW_Overdue', 'SE_Overdue', 'SW_Overdue']).
    order(:sec_name)
  end

  def test21
    @result21 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['NE_Overdue', 'NW_Overdue', 'SE_Overdue', 'SW_Overdue']).
    order(:sec_name)
  end

  def overdue
     render '/open_srs/overdue.html.erb'
     #execute spatial join of Overdue Cases with Section Name(aka Route Name)
     #execute OpenSr.sr__route method
  end

  def test22
    @result22 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['NE_Overdue', 'NW_Overdue', 'SE_Overdue', 'SW_Overdue']).
    order(:sec_name)
  end

  def test23
    @result23 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['NE_Overdue', 'NW_Overdue', 'SE_Overdue', 'SW_Overdue']).
    order(:sec_name)
  end

  def test24
    @result24 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['NE_Overdue', 'NW_Overdue', 'SE_Overdue', 'SW_Overdue']).
    order(:sec_name)
  end

  def test25
    @result25 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['NE_Overdue', 'NW_Overdue', 'SE_Overdue', 'SW_Overdue']).
    order(:sec_name)
  end

  def test26
    @result26 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['SW_Overdue']).
    order(:sec_name)
  end

  def test27
    @result27 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['SW_Overdue']).
    order(:sec_name)
  end

  def test28
    @result28 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['SW_Overdue']).
    order(:sec_name)
  end

  def test29
    @result29 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Heavy Trash'], quad_statu: ['SW_Overdue']).
    order(:sec_name)
  end
  def test30
    @result30 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['SW_Overdue']).
    order(:sec_name)
  end
  def test31
    @result31 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['SW_Overdue']).
    order(:sec_name)
  end
  def test32
    @result32 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['SW_Overdue']).
    order(:sec_name)
  end
  def test33
    @result33 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Heavy Trash Pickup'], quad_statu: ['SW_Overdue']).
    order(:sec_name)
  end
  def test34
    @result34 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['SW_Overdue']).
    order(:sec_name)
  end
  def test35
    @result35 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['SW_Overdue']).
    order(:sec_name)
  end
  def test36
    @result36 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['SW_Overdue']).
    order(:sec_name)
  end
  def test37
    @result37 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Heavy Trash Pickup'], quad_statu: ['SW_Overdue']).
    order(:sec_name)
  end
  def test38
    @result38 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['SW_Overdue']).
    order(:sec_name)
  end
  def test39
    @result39 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['SW_Overdue']).
    order(:sec_name)
  end
  def test40
    @result40 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['SW_Overdue']).
    order(:sec_name)
  end
  def test41
    @result41 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Heavy Trash Pickup'], quad_statu: ['SW_Overdue']).
    order(:sec_name)
  end
  def test42
    @result42 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['SE_Overdue']).
    order(:sec_name)
  end

  def test43
    @result43 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['SE_Overdue']).
    order(:sec_name)
  end

  def test44
    @result44 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['SE_Overdue']).
    order(:sec_name)
  end

  def test45
    @result45 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Heavy Trash'], quad_statu: ['SE_Overdue']).
    order(:sec_name)
  end
  def test46
    @result46 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['SE_Overdue']).
    order(:sec_name)
  end
  def test47
    @result47 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['SE_Overdue']).
    order(:sec_name)
  end
  def test48
    @result48 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['SE_Overdue']).
    order(:sec_name)
  end
  def test49
    @result49 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Heavy Trash Pickup'], quad_statu: ['SE_Overdue']).
    order(:sec_name)
  end
  def test50
    @result50 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['SE_Overdue']).
    order(:sec_name)
  end
  def test51
    @result51 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['SE_Overdue']).
    order(:sec_name)
  end
  def test52
    @result52 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['SE_Overdue']).
    order(:sec_name)
  end
  def test53
    @result53 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Heavy Trash Pickup'], quad_statu: ['SE_Overdue']).
    order(:sec_name)
  end
  def test54
    @result54 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['SE_Overdue']).
    order(:sec_name)
  end
  def test55
    @result55 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['SE_Overdue']).
    order(:sec_name)
  end
  def test56
    @result56 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['SE_Overdue']).
    order(:sec_name)
  end
  def test57
    @result57 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Heavy Trash Pickup'], quad_statu: ['SE_Overdue']).
    order(:sec_name)
  end
  def test58
    @result58 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['NE_Overdue']).
    order(:sec_name)
  end

  def test59
    @result59 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['NE_Overdue']).
    order(:sec_name)
  end

  def test60
    @result60 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['NE_Overdue']).
    order(:sec_name)
  end

  def test61
    @result61 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Heavy Trash'], quad_statu: ['NE_Overdue']).
    order(:sec_name)
  end
  def test62
    @result62 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['NE_Overdue']).
    order(:sec_name)
  end
  def test63
    @result63 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['NE_Overdue']).
    order(:sec_name)
  end
  def test64
    @result64 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['NE_Overdue']).
    order(:sec_name)
  end
  def test65
    @result65 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Heavy Trash Pickup'], quad_statu: ['NE_Overdue']).
    order(:sec_name)
  end
  def test66
    @result66 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['NE_Overdue']).
    order(:sec_name)
  end
  def test67
    @result67 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['NE_Overdue']).
    order(:sec_name)
  end
  def test68
    @result68 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['NE_Overdue']).
    order(:sec_name)
  end
  def test69
    @result69 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Heavy Trash Pickup'], quad_statu: ['NE_Overdue']).
    order(:sec_name)
  end
  def test70
    @result70 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['NE_Overdue']).
    order(:sec_name)
  end
  def test71
    @result71 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['NE_Overdue']).
    order(:sec_name)
  end
  def test72
    @result72 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['NE_Overdue']).
    order(:sec_name)
  end
  def test73
    @result73 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Heavy Trash Pickup'], quad_statu: ['NE_Overdue']).
    order(:sec_name)
  end
  def test74
    @result74 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['NW_Overdue']).
    order(:sec_name)
  end

  def test75
    @result75 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['NW_Overdue']).
    order(:sec_name)
  end

  def test76
    @result76 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['NW_Overdue']).
    order(:sec_name)
  end

  def test77
    @result77 = OpenSr.where(day: ['MONDAY'], sr_type:['Missed Heavy Trash'], quad_statu: ['NW_Overdue']).
    order(:sec_name)
  end
  def test78
    @result78 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['NW_Overdue']).
    order(:sec_name)
  end
  def test79
    @result79 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['NW_Overdue']).
    order(:sec_name)
  end
  def test80
    @result80 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['NW_Overdue']).
    order(:sec_name)
  end
  def test81
    @result81 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Heavy Trash Pickup'], quad_statu: ['NW_Overdue']).
    order(:sec_name)
  end
  def test82
    @result82 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['NW_Overdue']).
    order(:sec_name)
  end
  def test83
    @result83 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['NW_Overdue']).
    order(:sec_name)
  end
  def test84
    @result84 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['NE_Overdue']).
    order(:sec_name)
  end
  def test85
    @result85 = OpenSr.where(day: ['THURSDAY'], sr_type:['Missed Heavy Trash Pickup'], quad_statu: ['NW_Overdue']).
    order(:sec_name)
  end
  def test86
    @result86 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Garbage Pickup'], quad_statu: ['NW_Overdue']).
    order(:sec_name)
  end
  def test87
    @result87 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['NW_Overdue']).
    order(:sec_name)
  end
  def test89
    @result89 = OpenSr.
    where(day: ['FRIDAY'],
      sr_type:['Missed Yard Waste Pickup'],
      quad_statu: ['NW_Overdue']).
      order(:sec_name)
  end
  def test90
    @result90 = OpenSr.
    where(day: ['FRIDAY'],
      sr_type:['Missed Heavy Trash Pickup'],
      quad_statu: ['NW_Overdue']).
      order(:sec_name)
  end
  def over_30_days_srs

    @cityWideMinus30To0_Over_for_missed_yd =
      Sr.where(department: 'SWM Solid Waste Management',
      status: 'Open', sr_type: 'Missed Yard Waste Pickup',
      overdue: [-30..-0.05]).count

    @cityWide30To60Over_for_missed_yd =
              Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Missed Yard Waste Pickup',
              overdue: [0..60]).count
    @cityWide61To120Over_for_missed_yd =
              Sr.where(department: 'SWM Solid Waste Management',
                status: 'Open', sr_type: 'Missed Yard Waste Pickup',
                overdue: [60..120]).count
    @cityWide121To240Over_for_missed_yd =
            Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Missed Yard Waste Pickup',
              overdue: [120..240]).count
    @cityWide241To375Over_for_missed_yd =
            Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Missed Yard Waste Pickup',
              overdue: [241..375]).count

    @cityWideMinus30To0_Over_for_container_problem =
      Sr.where(department: 'SWM Solid Waste Management',
      status: 'Open', sr_type: 'Container Problem',
      overdue: [-30..-0.05]).count
    @cityWide30To60Over_for_container_problem =
      Sr.where(department: 'SWM Solid Waste Management',
      status: 'Open', sr_type: 'Container Problem',
      overdue: [0..60]).count
    @cityWide61To120Over_for_container_problem =
      Sr.where(department: 'SWM Solid Waste Management',
        status: 'Open', sr_type: 'Container Problem',
        overdue: [60..120]).count
    @cityWide121To240Over_for_container_problem =
    Sr.where(department: 'SWM Solid Waste Management',
      status: 'Open', sr_type: 'Container Problem',
      overdue: [120..240]).count
    @cityWide241To375Over_for_container_problem =
    Sr.where(department: 'SWM Solid Waste Management',
      status: 'Open', sr_type: 'Container Problem',
      overdue: [241..375]).count


      @cityWideMinus30To0_Over_for_missed_garbage =
        Sr.where(department: 'SWM Solid Waste Management',
        status: 'Open', sr_type: 'Missed Garbage Pickup',
        overdue: [-30..-0.05]).count
      @cityWide30To60Over_for_missed_garbage =
        Sr.where(department: 'SWM Solid Waste Management',
        status: 'Open', sr_type: 'Missed Garbage Pickup',
        overdue: [0..60]).count
      @cityWide61To120Over_for_missed_garbage =
        Sr.where(department: 'SWM Solid Waste Management',
          status: 'Open', sr_type: 'Missed Garbage Pickup',
          overdue: [60..120]).count
      @cityWide121To240Over_for_missed_garbage =
      Sr.where(department: 'SWM Solid Waste Management',
        status: 'Open', sr_type: 'Missed Garbage Pickup',
        overdue: [120..240]).count
      @cityWide241To375Over_for_missed_garbage =
      Sr.where(department: 'SWM Solid Waste Management',
        status: 'Open', sr_type: 'Missed Garbage Pickup',
        overdue: [241..375]).count

    @cityWideMinus30To0_Over_for_missed_hvy =
        Sr.where(department: 'SWM Solid Waste Management',
        status: 'Open', sr_type: 'Missed Heavy Trash Pickup',
        overdue: [-30..0.05]).count

      @cityWide30To60Over_for_missed_hvy =
          Sr.where(department: 'SWM Solid Waste Management',
          status: 'Open', sr_type: 'Missed Heavy Trash Pickup',
          overdue: [0..60]).count
      @cityWide61To120Over_for_missed_hvy =
          Sr.where(department: 'SWM Solid Waste Management',
            status: 'Open', sr_type: 'Missed Heavy Trash Pickup',
            overdue: [60..120]).count
      @cityWide121To240Over_for_missed_hvy =
        Sr.where(department: 'SWM Solid Waste Management',
          status: 'Open', sr_type: 'Missed Heavy Trash Pickup',
          overdue: [120..240]).count
      @cityWide241To375Over_for_missed_hvy =
        Sr.where(department: 'SWM Solid Waste Management',
          status: 'Open', sr_type: 'Missed Heavy Trash Pickup',
          overdue: [241..375]).count

      @cityWideMinus30To0_Over_for_missed_recycle_pu =
        Sr.where(department: 'SWM Solid Waste Management',
            status: 'Open', sr_type: 'Missed Recycling Pickup',
            overdue: [-30..-0.05]).count
      @cityWide30To60Over_for_missed_recycle_pu =
              Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Missed Recycling Pickup',
              overdue: [0..60]).count
      @cityWide61To120Over_for_missed_recycle_pu =
              Sr.where(department: 'SWM Solid Waste Management',
                status: 'Open', sr_type: 'Missed Recycling Pickup',
                overdue: [60..120]).count
      @cityWide121To240Over_for_missed_recycle_pu =
            Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Missed Recycling Pickup',
              overdue: [120..240]).count
      @cityWide241To375Over_for_missed_recycle_pu =
            Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Missed Recycling Pickup',
              overdue: [241..375]).count

    @cityWideMinus30To0_Over_for_recycling_o_m =
            Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Recycling Cart Repair or Replace',
              overdue: [-30..-0.05]).count
    @cityWide30To60Over_for_recycling_o_m =
            Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Recycling Cart Repair or Replace',
              overdue: [0..60]).count
    @cityWide61To120Over_for_recycling_o_m =
            Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Recycling Cart Repair or Replace',
              overdue: [60..120]).count
    @cityWide121To240Over_for_recycling_o_m =
            Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Recycling Cart Repair or Replace',
              overdue: [120..240]).count
    @cityWide241To375Over_for_recycling_o_m =
            Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Recycling Cart Repair or Replace',
              overdue: [241..375]).count

    @cityWideMinus30To0_Over_for_recycling_new =
            Sr.where(department: 'SWM Solid Waste Management',
                status: 'Open', sr_type: 'Recycling Participation NEW',
                    overdue: [-30..-0.05]).count
      @cityWide30To60Over_for_recycling_new =
            Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Recycling Participation NEW',
              overdue: [0..60]).count
      @cityWide61To120Over_for_recycling_new =
            Sr.where(department: 'SWM Solid Waste Management',
                status: 'Open', sr_type: 'Recycling Participation NEW',
                overdue: [60..120]).count
      @cityWide121To240Over_for_recycling_new =
            Sr.where(department: 'SWM Solid Waste Management',
                status: 'Open', sr_type: 'Recycling Participation NEW',
                overdue: [120..240]).count
      @cityWide241To375Over_for_recycling_new =
            Sr.where(department: 'SWM Solid Waste Management',
                status: 'Open', sr_type: 'Recycling Participation NEW',
                overdue: [241..375]).count

      @cityWideMinus30To0_Over_for_add_a_can =
            Sr.where(department: 'SWM Solid Waste Management',
                status: 'Open', sr_type: 'Add A Can',
                overdue: [-30..-0.05]).count
      @cityWide30To60Over_for_add_a_can =
            Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Add A Can',
              overdue: [0..60]).count
      @cityWide61To120Over_for_add_a_can =
          Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Add A Can',
              overdue: [60..120]).count
      @cityWide121To240Over_for_add_a_can =
            Sr.where(department: 'SWM Solid Waste Management',
                status: 'Open', sr_type: 'Add A Can',
                overdue: [120..240]).count
      @cityWide241To375Over_for_add_a_can =
            Sr.where(department: 'SWM Solid Waste Management',
                status: 'Open', sr_type: 'Add A Can',
                overdue: [241..375]).count

    @cityWideMinus30To0_Over_for_dead_animal_pu =
          Sr.where(department: 'SWM Solid Waste Management',
            status: 'Open', sr_type: 'Dead Animal Collection',
            overdue: [-30..-0.05]).count

    @cityWide30To60Over_for_dead_animal_pu =
          Sr.where(department: 'SWM Solid Waste Management',
            status: 'Open', sr_type: 'Dead Animal Collection',
            overdue: [0..60]).count
    @cityWide61To120Over_for_dead_animal_pu =
          Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Dead Animal Collection',
              overdue: [60..120]).count
    @cityWide121To240Over_for_dead_animal_pu =
          Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Dead Animal Collection',
              overdue: [120..240]).count
    @cityWide241To375Over_for_dead_animal_pu =
          Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Dead Animal Collection',
              overdue: [241..375]).count


    @cityWideMinus30To0_Over_for_dumpster_complaint =
      Sr.where(department: 'SWM Solid Waste Management',
          status: 'Open', sr_type: 'Dumpster Complaint',
          overdue: [-30..-0.05]).count
    @cityWide30To60Over_for_dumpster_complaint =
          Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Dumpster Complaint',
              overdue: [0..60]).count
    @cityWide61To120Over_for_dumpster_complaint =
          Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Dumpster Complaint',
              overdue: [60..120]).count
    @cityWide121To240Over_for_dumpster_complaint =
          Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Dumpster Complaint',
              overdue: [120..240]).count
    @cityWide241To375Over_for_dumpster_complaint =
          Sr.where(department: 'SWM Solid Waste Management',
              status: 'Open', sr_type: 'Dumpster Complaint',
              overdue: [241..375]).count

  @cityWideMinus30To0_Over_for_vehicle_complaint =
  Sr.where(department: 'SWM Solid Waste Management',
      status: 'Open', sr_type: 'Personnel or Vehicle Complaint',
      overdue: [-30..-0.05]).count
  @cityWide30To60Over_for_vehicle_complaint =
        Sr.where(department: 'SWM Solid Waste Management',
            status: 'Open', sr_type: 'Personnel or Vehicle Complaint',
            overdue: [0..60]).count
  @cityWide61To120Over_for_vehicle_complaint =
      Sr.where(department: 'SWM Solid Waste Management',
            status: 'Open', sr_type: 'Personnel or Vehicle Complaint',
            overdue: [60..120]).count
  @cityWide121To240Over_for_vehicle_complaint =
      Sr.where(department: 'SWM Solid Waste Management',
        status: 'Open',
        sr_type: 'Personnel or Vehicle Complaint',
        overdue: [120..240]).count
  @cityWide241To375Over_for_vehicle_complaint =
      Sr.where(department: 'SWM Solid Waste Management',
        status: 'Open',
        sr_type: 'Personnel or Vehicle Complaint',
        overdue: [241..375]).count

  @cityWideMinus30To0_Over_for_prop_damage =
    Sr.where(department: 'SWM Solid Waste Management',
      status: 'Open',
      sr_type: 'Property Damage',
      overdue: [-30..-0.05]).count
  @cityWide30To60Over_for_prop_damage =
      Sr.where(department: 'SWM Solid Waste Management',
        status: 'Open',
        sr_type: 'Property Damage',
        overdue: [0..60]).count
  @cityWide61To120Over_for_prop_damage =
      Sr.where(department: 'SWM Solid Waste Management',
        status: 'Open',
        sr_type: 'Property Damage',
        overdue: [60..120]).count
  @cityWide121To240Over_for_prop_damage =
      Sr.where(department: 'SWM Solid Waste Management',
        status: 'Open',
        sr_type: 'Property Damage',
        overdue: [120..240]).count
  @cityWide241To375Over_for_prop_damage =
      Sr.where(department: 'SWM Solid Waste Management',
        status: 'Open',
        sr_type: 'Property Damage',
        overdue: [241..375]).count

  @cityWideMinus30To0_Over_for_dump_site =
      Sr.where(department: 'SWM Solid Waste Management',
        status: 'Open',
        sr_type: 'Trash Dumping or Illegal Dumpsite',
        overdue: [-30..-0.05]).count
  @cityWide30To60Over_for_dump_site =
      Sr.where(department: 'SWM Solid Waste Management',
        status: 'Open',
        sr_type: 'Trash Dumping or Illegal Dumpsite',
        overdue: [0..60]).count
  @cityWide61To120Over_for_dump_site =
      Sr.where(department: 'SWM Solid Waste Management',
        status: 'Open',
        sr_type: 'Trash Dumping or Illegal Dumpsite',
        overdue: [60..120]).count
  @cityWide121To240Over_for_dump_site =
      Sr.where(department: 'SWM Solid Waste Management',
        status: 'Open',
        sr_type: 'Trash Dumping or Illegal Dumpsite',
        overdue: [120..240]).count
  @cityWide241To375Over_for_dump_site =
      Sr.where(department: 'SWM Solid Waste Management',
        status: 'Open',
        sr_type: 'Trash Dumping or Illegal Dumpsite',
        overdue: [241..375]).count

@cityWideMinus30To0_Over_for_SWM_Information =
  Sr.where(department: 'SWM Solid Waste Management',
    status: 'Open',
    sr_type: 'SWM Information',
    overdue: [-30..-0.05]).count
@cityWide30To60Over_for_SWM_Information =
    Sr.where(department: 'SWM Solid Waste Management',
      status: 'Open',
      sr_type: 'SWM Information',
      overdue: [0..60]).count
@cityWide61To120Over_for_SWM_Information =
    Sr.where(department: 'SWM Solid Waste Management',
      status: 'Open',
      sr_type: 'SWM Information',
      overdue: [60..120]).count
@cityWide121To240Over_for_SWM_Information =
    Sr.where(department: 'SWM Solid Waste Management',
      status: 'Open',
      sr_type: 'SWM Information',
      overdue: [120..240]).count
@cityWide241To375Over_for_SWM_Information =
    Sr.where(department: 'SWM Solid Waste Management',
      status: 'Open',
      sr_type: 'SWM Information',
      overdue: [241..375]).count
  end

end

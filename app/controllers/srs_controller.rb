class SrsController < ApplicationController
  def districtASrs
    @July2019_containers_related_a = Sr.july_2019_containers_related_a
    @August2019_containers_related_a = Sr.august_2019_containers_related_a
    @Sept_2019_containers_related_a = Sr.sept_2019_containers_related_a
    @Oct_2019_containers_related_a = Sr.oct_2019_containers_related_a
    @Nov_2019_containers_related_a = Sr.nov_2019_containers_related_a
    @Dec_2019_containers_related_a = Sr.dec_2019_containers_related_a
    @jan_2020_containers_related_a = Sr.jan_2020_containers_related_a
    @feb_2020_containers_related_a = Sr.feb_2020_containers_related_a
    @mar_2020_containers_related_a = Sr.mar_2020_containers_related_a
    @apr_2020_containers_related_a= Sr.april_2020_containers_related_a
    @may_2020_containers_related_a= Sr.may_2020_containers_related_a
    @jun_2020_containers_related_a= Sr.june_2020_containers_related_a
    @fy_2021_containers_related_a= Sr.fy_2021_containers_related_a
    @total_containers_related_a =  Sr.total_containers_related_a

    @Jul_2019_missed_garbage_a = Sr.july_2019_missed_garbage_a
    @Aug_2019_missed_garbage_a = Sr.august_2019_missed_garbage_a
    @Sept_2019_missed_garbage_a = Sr.sept_2019_missed_garbage_a
    @Oct_2019_missed_garbage_a = Sr.oct_2019_missed_garbage_a
    @Nov_2019_missed_garbage_a = Sr.nov_2019_missed_garbage_a
    @Dec_2019_missed_garbage_a = Sr.dec_2019_missed_garbage_a
    @jan_2020_missed_garbage_a = Sr.jan_2020_missed_garbage_a
    @feb_2020_missed_garbage_a = Sr.feb_2020_missed_garbage_a
    @mar_2020_missed_garbage_a = Sr.mar_2020_missed_garbage_a
    @apr_2020_missed_garbage_a= Sr.april_2020_missed_garbage_a
    @may_2020_missed_garbage_a= Sr.may_2020_missed_garbage_a
    @jun_2020_missed_garbage_a= Sr.june_2020_missed_garbage_a
    @fy_2021_missed_garbage_a= Sr.fy_2021_missed_garbage_a
    @total_missed_garbage_a= Sr.total_missed_garbage_a

    @Jul_2019_missed_hvy_a = Sr.july_2019_missed_hvy_a
    @Aug_2019_missed_hvy_a = Sr.august_2019_missed_hvy_a
    @Sept_2019_missed_hvy_a = Sr.sept_2019_missed_hvy_a
    @Oct_2019_missed_hvy_a = Sr.oct_2019_missed_hvy_a
    @Nov_2019_missed_hvy_a = Sr.nov_2019_missed_hvy_a
    @Dec_2019_missed_hvy_a = Sr.dec_2019_missed_hvy_a
    @jan_2020_missed_hvy_a = Sr.jan_2020_missed_hvy_a
    @feb_2020_missed_hvy_a = Sr.feb_2020_missed_hvy_a
    @mar_2020_missed_hvy_a = Sr.mar_2020_missed_hvy_a
    @apr_2020_missed_hvy_a= Sr.april_2020_missed_hvy_a
    @may_2020_missed_hvy_a= Sr.may_2020_missed_hvy_a
    @jun_2020_missed_hvy_a= Sr.june_2020_missed_hvy_a
    @fy_2021_missed_hvy_a= Sr.fy_2021_missed_hvy_a
    @total_missed_hvy_a= Sr.total_missed_hvy_a

    @Jul_2019_missed_rec_a = Sr.july_2019_missed_rec_a
    @Aug_2019_missed_rec_a = Sr.august_2019_missed_rec_a
    @Sept_2019_missed_rec_a = Sr.sept_2019_missed_rec_a
    @Oct_2019_missed_rec_a = Sr.oct_2019_missed_rec_a
    @Nov_2019_missed_rec_a = Sr.nov_2019_missed_rec_a
    @Dec_2019_missed_rec_a = Sr.dec_2019_missed_rec_a
    @jan_2020_missed_rec_a = Sr.jan_2020_missed_rec_a
    @feb_2020_missed_rec_a = Sr.feb_2020_missed_rec_a
    @mar_2020_missed_rec_a = Sr.mar_2020_missed_rec_a
    @apr_2020_missed_rec_a= Sr.april_2020_missed_rec_a
    @may_2020_missed_rec_a= Sr.may_2020_missed_rec_a
    @jun_2020_missed_rec_a= Sr.june_2020_missed_rec_a
    @fy_2021_missed_rec_a= Sr.fy_2021_missed_rec_a
    @total_missed_rec_a= Sr.total_missed_rec_a

    @Jul_2019_missed_yar_a = Sr.july_2019_missed_yar_a
    @Aug_2019_missed_yar_a = Sr.august_2019_missed_yar_a
    @Sept_2019_missed_yar_a = Sr.sept_2019_missed_yar_a
    @Oct_2019_missed_yar_a = Sr.oct_2019_missed_yar_a
    @Nov_2019_missed_yar_a = Sr.nov_2019_missed_yar_a
    @Dec_2019_missed_yar_a = Sr.dec_2019_missed_yar_a
    @jan_2020_missed_yar_a = Sr.jan_2020_missed_yar_a
    @feb_2020_missed_yar_a = Sr.feb_2020_missed_yar_a
    @mar_2020_missed_yar_a = Sr.mar_2020_missed_yar_a
    @apr_2020_missed_yar_a= Sr.april_2020_missed_yar_a
    @may_2020_missed_yar_a= Sr.may_2020_missed_yar_a
    @jun_2020_missed_yar_a= Sr.june_2020_missed_yar_a
    @fy_2021_missed_yar_a= Sr.fy_2021_missed_yar_a
    @total_missed_yar_a= Sr.total_missed_yar_a
    # Sr.missed_sr_related_pivot_FY20_district_A
    # Sr.missed_sr_related_pivot_FY20_district_B
    # Sr.missed_sr_related_pivot_FY20_district_C
    # Sr.missed_sr_related_pivot_FY20_district_D
    # Sr.missed_sr_related_pivot_FY20_district_E
    # Sr.missed_sr_related_pivot_FY20_district_F
    # Sr.missed_sr_related_pivot_FY20_district_G
    # Sr.missed_sr_related_pivot_FY20_district_H
    # Sr.missed_sr_related_pivot_FY20_district_I
    # Sr.missed_sr_related_pivot_FY20_district_J
    # Sr.missed_sr_related_pivot_FY20_district_K

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

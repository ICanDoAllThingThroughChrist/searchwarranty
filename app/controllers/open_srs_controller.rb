class OpenSrsController < ApplicationController
    def summary1
    @North = Sr.where(status: 'Open', trash_quad:['NW','NE'],sr_type: ['Missed Heavy Trash Pickup','Container Problem','New Resident Container','Recycling Participation NEW' ,'Recycling Cart Repair or Replace','SWM Escalation','Missed Garbage Pickup','Trash Dumping or Illegal Dumpsite', 'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection', 'Add A Can CANCELLATION', 'Missed Recycling Pickup', 'Personnel or Vehicle Complaint','Physically Challenged Pickup']).count
    @South = Sr.where(status: 'Open', trash_quad:['SW','SE'],sr_type: ['Missed Heavy Trash Pickup','Container Problem','New Resident Container','Recycling Participation NEW' ,'Recycling Cart Repair or Replace','SWM Escalation','Missed Garbage Pickup','Trash Dumping or Illegal Dumpsite', 'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection', 'Add A Can CANCELLATION', 'Missed Recycling Pickup', 'Personnel or Vehicle Complaint','Physically Challenged Pickup']).count
    @NorthOverdue=  Sr.where(trash_quad: ['NE','NW'], expression: 'Overdue',sr_type: ['Missed Heavy Trash Pickup','Container Problem','New Resident Container','Recycling Participation NEW' ,'Recycling Cart Repair or Replace','SWM Escalation','Missed Garbage Pickup','Trash Dumping or Illegal Dumpsite', 'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection', 'Add A Can CANCELLATION', 'Missed Recycling Pickup', 'Personnel or Vehicle Complaint','Physically Challenged Pickup']).count
    @NorthNotOverdue=  Sr.where(trash_quad: ['NE','NW'], expression: 'Not Overdue',sr_type: ['Missed Heavy Trash Pickup','Container Problem','New Resident Container','Recycling Participation NEW' ,'Recycling Cart Repair or Replace','SWM Escalation','Missed Garbage Pickup','Trash Dumping or Illegal Dumpsite', 'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection', 'Add A Can CANCELLATION', 'Missed Recycling Pickup', 'Personnel or Vehicle Complaint','Physically Challenged Pickup']).count
    @SouthOverdue=  Sr.where(status: 'Open', trash_quad: ['SE','SW'], expression: 'Overdue',sr_type: ['Missed Heavy Trash Pickup','Container Problem','New Resident Container','Recycling Participation NEW' ,'Recycling Cart Repair or Replace','SWM Escalation','Missed Garbage Pickup','Trash Dumping or Illegal Dumpsite', 'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection', 'Add A Can CANCELLATION', 'Missed Recycling Pickup', 'Personnel or Vehicle Complaint','Physically Challenged Pickup']).count
    @SouthNotOverdue=Sr.where(status: 'Open', trash_quad: ['SW','SE'], expression: 'Not Overdue',sr_type: ['Missed Heavy Trash Pickup','Container Problem','New Resident Container','Recycling Participation NEW' ,'Recycling Cart Repair or Replace','SWM Escalation','Missed Garbage Pickup ','Trash Dumping or Illegal Dumpsite', 'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection', 'Add A Can CANCELLATION', 'Missed Recycling Pickup', 'Personnel or Vehicle Complaint','Physically Challenged Pickup']).count
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
    # binding.pry
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
    @result89 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['NW_Overdue']).
    order(:sec_name)
  end
  def test90
    @result90 = OpenSr.where(day: ['FRIDAY'], sr_type:['Missed Heavy Trash Pickup'], quad_statu: ['NW_Overdue']).
    order(:sec_name)
  end

end

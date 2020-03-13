class OpenSrsController < ApplicationController
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
    @result35 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Recycling Pickup'], quad_statu: ['SW_Overdue']).
    order(:sec_name)
  end
  def test36
    @result36 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Yard Waste Pickup'], quad_statu: ['SW_Overdue']).
    order(:sec_name)
  end
  def test37
    @result37 = OpenSr.where(day: ['TUESDAY'], sr_type:['Missed Heavy Trash Pickup'], quad_statu: ['SW_Overdue']).
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



end

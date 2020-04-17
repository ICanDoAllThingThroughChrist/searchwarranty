class Sr < ApplicationRecord
      def self.sWM_call_volume_2017_2020
        start_date = Date.parse('01-01-2017')
        end_date = DateTime.now
        Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
           start_date, end_date).
           where(department: 'SWM Solid Waste Management').count
      end
      def self.trash_quad_nil_resolution_from_garbage_route
        array1 = Sr.where(department: 'SWM Solid Waste Management',
          status: 'Open', trash_quad: [nil, ""])
        array1.each{|sr|
            # counter = 0
          # while counter < array1.count
          #     binding.pry
            if /[n..N]E/.match?(sr['garbage_route']) ||
               /[n..N]E/.match?(sr['recycle_route']) ||
                sr['sr_owner'] == "Jacqueline Howard" ||
                 sr['sr_owner'] == "Dee Fields" ||
                  /[n..N]E/.match?(sr['heavy_trash_quad']) ||
                  sr['sr_creator'] == "Jacqueline Howard" ||
                   sr['sr_creator'] == "Dee Fields"
              sr['trash_quad'] = "NE"
              # bindining.pry
              sr.save
            elsif /[n..N]W/.match?(sr['garbage_route']) ||
               /[n..N]W/.match?(sr['recycle_route']) ||
                sr['sr_owner'] == "Julane Curry" ||
                 /[n..N]W/.match?(sr['heavy_trash_quad'])
                sr['trash_quad'] = "NW"
                # bindining.pry
                sr.save
            elsif /[s..S]W/.match?(sr['garbage_route']) ||
               /[s..S]W/.match?(sr['recycle_route']) ||
                sr['sr_owner'] == "Racheal Manning" ||
                 /[s..S]W/.match?(sr['heavy_trash_quad'])
                sr['trash_quad'] = "SW"
                # bindining.pry
                sr.save
            elsif /[s..S]E/.match?(sr['garbage_route']) ||
                /[s..S]E/.match?(sr['recycle_route']) ||
                 sr['sr_owner'] == "Yvonne Guillory" ||
                  /[s..S]E/.match?(sr['heavy_trash_quad'])
                sr['trash_quad'] = "SE"
                # bindining.pry
                sr.save
            elsif sr['garbage_route'] == nil
              puts "#{sr['garbage_route']}"
                # bindining.pry
                # sr.save
            else
              puts "#{sr['garbage_route']}"
            end
        }
      end

      def self.open_sla_over_30_days
        sla_over_30_list = Sr.
        where(department: 'SWM Solid Waste Management',
          status: 'Open',
          sr_type: ['Missed Garbage Pickup','Missed Heavy Trash Pickup',
            'Missed Recycling Pickup','Missed Yard Waste Pickup'],
            overdue: [0..374])
      end

      def self.update_trash_quad_v2
        trash_quad_nil_list =
        Sr.where(department: 'SWM Solid Waste Management',
          status: ['Open', 'Closed'],trash_quad:[nil,""])
        queue_list_value =
        Sr.where(department: 'SWM Solid Waste Management').
        distinct.pluck(:queue)
        trash_quad_nil_list.each_with_index{|item, index|
          # binding.pry
          if item['queue'] == "SWM_RecyclingNW" ||
            item['queue'] =="SWM_CollectionsNW"
            item['trash_quad'] = "NW"
            item.save
          elsif
            item['queue'] == "SWM_RecyclingSW" ||
            item['queue'] =="SWM_CollectionsSW"
            item['trash_quad'] = "SW"
            item.save
          elsif
            item['queue'] == "SWM_CollectionsSE" ||
            item['queue'] == "SWM_RecyclingSE"
            item['trash_quad'] = "SE"
            item.save
          elsif
            item['queue'] == "SWM_RecyclingNE" ||
            item['queue'] == "SWM_CollectionsNE"
            item['trash_quad'] = "NE"
            item.save
          else
            puts "#{item}"
          end
          # binding.pry
        }
      end
    def self.update_trash_quad
      Spatial.seed
      array = Sr.where(department:'SWM Solid Waste Management',
        status: 'Open',
        trash_quad:['Unknown',nil,""])
      array.each{|sr|
        quad = Spatial.where(id:"#{sr.id}").pluck(:quad)
        # binding.pry
          sr.trash_quad = quad[0]
          sr.garbage_quad = quad[0]
          sr.save
      }
    end
    def self.missed_hvy_trash_list
      headers = %w[id case_number district sr_location
         latitude longitude]
      CSV.open("hvy_trash.csv", "wb",
        write_headers: true, headers: headers) { |csv|
          Sr.where(department: 'SWM Solid Waste Management',
            status: 'Open',
            sr_type: ['Missed Heavy Trash Pickup']).
          pluck(:id, :case_number, :district,
            :sr_location, :latitude,
            :longitude).
            each { |row|
              csv << row
            }
          }
    end
    def self.no_quad_list
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
      CSV.open("NoQuadList.csv", "wb",
        write_headers: true, headers: headers) { |csv|
          Sr.where(department: 'SWM Solid Waste Management',
            status: 'Open',
            trash_quad: ['Unknown',nil, ""]).
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

    def self.pivot
      Sr.sla_nil_resolution
      Sr.update_trash_quad_v2
      Sr.trash_quad_nil_resolution_from_garbage_route
      Sr.update_trash_quad
      Sr.expression_quad_status_assignment
      Sr.no_quad_list
      binding.pry
      #spatial join based on the generated csv
      # #perform Spatial Join on "NoQuadList.csv"
      Sr.update_trash_quad
      Sr.expression_quad_status_assignment
      #perform following command to determine if sr_type includes missed garbage
      binding.pry
      Sr.where(trash_quad: ['Unknown',nil, ""],
         status: 'Open',
          department:'SWM Solid Waste Management').distinct.pluck(:sr_type)
      #repeated following command if sr_type includes missed garbage
      #repeatt command to see if sr contains lat, lon,  x, y,
      Sr.no_quad_list #repeat this command  to perform spatial join
      #perform following
      Sr.
      where(trash_quad: ['Unknown',nil, ""], status: 'Open',
         department:'SWM Solid Waste Management').count
      Sr.where(trash_quad: ['Unknown',nil, ""], status: 'Open',
            department:'SWM Solid Waste Management',
            sr_type:['Missed Garbage Pickup']).distinct.pluck(:id)
      # Spatial.find(:19342615)#can  not find  it in Spatial Join
      Sr.update_trash_quad
      Sr.expression_quad_status_assignment
      #
      #repeat spatialjoin
      Sr.html_pivot
      Sr.no_quad_list
      #perform spatial join of Open Sr Testing.csv with Houston Automated
      # Open.sr_route
    end

    def self.update_sr_location_for_open_sr
      array = Sr.where(status:'Open', department: 'SWM Solid Waste Management')
      array.each {|e|
        if e['sr_location'] != nil
          e['sr_location'] = e['sr_location'].split(",").join(" ")
          e.save
        else
          puts "#{e}"
        end
      }
    end

    def self.html_pivot
      headers = %w[id case_number sr_location county district
        neighborhood tax_id trash_quad recycle_quad trash_day
        heavy_trash_day recycle_day key_map management_district
        department division sr_type queue sla status sr_create_date
        due_date date_closed overdue title x y latitude longitude
        channel_type created_at updated_at field1 field2 client
        garbage_route heavy_trash_quad sr_owner sr_creator resolve_days
        street_num client_street city state zip phone_number
        email_address garbage_day1 garbage_quad recycle_day1
        recycle_route resolution_time expression ne_overdue
        ne_not_overdue ne_sr_total nw_overdue nw_not_overdue
        nw_sr_total se_overdue se_not_overdue se_sr_total
        sw_overdue sw_not_overdue sw_sr_total quad_status tally]
      CSV.open("testing.csv", "wb", write_headers: true, headers: headers) { |csv|
         Sr.where(status: "Open", department: 'SWM Solid Waste Management').
         pluck(:id, :case_number, :sr_location, :county, :district,
            :neighborhood, :tax_id, :trash_quad, :recycle_quad,
            :trash_day, :heavy_trash_day, :recycle_day, :key_map,
            :management_district, :department, :division, :sr_type,
            :queue, :sla, :status, :sr_create_date, :due_date,
            :date_closed, :overdue, :title, :x, :y, :latitude,
            :longitude, :channel_type, :created_at, :updated_at,
            :field1, :field2, :client, :garbage_route, :heavy_trash_quad,
            :sr_owner, :sr_creator, :resolve_days, :street_num,
            :client_street, :city, :state, :zip, :phone_number,
            :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
            :recycle_route, :resolution_time, :expression, :ne_overdue,
            :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
            :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
            :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status,
            :tally).each { |row| csv << row
            }
          }
      sales = Daru::DataFrame.from_csv '../searchwarranty/testing.csv'
      list = sales.pivot_table(index:['sr_type'],
        values:'tally', vectors:['trash_quad','expression'],
        agg:  :sum)
      File.open('../searchwarranty/app/views/srs/test.html.erb',
        'w+'){|f| f << list.to_html}
      File.open('../searchwarranty/app/views/srs/test.html',
        'w+'){|f| f << list.to_html}
      #august-aug_2019_end_date
    end
    def self.add_tally
      open_quad = Sr.where(:status => 'Open')
      open_quad.each {|sr|
        sr.tally = 1
        sr.save
      }
    end
    def self.sla_nil_resolution
      nil_quad = Sr.where(:status => 'Open', sla: ['Unknown',nil, ""])
      nil_quad.each{|sr|
        if sr.sr_type == 'Missed Garbage Pickup'
          sr.sla = 4
          sr.overdue = (sr.created_at - DateTime.now)/(60*60*24) +
          sr.sla
          sr.save
        elsif sr.sr_type == 'Missed Yard Waste Pickup'
          sr.sla = 6
          sr.overdue = (sr.created_at - DateTime.now)/(60*60*24) +
          sr.sla
          sr.save
        elsif sr.sr_type == 'Missed Heavy Trash Pickup'
          sr.sla = 7
          sr.overdue = (sr.created_at - DateTime.now)/(60*60*24) +
          sr.sla
          sr.save
        elsif sr.sr_type == 'Dead Animal Collection'
          sr.sla = 4
          sr.overdue = (sr.created_at - DateTime.now)/(60*60*24) +
          sr.sla
          sr.save
        elsif sr.sr_type == 'Missed Recycling Pickup'
          sr.sla = 4
          sr.overdue = (sr.created_at - DateTime.now)/(60*60*24) +
          sr.sla
          sr.save
        elsif sr.sr_type == 'Container Problem'
          sr.sla = 10
          sr.overdue = (sr.created_at - DateTime.now)/(60*60*24) +
          sr.sla
          sr.save
        # elsif sr.sr_type == 'SWM_MissComplaint'
        #   sr.sla = 300
        #   sr.overdue = (sr.created_at - DateTime.now)/(60*60*24) + sr.sla
        else
          puts "#{sr}"
        end
        }
    end
  def self.sr_count
  open_sr = Sr.where(:department=> "SWM Solid Waste Management",
     :status => "Open")
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
  def self.expression_quad_status_assignment
    overdue_open_srs = Sr.where(:overdue => 0..400,
      :department => 'SWM Solid Waste Management',
      :status => 'Open').count
    overdue_open_srs.each{|sr|
      if sr.department == 'SWM Solid Waste Management' &&
        sr.trash_quad == 'NE'
        then
          sr.expression = "Overdue"
          sr.quad_status = "NE_Overdue"
          sr.tally = 1
          sr.save
      elsif sr.department == 'SWM Solid Waste Management' &&
        sr.trash_quad == 'NW'
        then
          sr.expression = "Overdue"
          sr.quad_status = "NW_Overdue"
          sr.tally = 1
          sr.save
      elsif sr.department == 'SWM Solid Waste Management' &&
        sr.trash_quad == 'SW'
        then
          sr.expression = "Overdue"
          sr.quad_status = "SW_Overdue"
          sr.tally = 1
          sr.save
      elsif sr.department == 'SWM Solid Waste Management' &&
        sr.trash_quad == 'SE'
        then
          sr.expression = "Overdue"
          sr.quad_status = "SE_Overdue"
          sr.tally = 1
          sr.save
      else
        puts "#{sr}"
      end
      }
    not_overdue_open_srs =
    Sr.where(:overdue => -400..-0.01,
      :department => 'SWM Solid Waste Management',
      :status => 'Open')
    not_overdue_open_srs.each{|sr|
      if sr.department == 'SWM Solid Waste Management' &&
        sr.trash_quad == 'NE'
      then
        sr.expression = "Not Overdue"
        sr.quad_status = 'NE_Not_Overdue'
        sr.tally = 1
        sr.save
      elsif sr.department == 'SWM Solid Waste Management' &&
        sr.trash_quad == 'NW'
      then
        sr.expression = "Not Overdue"
        sr.quad_status = 'NW_Not_Overdue'
        sr.tally = 1
        sr.save
      elsif sr.department == 'SWM Solid Waste Management' &&
        sr.trash_quad == 'SW'
      then
        sr.expression = "Not Overdue"
        sr.quad_status = 'SW_Not_Overdue'
        sr.tally = 1
        sr.save
      elsif sr.department == 'SWM Solid Waste Management' &&
        sr.trash_quad == 'SE'
      then
        sr.expression = "Not Overdue"
        sr.quad_status = 'SE_Not_Overdue'
        sr.tally = 1
        sr.save
      else
        puts "#{sr}"
      end
    }
    # open_srs =
    # Sr.where(:overdue => -400..400,
    #   :department => 'SWM Solid Waste Management',
    #   :status => 'Open')
    # open_srs
  end

  def self.grade(g)
    if g >= 0.9
      g = 'A'
    elsif g >= 0.8
      g = 'B'
    elsif g >= 0.7
      g = 'C'
    else
      g = 'F'
    end
      return "#{g}"
    # binding.pry
  end

  def self.aug_2019_historical_grade
    deptSWwide_aug_2019_sla_due_cases = Sr.between_fields('2019-08-01 00:00:00',
       :sr_create_date, :date_closed).
    where(department: 'SWM Solid Waste Management', trash_quad: 'SW',
       sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
           'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
             'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
               'Add A Can CANCELLATION', 'Missed Recycling Pickup',
                'Personnel or Vehicle Complaint',
                 'Physically Challenged Pickup']).count

    deptSWwide_aug_2019_actual__due_and_closed_cases = Sr.
    between_fields('2019-08-01 00:00:00', :due_date, :date_closed).
    where(department: 'SWM Solid Waste Management', status: 'Closed',
       trash_quad: 'SW', sr_type: ['Missed Heavy Trash Pickup',
          'Container Problem', 'New Resident Container',
           'Recycling Participation NEW', 'Recycling Cart Repair or Replace',
            'SWM Escalation', 'Missed Garbage Pickup',
             'Trash Dumping or Illegal Dumpsite', 'Add A Can',
              'Storm Debris Collection', 'Dead Animal Collection',
               'Add A Can CANCELLATION', 'Missed Recycling Pickup',
                'Personnel or Vehicle Complaint',
                 'Physically Challenged Pickup']).count

    deptSWwide_aug_2019_sla_percent_complete =
    deptSWwide_aug_2019_actual__due_and_closed_cases.
    to_f.round(2)/deptSWwide_aug_2019_sla_due_cases.to_f.round(2)

    self.grade(deptSWwide_aug_2019_sla_percent_complete)
    @sw_grade_aug_2019 = self.grade(deptSWwide_aug_2019_sla_percent_complete)
    binding.pry
    deptSEwide_aug_2019_sla_due_cases = Sr.
    between_fields('2019-08-01 00:00:00', :sr_create_date,
       :date_closed).
       where(department: 'SWM Solid Waste Management',
         trash_quad: 'SE', sr_type: ['Missed Heavy Trash Pickup',
            'Container Problem', 'New Resident Container',
            'Recycling Participation NEW', 'Recycling Cart Repair or Replace',
            'SWM Escalation', 'Missed Garbage Pickup',
            'Trash Dumping or Illegal Dumpsite', 'Add A Can',
            'Storm Debris Collection', 'Dead Animal Collection',
            'Add A Can CANCELLATION', 'Missed Recycling Pickup',
            'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup']).count
    deptSEwide_aug_2019_actual__due_and_closed_cases = Sr.
    between_fields('2019-08-01 00:00:00', :due_date, :date_closed).
    where(department: 'SWM Solid Waste Management', trash_quad: 'SE',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
        'New Resident Container', 'Recycling Participation NEW',
        'Recycling Cart Repair or Replace', 'SWM Escalation',
        'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint',
        'Physically Challenged Pickup']).count
    deptSEwide_aug_2019_sla_percent_complete =
    deptSEwide_aug_2019_actual__due_and_closed_cases.
    to_f.round(2)/deptSEwide_aug_2019_sla_due_cases.to_f.round(2)
    @se_grade_aug_2019= self.grade(deptSEwide_aug_2019_sla_percent_complete)
    binding.pry
    deptNEwide_aug_2019_sla_due_cases = Sr.
    between_fields('2019-08-01 00:00:00', :sr_create_date, :date_closed).
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
    deptNEwide_aug_2019_actual__due_and_closed_cases = Sr.
    between_fields('2019-08-01 00:00:00', :due_date, :date_closed).
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
    deptNEwide_aug_2019_sla_percent_complete =
    deptNEwide_aug_2019_actual__due_and_closed_cases.
    to_f.round(2)/deptNEwide_aug_2019_sla_due_cases.to_f.round(2)
    @ne_grade_aug_2019 = self.grade(deptNEwide_aug_2019_sla_percent_complete)
    binding.pry
    deptNWwide_aug_2019_sla_due_cases = Sr.between_fields('2019-08-01 00:00:00',
      :sr_create_date, :date_closed).
      where(department: 'SWM Solid Waste Management',
        trash_quad: 'NW', sr_type: ['Missed Heavy Trash Pickup',
          'Container Problem', 'New Resident Container',
          'Recycling Participation NEW', 'Recycling Cart Repair or Replace',
          'SWM Escalation', 'Missed Garbage Pickup',
          'Trash Dumping or Illegal Dumpsite', 'Add A Can',
          'Storm Debris Collection', 'Dead Animal Collection',
          'Add A Can CANCELLATION', 'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint',
          'Physically Challenged Pickup']).count
    deptNWwide_aug_2019_actual__due_and_closed_cases = Sr.
    between_fields('2019-08-01 00:00:00', :due_date, :date_closed).
    where(department: 'SWM Solid Waste Management',
      trash_quad: 'NW',
      sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
        'New Resident Container', 'Recycling Participation NEW',
        'Recycling Cart Repair or Replace', 'SWM Escalation',
        'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
        'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
        'Add A Can CANCELLATION', 'Missed Recycling Pickup',
        'Personnel or Vehicle Complaint',
        'Physically Challenged Pickup']).count
    deptNWwide_aug_2019_sla_percent_complete =
    deptNWwide_aug_2019_actual__due_and_closed_cases.
    to_f.round(2)/deptNWwide_aug_2019_sla_due_cases.to_f.round(2)
    self.grade(deptNWwide_aug_2019_sla_percent_complete)
    @nw_grade_aug_2019 = self.grade(deptNWwide_aug_2019_sla_percent_complete)
  end

  def self.august_2019_html
    aug_2019_start_date = Chronic.parse('2019-08-01')
    aug_2019_end_date = Chronic.parse('2019-08-31')
    tally_list = Sr.
    where("sr_create_date >= ? AND sr_create_date <= ?",
      aug_2019_start_date, aug_2019_end_date).
      where(status: ['Closed'],
        department: 'SWM Solid Waste Management',
        trash_quad: ['SW','SE','NW','NE'],
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

    tally_list_values = Sr.
    where("sr_create_date >= ? AND sr_create_date <= ?",
      aug_2019_start_date, aug_2019_end_date).
      where(status: ['Closed'], department: 'SWM Solid Waste Management',
        trash_quad: ['SW','SE','NW','NE'],
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
          'Add A Can CANCELLATION', 'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint', 'Physically Challenged Pickup'])
          .pluck(:id, :case_number, :sr_location, :county, :district,
            :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day,
            :heavy_trash_day, :recycle_day, :key_map, :management_district,
            :department, :division, :sr_type, :queue, :sla, :status,
            :sr_create_date, :due_date, :date_closed, :overdue, :title,
            :x, :y, :latitude, :longitude, :channel_type, :created_at,
            :updated_at, :field1, :field2, :client, :garbage_route,
            :heavy_trash_quad, :sr_owner, :sr_creator, :resolve_days,
            :street_num, :client_street, :city, :state, :zip, :phone_number,
            :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
            :recycle_route, :resolution_time, :expression, :ne_overdue,
            :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
            :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
            :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status, :tally)

    headers = %w[id case_number sr_location county district neighborhood
      tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
      key_map management_district department division sr_type queue
      sla status sr_create_date due_date date_closed overdue title x y
      latitude longitude channel_type created_at updated_at field1 field2
      client garbage_route heavy_trash_quad sr_owner sr_creator resolve_days
      street_num client_street city state zip phone_number email_address
      garbage_day1 garbage_quad recycle_day1 recycle_route resolution_time
      expression ne_overdue ne_not_overdue ne_sr_total nw_overdue
      nw_not_overdue nw_sr_total se_overdue se_not_overdue se_sr_total
      sw_overdue sw_not_overdue sw_sr_total quad_status tally]
    CSV.open("../searchwarranty/august_2019.csv", "wb", write_headers: true,
      headers: headers) do |csv| tally_list_values.each do |row|
        csv << row
      end
    end
    # binding.pry
    sales2 = Daru::DataFrame.from_csv '../searchwarranty/august_2019.csv'
    list2 = sales2.pivot_table(index:['sr_type'],values:'tally',
      vectors:['trash_quad'],  agg:  :sum)
    File.open('../searchwarranty/app/views/srs/august_2019.html.erb',
      'w+'){|f| f << list2.to_html}
    File.open('../searchwarranty/app/views/srs/august_2019.html',
      'w+'){|f| f << list2.to_html}
    #august-aug_2019_end_date
  end

  def self.september_2019_html
    start_date = Chronic.parse('2019-09-01')
    end_date = Chronic.parse('2019-09-30')
    tally_list = Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date, end_date).where(status: ['Closed'],
        department: 'SWM Solid Waste Management',
        trash_quad: ['SW','SE','NW','NE'],
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
    tally_list_values = Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date, end_date).
      where(status: ['Closed'],
        department: 'SWM Solid Waste Management',
        trash_quad: ['SW','SE','NW','NE'],
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection',
          'Dead Animal Collection', 'Add A Can CANCELLATION',
          'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
          'Physically Challenged Pickup']).
          pluck(:id, :case_number, :sr_location, :county, :district,
            :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day,
            :heavy_trash_day, :recycle_day, :key_map, :management_district,
            :department, :division, :sr_type, :queue, :sla, :status,
            :sr_create_date, :due_date, :date_closed, :overdue, :title,
            :x, :y, :latitude, :longitude, :channel_type, :created_at,
            :updated_at, :field1, :field2, :client, :garbage_route,
            :heavy_trash_quad, :sr_owner, :sr_creator, :resolve_days,
            :street_num, :client_street, :city, :state, :zip, :phone_number,
            :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
            :recycle_route, :resolution_time, :expression, :ne_overdue,
            :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
            :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
            :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status, :tally)
    headers = %w[id case_number sr_location county district neighborhood
      tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
      key_map management_district department division sr_type queue sla
      status sr_create_date due_date date_closed overdue title x y latitude
      longitude channel_type created_at updated_at field1 field2 client
      garbage_route heavy_trash_quad sr_owner sr_creator resolve_days
      street_num client_street city state zip phone_number email_address
      garbage_day1 garbage_quad recycle_day1 recycle_route resolution_time
      expression ne_overdue ne_not_overdue ne_sr_total nw_overdue
      nw_not_overdue nw_sr_total se_overdue se_not_overdue se_sr_total
      sw_overdue sw_not_overdue sw_sr_total quad_status tally]
    CSV.open("../searchwarranty/september_2019.csv", "wb",
      write_headers: true, headers: headers) do |csv|
        tally_list_values.each do |row|
          csv << row
        end
      end
    # binding.pry
    sales2 = Daru::DataFrame.from_csv '../searchwarranty/september_2019.csv'
    list2 = sales2.pivot_table(index:['sr_type'],
      values:'tally',
      vectors:['trash_quad'],
      agg:  :sum)
    File.open('../searchwarranty/app/views/srs/september_2019.html.erb',
      'w+'){|f| f << list2.to_html}
    File.open('../searchwarranty/app/views/srs/september_2019.html',
      'w+'){|f| f << list2.to_html}
    #august-aug_2019_end_date
  end

  def self.october_2019_html
    start_date = Chronic.parse('2019-10-01')
    end_date = Chronic.parse('2019-10-31')
    tally_list = Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date, end_date).
      where(status: ['Closed'],
        department: 'SWM Solid Waste Management',
        trash_quad: ['SW','SE','NW','NE'],
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection',
          'Dead Animal Collection', 'Add A Can CANCELLATION',
          'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
          'Physically Challenged Pickup'])
    tally_list.each{|sr|
      sr.tally = 1
      sr.save}
    tally_list_values = Sr.
    where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date, end_date).where(status: ['Closed'],
        department: 'SWM Solid Waste Management',
        trash_quad: ['SW','SE','NW','NE'],
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
          'Add A Can CANCELLATION', 'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
          pluck(:id, :case_number, :sr_location, :county, :district,
            :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day,
            :heavy_trash_day, :recycle_day, :key_map, :management_district,
            :department, :division, :sr_type, :queue, :sla, :status,
            :sr_create_date, :due_date, :date_closed, :overdue, :title,
            :x, :y, :latitude, :longitude, :channel_type, :created_at,
            :updated_at, :field1, :field2, :client, :garbage_route,
            :heavy_trash_quad, :sr_owner, :sr_creator, :resolve_days,
            :street_num, :client_street, :city, :state, :zip, :phone_number,
            :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
            :recycle_route, :resolution_time, :expression, :ne_overdue,
            :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
            :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
            :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status, :tally)
    headers = %w[id case_number sr_location county district neighborhood
      tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
      key_map management_district department division sr_type queue sla
      status sr_create_date due_date date_closed overdue title x y
      latitude longitude channel_type created_at updated_at field1 field2
      client garbage_route heavy_trash_quad sr_owner sr_creator resolve_days
      street_num client_street city state zip phone_number email_address
      garbage_day1 garbage_quad recycle_day1 recycle_route resolution_time
      expression ne_overdue ne_not_overdue ne_sr_total nw_overdue
      nw_not_overdue nw_sr_total se_overdue se_not_overdue se_sr_total
      sw_overdue sw_not_overdue sw_sr_total quad_status tally]
    CSV.open("../searchwarranty/october_2019.csv", "wb",
      write_headers: true, headers: headers) do |csv|
        tally_list_values.each do |row|
          csv << row
        end
      end
    # binding.pry
    sales2 = Daru::DataFrame.from_csv '../searchwarranty/october_2019.csv'
    list2 = sales2.pivot_table(index:['sr_type'],values:'tally',
      vectors:['trash_quad'],  agg:  :sum)
    File.open('../searchwarranty/app/views/srs/october_2019.html.erb',
      'w+'){|f| f << list2.to_html}
    File.open('../searchwarranty/app/views/srs/october_2019.html',
      'w+'){|f| f << list2.to_html}
    #august-aug_2019_end_date
  end

  def self.november_2019_html
    start_date = Chronic.parse('2019-11-01')
    end_date = Chronic.parse('2019-11-30')
    tally_list = Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date, end_date).
      where(status: ['Closed'],
        department: 'SWM Solid Waste Management',
        trash_quad: ['SW','SE','NW','NE'],
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
    tally_list_values = Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
       start_date, end_date).
       where(status: ['Closed'],
         department: 'SWM Solid Waste Management',
         trash_quad: ['SW','SE','NW','NE'],
         sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
           'New Resident Container', 'Recycling Participation NEW',
           'Recycling Cart Repair or Replace', 'SWM Escalation',
           'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
           'Add A Can', 'Storm Debris Collection',
           'Dead Animal Collection', 'Add A Can CANCELLATION',
           'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
           'Physically Challenged Pickup']).
           pluck(:id, :case_number, :sr_location, :county, :district,
             :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day,
             :heavy_trash_day, :recycle_day, :key_map, :management_district,
             :department, :division, :sr_type, :queue, :sla, :status,
             :sr_create_date, :due_date, :date_closed, :overdue, :title,
             :x, :y, :latitude, :longitude, :channel_type, :created_at,
             :updated_at, :field1, :field2, :client, :garbage_route,
             :heavy_trash_quad, :sr_owner, :sr_creator, :resolve_days,
             :street_num, :client_street, :city, :state, :zip,
             :phone_number, :email_address, :garbage_day1, :garbage_quad,
             :recycle_day1, :recycle_route, :resolution_time, :expression,
             :ne_overdue, :ne_not_overdue, :ne_sr_total, :nw_overdue,
             :nw_not_overdue, :nw_sr_total, :se_overdue, :se_not_overdue,
             :se_sr_total, :sw_overdue, :sw_not_overdue, :sw_sr_total,
             :quad_status, :tally)
    headers = %w[id case_number sr_location county district neighborhood
      tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
      key_map management_district department division sr_type queue sla
      status sr_create_date due_date date_closed overdue title x y latitude
      longitude channel_type created_at updated_at field1 field2 client
      garbage_route heavy_trash_quad sr_owner sr_creator resolve_days
      street_num client_street city state zip phone_number email_address
      garbage_day1 garbage_quad recycle_day1 recycle_route resolution_time
      expression ne_overdue ne_not_overdue ne_sr_total nw_overdue
      nw_not_overdue nw_sr_total se_overdue se_not_overdue se_sr_total
      sw_overdue sw_not_overdue sw_sr_total quad_status tally]
    CSV.open("../searchwarranty/november_2019.csv", "wb",
      write_headers: true, headers: headers) do |csv|
        tally_list_values.each do |row|
          csv << row
        end
      end
    # binding.pry
    sales2 = Daru::DataFrame.from_csv '../searchwarranty/november_2019.csv'
    list2 = sales2.pivot_table(index:['sr_type'],
      values:'tally',
      vectors:['trash_quad'],
      agg:  :sum)
    File.open('../searchwarranty/app/views/srs/november_2019.html.erb',
      'w+'){|f| f << list2.to_html}
    File.open('../searchwarranty/app/views/srs/november_2019.html',
      'w+'){|f| f << list2.to_html}
    #august-aug_2019_end_date
  end

  def self.december_2019_html
    start_date = Chronic.parse('2019-11-01')
    end_date = Chronic.parse('2019-11-30')
    tally_list = Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date, end_date).where(status: ['Closed'],
        department: 'SWM Solid Waste Management',
        trash_quad: ['SW','SE','NW','NE'],
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection',
          'Dead Animal Collection', 'Add A Can CANCELLATION',
          'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
          'Physically Challenged Pickup'])
    tally_list.each{|sr|
      sr.tally = 1
      sr.save}
    tally_list_values = Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date, end_date).where(status: ['Closed'],
        department: 'SWM Solid Waste Management',
        trash_quad: ['SW','SE','NW','NE'],
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection',
          'Dead Animal Collection', 'Add A Can CANCELLATION',
          'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
          'Physically Challenged Pickup']).
          pluck(:id, :case_number, :sr_location, :county, :district,
            :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day,
            :heavy_trash_day, :recycle_day, :key_map, :management_district,
            :department, :division, :sr_type, :queue, :sla, :status,
            :sr_create_date, :due_date, :date_closed, :overdue, :title,
            :x, :y, :latitude, :longitude, :channel_type, :created_at,
            :updated_at, :field1, :field2, :client, :garbage_route,
            :heavy_trash_quad, :sr_owner, :sr_creator, :resolve_days,
            :street_num, :client_street, :city, :state, :zip, :phone_number,
            :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
            :recycle_route, :resolution_time, :expression, :ne_overdue,
            :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
            :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
            :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status, :tally)
    headers = %w[id case_number sr_location county district neighborhood
      tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
      key_map management_district department division sr_type queue sla
      status sr_create_date due_date date_closed overdue title x y latitude
      longitude channel_type created_at updated_at field1 field2 client
      garbage_route heavy_trash_quad sr_owner sr_creator resolve_days
      street_num client_street city state zip phone_number email_address
      garbage_day1 garbage_quad recycle_day1 recycle_route resolution_time
      expression ne_overdue ne_not_overdue ne_sr_total nw_overdue
      nw_not_overdue nw_sr_total se_overdue se_not_overdue se_sr_total
      sw_overdue sw_not_overdue sw_sr_total quad_status tally]
    CSV.open("../searchwarranty/december_2019.csv", "wb",
      write_headers: true, headers: headers) do |csv|
        tally_list_values.each do |row|
          csv << row
        end
      end
    # binding.pry
    sales2 = Daru::DataFrame.from_csv '../searchwarranty/december_2019.csv'
    list2 = sales2.pivot_table(index:['sr_type'],values:'tally',
      vectors:['trash_quad'],  agg:  :sum)
    File.open('../searchwarranty/app/views/srs/december_2019.html.erb',
      'w+'){|f| f << list2.to_html}
    File.open('../searchwarranty/app/views/srs/december_2019.html',
      'w+'){|f| f << list2.to_html}
    #august-aug_2019_end_date
  end

  def self.jan_2020_html
    start_date = Chronic.parse('2020-1-01')
    end_date = Chronic.parse('2020-1-31')
    tally_list = Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date, end_date).where(status: ['Closed'],
        department: 'SWM Solid Waste Management',
        trash_quad: ['SW','SE','NW','NE'],
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
    tally_list_values = Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date, end_date).where(status: ['Closed'],
        department: 'SWM Solid Waste Management',
        trash_quad: ['SW','SE','NW','NE'],
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection', 'Dead Animal Collection',
          'Add A Can CANCELLATION', 'Missed Recycling Pickup',
          'Personnel or Vehicle Complaint', 'Physically Challenged Pickup']).
          pluck(:id, :case_number, :sr_location, :county, :district,
            :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day,
            :heavy_trash_day, :recycle_day, :key_map, :management_district,
            :department, :division, :sr_type, :queue, :sla, :status,
            :sr_create_date, :due_date, :date_closed, :overdue, :title,
            :x, :y, :latitude, :longitude, :channel_type, :created_at,
            :updated_at, :field1, :field2, :client, :garbage_route,
            :heavy_trash_quad, :sr_owner, :sr_creator, :resolve_days,
            :street_num, :client_street, :city, :state, :zip, :phone_number,
            :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
            :recycle_route, :resolution_time, :expression, :ne_overdue,
            :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
            :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
            :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status,
            :tally)
    headers = %w[id case_number sr_location county district neighborhood
      tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
      key_map management_district department division sr_type queue sla
      status sr_create_date due_date date_closed overdue title x y
      latitude longitude channel_type created_at updated_at field1 field2
      client garbage_route heavy_trash_quad sr_owner sr_creator resolve_days
      street_num client_street city state zip phone_number email_address
      garbage_day1 garbage_quad recycle_day1 recycle_route resolution_time
      expression ne_overdue ne_not_overdue ne_sr_total nw_overdue
      nw_not_overdue nw_sr_total se_overdue se_not_overdue se_sr_total
      sw_overdue sw_not_overdue sw_sr_total quad_status tally]
    CSV.open("../searchwarranty/jan_2020.csv", "wb",
      write_headers: true, headers: headers) do |csv|
        tally_list_values.each do |row|
          csv << row
        end
      end
    # binding.pry
    sales2 = Daru::DataFrame.from_csv '../searchwarranty/jan_2020.csv'
    list2 = sales2.pivot_table(index:['sr_type'],
      values:'tally',
      vectors:['trash_quad'],
      agg:  :sum)
    File.open('../searchwarranty/app/views/srs/jan_2020.html.erb',
      'w+'){|f| f << list2.to_html}
    File.open('../searchwarranty/app/views/srs/jan_2020.html',
      'w+'){|f| f << list2.to_html}
    #august-aug_2019_end_date
  end

  def self.feb_2020_html
    start_date = Chronic.parse('2020-2-01')
    end_date = Chronic.parse('2020-2-29')
    tally_list = Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date, end_date).
      where(status: ['Closed'],
        department: 'SWM Solid Waste Management',
        trash_quad: ['SW','SE','NW','NE'],
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection',
          'Dead Animal Collection', 'Add A Can CANCELLATION',
          'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
          'Physically Challenged Pickup'])
    tally_list.each{|sr|
      sr.tally = 1
      sr.save}
    tally_list_values = Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date, end_date).where(status: ['Closed'],
        department: 'SWM Solid Waste Management',
        trash_quad: ['SW','SE','NW','NE'],
        sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
          'New Resident Container', 'Recycling Participation NEW',
          'Recycling Cart Repair or Replace', 'SWM Escalation',
          'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
          'Add A Can', 'Storm Debris Collection',
          'Dead Animal Collection', 'Add A Can CANCELLATION',
          'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
          'Physically Challenged Pickup']).
          pluck(:id, :case_number, :sr_location, :county, :district,
            :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day,
            :heavy_trash_day, :recycle_day, :key_map, :management_district,
            :department, :division, :sr_type, :queue, :sla, :status,
            :sr_create_date, :due_date, :date_closed, :overdue, :title,
            :x, :y, :latitude, :longitude, :channel_type, :created_at,
            :updated_at, :field1, :field2, :client, :garbage_route,
            :heavy_trash_quad, :sr_owner, :sr_creator, :resolve_days,
            :street_num, :client_street, :city, :state, :zip, :phone_number,
            :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
            :recycle_route, :resolution_time, :expression, :ne_overdue,
            :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
            :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
            :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status, :tally)
    headers = %w[id case_number sr_location county district neighborhood
      tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
      key_map management_district department division sr_type queue sla
      status sr_create_date due_date date_closed overdue title x y latitude
      longitude channel_type created_at updated_at field1 field2 client
      garbage_route heavy_trash_quad sr_owner sr_creator resolve_days
      street_num client_street city state zip phone_number email_address
      garbage_day1 garbage_quad recycle_day1 recycle_route resolution_time
      expression ne_overdue ne_not_overdue ne_sr_total nw_overdue
      nw_not_overdue nw_sr_total se_overdue se_not_overdue se_sr_total
      sw_overdue sw_not_overdue sw_sr_total quad_status tally]
    CSV.open("../searchwarranty/feb_2020.csv", "wb",
      write_headers: true, headers: headers) do |csv|
        tally_list_values.each do |row|
          csv << row
        end
    end
    # binding.pry
    sales2 = Daru::DataFrame.from_csv '../searchwarranty/feb_2020.csv'
    list2 = sales2.pivot_table(index:['sr_type'],
      values:'tally', vectors:['trash_quad'],  agg:  :sum)
    File.open('../searchwarranty/app/views/srs/feb_2020.html.erb',
      'w+'){|f| f << list2.to_html}
    File.open('../searchwarranty/app/views/srs/feb_2020.html',
      'w+'){|f| f << list2.to_html}
    #august-aug_2019_end_date
  end


    def self.mar_2020_html
      start_date = Chronic.parse('2020-3-01')
      end_date = Chronic.parse('2020-3-31')
      tally_list = Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date, end_date).where(status: ['Closed'],
          department: 'SWM Solid Waste Management',
          trash_quad: ['SW','SE','NW','NE'],
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup'])
      tally_list.each{|sr|
        sr.tally = 1
        sr.save}
      tally_list_values = Sr.
      where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date, end_date).where(status: ['Closed'],
          department: 'SWM Solid Waste Management',
          trash_quad: ['SW','SE','NW','NE'],
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup']).
            pluck(:id, :case_number, :sr_location, :county, :district,
              :neighborhood, :tax_id, :trash_quad, :recycle_quad,
              :trash_day, :heavy_trash_day, :recycle_day, :key_map,
              :management_district, :department, :division, :sr_type,
              :queue, :sla, :status, :sr_create_date, :due_date,
              :date_closed, :overdue, :title, :x, :y, :latitude,
              :longitude, :channel_type, :created_at, :updated_at,
              :field1, :field2, :client, :garbage_route, :heavy_trash_quad,
              :sr_owner, :sr_creator, :resolve_days, :street_num,
              :client_street, :city, :state, :zip, :phone_number,
              :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
              :recycle_route, :resolution_time, :expression, :ne_overdue,
              :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
              :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
              :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status, :tally)
      headers = %w[id case_number sr_location county district neighborhood
        tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
        key_map management_district department division sr_type queue sla
        status sr_create_date due_date date_closed overdue title x y
        latitude longitude channel_type created_at updated_at field1 field2
        client garbage_route heavy_trash_quad sr_owner sr_creator
        resolve_days street_num client_street city state zip phone_number
        email_address garbage_day1 garbage_quad recycle_day1 recycle_route
        resolution_time expression ne_overdue ne_not_overdue ne_sr_total
        nw_overdue nw_not_overdue nw_sr_total se_overdue se_not_overdue
        se_sr_total sw_overdue sw_not_overdue sw_sr_total quad_status tally]
      CSV.open("../searchwarranty/mar_2020.csv", "wb",
        write_headers: true, headers: headers) do |csv|
          tally_list_values.each do |row|
            csv << row
          end
        end
      # binding.pry
      sales2 = Daru::DataFrame.from_csv '../searchwarranty/mar_2020.csv'
      list2 = sales2.pivot_table(index:['sr_type'],values:'tally',
        vectors:['trash_quad'],  agg:  :sum)
      File.open('../searchwarranty/app/views/srs/mar_2020.html.erb',
        'w+'){|f| f << list2.to_html}
      File.open('../searchwarranty/app/views/srs/mar_2020.html',
        'w+'){|f| f << list2.to_html}
      #august-aug_2019_end_date
    end

    def self.april_2020_html
      start_date = Chronic.parse('2020-4-01')
      end_date = Chronic.parse('2020-4-30')
      tally_list = Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date, end_date).
        where(status: ['Closed'],
          department: 'SWM Solid Waste Management',
          trash_quad: ['SW','SE','NW','NE'],
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup'])
      tally_list.each{|sr|
        sr.tally = 1
        sr.save}
      tally_list_values = Sr.
      where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date, end_date).
        where(status: ['Closed'],
          department: 'SWM Solid Waste Management',
          trash_quad: ['SW','SE','NW','NE'],
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup']).
            pluck(:id, :case_number, :sr_location, :county, :district,
              :neighborhood, :tax_id, :trash_quad, :recycle_quad,
              :trash_day, :heavy_trash_day, :recycle_day, :key_map,
              :management_district, :department, :division, :sr_type,
              :queue, :sla, :status, :sr_create_date, :due_date,
              :date_closed, :overdue, :title, :x, :y, :latitude,
              :longitude, :channel_type, :created_at, :updated_at,
              :field1, :field2, :client, :garbage_route, :heavy_trash_quad,
              :sr_owner, :sr_creator, :resolve_days, :street_num,
              :client_street, :city, :state, :zip, :phone_number,
              :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
              :recycle_route, :resolution_time, :expression, :ne_overdue,
              :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
              :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
              :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status, :tally)
      headers = %w[id case_number sr_location county district neighborhood
        tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
        key_map management_district department division sr_type queue
        sla status sr_create_date due_date date_closed overdue title x y
        latitude longitude channel_type created_at updated_at field1 field2
        client garbage_route heavy_trash_quad sr_owner sr_creator
        resolve_days street_num client_street city state zip phone_number
        email_address garbage_day1 garbage_quad recycle_day1 recycle_route
        resolution_time expression ne_overdue ne_not_overdue ne_sr_total
        nw_overdue nw_not_overdue nw_sr_total se_overdue se_not_overdue
        se_sr_total sw_overdue sw_not_overdue sw_sr_total quad_status tally]
      CSV.open("../searchwarranty/april_2020.csv",
        "wb", write_headers: true, headers: headers) do |csv|
          tally_list_values.each do |row|
            csv << row
          end
        end
      # binding.pry
      sales2 = Daru::DataFrame.from_csv '../searchwarranty/april_2020.csv'
      list2 = sales2.pivot_table(index:['sr_type'],
        values:'tally',
        vectors:['trash_quad'],  agg:  :sum)
      File.open('../searchwarranty/app/views/srs/april_2020.html.erb',
        'w+'){|f| f << list2.to_html}
      File.open('../searchwarranty/app/views/srs/april_2020.html',
        'w+'){|f| f << list2.to_html}
      #august-aug_2019_end_date
    end

    def self.may_2020_html
      start_date = Chronic.parse('2020-5-01')
      end_date = Chronic.parse('2020-5-31')
      tally_list = Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date, end_date).
        where(status: ['Closed'],
          department: 'SWM Solid Waste Management',
          trash_quad: ['SW','SE','NW','NE'],
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup'])
      tally_list.each{|sr|
        sr.tally = 1
        sr.save}
      tally_list_values = Sr.
      where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date, end_date).
        where(status: ['Closed'],
          department: 'SWM Solid Waste Management',
          trash_quad: ['SW','SE','NW','NE'],
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup']).
            pluck(:id, :case_number, :sr_location, :county, :district,
              :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day,
              :heavy_trash_day, :recycle_day, :key_map, :management_district,
              :department, :division, :sr_type, :queue, :sla, :status,
              :sr_create_date, :due_date, :date_closed, :overdue, :title,
              :x, :y, :latitude, :longitude, :channel_type, :created_at,
              :updated_at, :field1, :field2, :client, :garbage_route,
              :heavy_trash_quad, :sr_owner, :sr_creator, :resolve_days,
              :street_num, :client_street, :city, :state, :zip, :phone_number,
              :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
              :recycle_route, :resolution_time, :expression, :ne_overdue,
              :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
              :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
              :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status, :tally)
      headers = %w[id case_number sr_location county district neighborhood
        tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
        key_map management_district department division sr_type queue sla
        status sr_create_date due_date date_closed overdue title x y latitude
        longitude channel_type created_at updated_at field1 field2 client
        garbage_route heavy_trash_quad sr_owner sr_creator resolve_days
        street_num client_street city state zip phone_number email_address
        garbage_day1 garbage_quad recycle_day1 recycle_route resolution_time
        expression ne_overdue ne_not_overdue ne_sr_total nw_overdue
        nw_not_overdue nw_sr_total se_overdue se_not_overdue se_sr_total
        sw_overdue sw_not_overdue sw_sr_total quad_status tally]
      CSV.open("../searchwarranty/may_2020.csv", "wb",
        write_headers: true, headers: headers) do |csv|
          tally_list_values.each do |row|
            csv << row
          end
        end
      # binding.pry
      sales2 = Daru::DataFrame.from_csv '../searchwarranty/may_2020.csv'
      list2 = sales2.pivot_table(index:['sr_type'],
        values:'tally', vectors:['trash_quad'],  agg:  :sum)
      File.open('../searchwarranty/app/views/srs/may_2020.html.erb',
        'w+'){|f| f << list2.to_html}
      File.open('../searchwarranty/app/views/srs/may_2020.html',
        'w+'){|f| f << list2.to_html}
      #august-aug_2019_end_date
    end

    def self.june_2020_html
      start_date = Chronic.parse('2020-06-01')
      end_date = Chronic.parse('2020-06-30')
      tally_list = Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date, end_date).
        where(status: ['Closed'],
          department: 'SWM Solid Waste Management',
          trash_quad: ['SW','SE','NW','NE'],
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup'])
      tally_list.each{|sr|
        sr.tally = 1
        sr.save}
      tally_list_values = Sr.
      where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date, end_date).
        where(status: ['Closed'],
          department: 'SWM Solid Waste Management',
          trash_quad: ['SW','SE','NW','NE'],
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup']).
            pluck(:id, :case_number, :sr_location, :county, :district,
              :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day,
              :heavy_trash_day, :recycle_day, :key_map, :management_district,
              :department, :division, :sr_type, :queue, :sla, :status,
              :sr_create_date, :due_date, :date_closed, :overdue, :title,
              :x, :y, :latitude, :longitude, :channel_type, :created_at,
              :updated_at, :field1, :field2, :client, :garbage_route,
              :heavy_trash_quad, :sr_owner, :sr_creator, :resolve_days,
              :street_num, :client_street, :city, :state, :zip, :phone_number,
              :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
              :recycle_route, :resolution_time, :expression, :ne_overdue,
              :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
              :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
              :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status, :tally)
      headers = %w[id case_number sr_location county district neighborhood
        tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
        key_map management_district department division sr_type queue sla
        status sr_create_date due_date date_closed overdue title x y latitude
        longitude channel_type created_at updated_at field1 field2 client
        garbage_route heavy_trash_quad sr_owner sr_creator resolve_days
        street_num client_street city state zip phone_number email_address
        garbage_day1 garbage_quad recycle_day1 recycle_route
        resolution_time expression ne_overdue ne_not_overdue ne_sr_total
        nw_overdue nw_not_overdue nw_sr_total se_overdue se_not_overdue
        se_sr_total sw_overdue sw_not_overdue sw_sr_total quad_status tally]
      CSV.open("../searchwarranty/june_2020.csv", "wb",
        write_headers: true, headers: headers) do |csv|
          tally_list_values.each do |row|
            csv << row
          end
        end
      # binding.pry
      sales2 = Daru::DataFrame.from_csv '../searchwarranty/june_2020.csv'
      list2 = sales2.pivot_table(index:['sr_type'],
        values:'tally', vectors:['trash_quad'],  agg:  :sum)
      File.open('../searchwarranty/app/views/srs/june_2020.html.erb',
        'w+'){|f| f << list2.to_html}
      File.open('../searchwarranty/app/views/srs/june_2020.html',
        'w+'){|f| f << list2.to_html}
      #august-aug_2019_end_date
    end

    def self.fy_2020_html
      start_date = Chronic.parse('2019-07-01')
      end_date = Chronic.parse('2020-06-30')
      tally_list = Sr.where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date, end_date).
        where(status: ['Closed'],
          department: 'SWM Solid Waste Management',
          trash_quad: ['SW','SE','NW','NE'],
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup'])
      tally_list.each{|sr|
        sr.tally = 1
        sr.save}
      tally_list_values = Sr.
      where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date, end_date).
        where(status: ['Closed'],
          department: 'SWM Solid Waste Management',
          trash_quad: ['SW','SE','NW','NE'],
          sr_type: ['Missed Heavy Trash Pickup', 'Container Problem',
            'New Resident Container', 'Recycling Participation NEW',
            'Recycling Cart Repair or Replace', 'SWM Escalation',
            'Missed Garbage Pickup', 'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
            'Dead Animal Collection', 'Add A Can CANCELLATION',
            'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
            'Physically Challenged Pickup']).
            pluck(:id, :case_number, :sr_location, :county, :district,
              :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day,
              :heavy_trash_day, :recycle_day, :key_map, :management_district,
              :department, :division, :sr_type, :queue, :sla, :status,
              :sr_create_date, :due_date, :date_closed, :overdue, :title,
              :x, :y, :latitude, :longitude, :channel_type, :created_at,
              :updated_at, :field1, :field2, :client, :garbage_route,
              :heavy_trash_quad, :sr_owner, :sr_creator, :resolve_days,
              :street_num, :client_street, :city, :state, :zip, :phone_number,
              :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
              :recycle_route, :resolution_time, :expression, :ne_overdue,
              :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
              :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
              :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status, :tally)
      headers = %w[id case_number sr_location county district neighborhood
        tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
        key_map management_district department division sr_type queue sla
        status sr_create_date due_date date_closed overdue title x y latitude
        longitude channel_type created_at updated_at field1 field2 client
        garbage_route heavy_trash_quad sr_owner sr_creator resolve_days
        street_num client_street city state zip phone_number email_address
        garbage_day1 garbage_quad recycle_day1 recycle_route resolution_time
        expression ne_overdue ne_not_overdue ne_sr_total nw_overdue
        nw_not_overdue nw_sr_total se_overdue se_not_overdue se_sr_total
        sw_overdue sw_not_overdue sw_sr_total quad_status tally]
      CSV.open("../searchwarranty/fy_2020.csv", "wb",
        write_headers: true, headers: headers) do |csv|
          tally_list_values.each do |row|
            csv << row
          end
        end
      # binding.pry
      sales2 = Daru::DataFrame.from_csv '../searchwarranty/fy_2020.csv'
      list2 = sales2.pivot_table(index:['sr_type'],
        values:'tally',
        vectors:['trash_quad'],  agg:  :sum)
      File.open('../searchwarranty/app/views/srs/fy_2020.html.erb',
        'w+'){|f| f << list2.to_html}
      File.open('../searchwarranty/app/views/srs/fy_2020.html',
        'w+'){|f| f << list2.to_html}
      #august-aug_2019_end_date
    end


def self.grade_by_month
    self.historical_grade
end
def self.sWM_Escalation_cans_related_list_FY2017
  start_date = Date.parse('2016-07-01')
  end_date= Date.parse('2017-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['SWM Escalation']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.sWM_Escalation_cans_related_list_FY2018
  start_date = Date.parse('2017-07-01')
  end_date= Date.parse('2018-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['SWM Escalation']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.sWM_Escalation_cans_related_list_FY2019
  start_date = Date.parse('2018-07-01')
  end_date= Date.parse('2019-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['SWM Escalation']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.sWM_Escalation_cans_related_list_FY2020
  start_date = Date.parse('2019-07-01')
  end_date= DateTime.now
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['SWM Escalation']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.unauthorizedContainerRetrieval_cans_related_list_FY2017
  start_date = Date.parse('2016-07-01')
  end_date= Date.parse('2017-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Unauthorized Container Retrieval']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.unauthorizedContainerRetrieval_cans_related_list_FY2018
  start_date = Date.parse('2017-07-01')
  end_date= Date.parse('2018-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Unauthorized Container Retrieval']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.unauthorizedContainerRetrieval_cans_related_list_FY2019
  start_date = Date.parse('2018-07-01')
  end_date= Date.parse('2019-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Unauthorized Container Retrieval']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.unauthorizedContainerRetrieval_cans_related_list_FY2020
  start_date = Date.parse('2019-07-01')
  end_date= DateTime.now
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Unauthorized Container Retrieval']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.recyclingCartRepairorReplace_cans_related_list_FY2017
  start_date = Date.parse('2016-07-01')
  end_date= Date.parse('2017-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Recycling Cart Repair or Replace']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.recyclingCartRepairorReplace_cans_related_list_FY2018
  start_date = Date.parse('2017-07-01')
  end_date= Date.parse('2018-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Recycling Cart Repair or Replace']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.recyclingCartRepairorReplace_cans_related_list_FY2019
  start_date = Date.parse('2018-07-01')
  end_date= Date.parse('2019-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Recycling Cart Repair or Replace']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.recyclingCartRepairorReplace_cans_related_list_FY2020
  start_date = Date.parse('2019-07-01')
  end_date= DateTime.now
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Recycling Cart Repair or Replace']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.recyclingParticipationNEW_cans_related_list_FY2017
  start_date = Date.parse('2016-07-01')
  end_date= Date.parse('2017-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Recycling Participation NEW']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.recyclingParticipationNEW_cans_related_list_FY2018
  start_date = Date.parse('2017-07-01')
  end_date= Date.parse('2018-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Recycling Participation NEW']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.recyclingParticipationNEW_cans_related_list_FY2019
  start_date = Date.parse('2018-07-01')
  end_date= Date.parse('2019-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Recycling Participation NEW']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.recyclingParticipationNEW_cans_related_list_FY2020
  start_date = Date.parse('2019-07-01')
  end_date= DateTime.now
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Recycling Participation NEW']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.recycleBinCartRetrieve_cans_related_list_FY2017
  start_date = Date.parse('2016-07-01')
  end_date= Date.parse('2017-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Recycle Bin/Cart Retrieve']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.recycleBinCartRetrieve_cans_related_list_FY2018
  start_date = Date.parse('2017-07-01')
  end_date= Date.parse('2018-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Recycle Bin/Cart Retrieve']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.recycleBinCartRetrieve_cans_related_list_FY2019
  start_date = Date.parse('2018-07-01')
  end_date= Date.parse('2019-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Recycle Bin/Cart Retrieve']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.recycleBinCartRetrieve_cans_related_list_FY2020
  start_date = Date.parse('2019-07-01')
  end_date= DateTime.now
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Recycle Bin/Cart Retrieve']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.newResidentContainer_cans_related_list_FY2017
  start_date = Date.parse('2016-07-01')
  end_date= Date.parse('2017-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['New Resident Container']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.newResidentContainer_cans_related_list_FY2018
  start_date = Date.parse('2017-07-01')
  end_date= Date.parse('2018-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['New Resident Container']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.newResidentContainer_cans_related_list_FY2019
  start_date = Date.parse('2018-07-01')
  end_date= Date.parse('2019-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['New Resident Container']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.newResidentContainer_cans_related_list_FY2020
  start_date = Date.parse('2019-07-01')
  end_date= DateTime.now
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['New Resident Container']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.containerProblem_cans_related_list_FY2017
  start_date = Date.parse('2016-07-01')
  end_date= Date.parse('2017-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Container Problem']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.containerProblem_cans_related_list_FY2018
  start_date = Date.parse('2017-07-01')
  end_date= Date.parse('2018-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Container Problem']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.containerProblem_cans_related_list_FY2019
  start_date = Date.parse('2018-07-01')
  end_date= Date.parse('2019-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Container Problem']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.containerProblem_cans_related_list_FY2020
  start_date = Date.parse('2019-07-01')
  end_date= DateTime.now
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Container Problem']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.addACartCANCELLATION_cans_related_list_FY2017
  start_date = Date.parse('2016-07-01')
  end_date= Date.parse('2017-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Add A Cart CANCELLATION']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.addACartCANCELLATION_cans_related_list_FY2018
  start_date = Date.parse('2017-07-01')
  end_date= Date.parse('2018-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Add A Cart CANCELLATION']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.addACartCANCELLATION_cans_related_list_FY2019
  start_date = Date.parse('2018-07-01')
  end_date= Date.parse('2019-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Add A Cart CANCELLATION']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.addACartCANCELLATION_cans_related_list_FY2020
  start_date = Date.parse('2019-07-01')
  end_date= DateTime.now
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Add A Cart CANCELLATION']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.addACart_cans_related_list_FY2017
  start_date = Date.parse('2016-07-01')
  end_date= Date.parse('2017-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Add A Cart']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.addACart_cans_related_list_FY2018
  start_date = Date.parse('2017-07-01')
  end_date= Date.parse('2018-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Add A Cart']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.addACart_cans_related_list_FY2019
  start_date = Date.parse('2018-07-01')
  end_date= Date.parse('2019-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Add A Cart']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.addACart_cans_related_list_FY2020
  start_date = Date.parse('2019-07-01')
  end_date= DateTime.now
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Add A Cart']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end

def self.addACanCANCELLATION_cans_related_list_FY2017
  start_date = Date.parse('2016-07-01')
  end_date= Date.parse('2017-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Add A Can CANCELLATION']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.addACanCANCELLATION_cans_related_list_FY2018
  start_date = Date.parse('2017-07-01')
  end_date= Date.parse('2018-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Add A Can CANCELLATION']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.addACanCANCELLATION_cans_related_list_FY2019
  start_date = Date.parse('2018-07-01')
  end_date= Date.parse('2019-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Add A Can CANCELLATION']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.addACanCANCELLATION_cans_related_list_FY2020
  start_date = Date.parse('2019-07-01')
  end_date= DateTime.now
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['Add A Can CANCELLATION']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.newMoveInService_cans_related_list_FY2017
  start_date = Date.parse('2016-07-01')
  end_date= Date.parse('2017-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['New Move In Service']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.newMoveInService_cans_related_list_FY2018
  start_date = Date.parse('2017-07-01')
  end_date= Date.parse('2018-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['New Move In Service']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.newMoveInService_cans_related_list_FY2019
  start_date = Date.parse('2018-07-01')
  end_date= Date.parse('2019-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['New Move In Service']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.newMoveInService_cans_related_list_FY2020
  start_date = Date.parse('2019-07-01')
  end_date= DateTime.now
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['New Move In Service']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.cans_related_list_FY2020_count
  start_date = Date.parse('2019-07-01')
  end_date= DateTime.now
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['New Move In Service','Add A Can CANCELLATION',
      'Add A Cart','Add A Cart CANCELLATION','Container Problem',
      'New Resident Container','Recycle Bin/Cart Retrieve',
      'Recycling Cart Repair or Replace','Recycling Participation NEW',
      'Unauthorized Container Retrieval','SWM Escalation']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.cans_related_list_FY2019_count
  start_date = Date.parse('2018-07-01')
  end_date= Date.parse('2019-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['New Move In Service','Add A Can CANCELLATION',
      'Add A Cart','Add A Cart CANCELLATION','Container Problem',
      'New Resident Container','Recycle Bin/Cart Retrieve',
      'Recycling Cart Repair or Replace','Recycling Participation NEW',
      'Unauthorized Container Retrieval','SWM Escalation']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.cans_related_list_FY2018_count
  start_date = Date.parse('2017-07-01')
  end_date= Date.parse('2018-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['New Move In Service','Add A Can CANCELLATION',
      'Add A Cart','Add A Cart CANCELLATION','Container Problem',
      'New Resident Container','Recycle Bin/Cart Retrieve',
      'Recycling Cart Repair or Replace','Recycling Participation NEW',
      'Unauthorized Container Retrieval','SWM Escalation']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end
def self.cans_related_list_FY2017_count
  start_date = Date.parse('2016-07-01')
  end_date= Date.parse('2017-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['New Move In Service','Add A Can CANCELLATION',
      'Add A Cart','Add A Cart CANCELLATION','Container Problem',
      'New Resident Container','Recycle Bin/Cart Retrieve',
      'Recycling Cart Repair or Replace','Recycling Participation NEW',
      'Unauthorized Container Retrieval','SWM Escalation']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date).
    count
end

def self.cans_related_list_FY2020
  start_date = Date.parse('2016-07-01')
  end_date= Date.parse('2017-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['New Move In Service','Add A Can CANCELLATION',
      'Add A Cart','Add A Cart CANCELLATION','Container Problem',
      'New Resident Container','Recycle Bin/Cart Retrieve',
      'Recycling Cart Repair or Replace','Recycling Participation NEW',
      'Unauthorized Container Retrieval','SWM Escalation']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date)

    new_services_list.each{|sr|
      # binding.pry
    sr.tally = 1
    sr.save}
    new_services_list_values = Sr.
    where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date, end_date).
      where(status: ['Closed','Open'],
        department: 'SWM Solid Waste Management',
        sr_type: ['New Move In Service','Add A Can CANCELLATION',
          'Add A Cart','Add A Cart CANCELLATION','Container Problem',
          'New Resident Container','Recycle Bin/Cart Retrieve',
          'Recycling Cart Repair or Replace','Recycling Participation NEW',
          'Unauthorized Container Retrieval','SWM Escalation']).
          pluck(:id, :case_number, :sr_location, :county, :district,
            :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day,
            :heavy_trash_day, :recycle_day, :key_map, :management_district,
            :department, :division, :sr_type, :queue, :sla, :status,
            :sr_create_date, :due_date, :date_closed, :overdue, :title,
            :x, :y, :latitude, :longitude, :channel_type, :created_at,
            :updated_at, :field1, :field2, :client, :garbage_route,
            :heavy_trash_quad, :sr_owner, :sr_creator, :resolve_days,
            :street_num, :client_street, :city, :state, :zip, :phone_number,
            :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
            :recycle_route, :resolution_time, :expression, :ne_overdue,
            :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
            :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
            :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status, :tally)
    headers = %w[id case_number sr_location county district neighborhood
       tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
        key_map management_district department division sr_type queue sla
         status sr_create_date due_date date_closed overdue title x y
          latitude longitude channel_type created_at updated_at field1
           field2 client garbage_route heavy_trash_quad sr_owner sr_creator
            resolve_days street_num client_street city state zip phone_number
             email_address garbage_day1 garbage_quad recycle_day1
              recycle_route resolution_time expression ne_overdue
               ne_not_overdue ne_sr_total nw_overdue nw_not_overdue
                nw_sr_total se_overdue se_not_overdue se_sr_total sw_overdue
                 sw_not_overdue sw_sr_total quad_status tally]
    CSV.open("../searchwarranty/cans_related_list_fy20.csv", "wb",
       write_headers: true, headers: headers) do |csv|
         new_services_list_values.each do |row|
           csv << row
         end
       end
       # sales2 = Daru::DataFrame.from_csv '../searchwarranty/cans_related_list_fy20.csv'
       # list2 = sales2.pivot_table(index:['sr_type'],
       #   values:'tally',
       #   vectors:['trash_quad'],  agg:  :sum)
       # File.open('../searchwarranty/app/views/srs/cans_related_list_fy20.csv.html.erb',
       #   'w+'){|f| f << list2.to_html}
       # File.open('../searchwarranty/app/views/srs/cans_related_list_fy20.csv.html',
       #   'w+'){|f| f << list2.to_html}
end
def self.cans_related_list_FY2019
  start_date = Date.parse('2018-07-01')
  end_date= Date.parse('2019-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['New Move In Service','Add A Can CANCELLATION',
      'Add A Cart','Add A Cart CANCELLATION','Container Problem',
      'New Resident Container','Recycle Bin/Cart Retrieve',
      'Recycling Cart Repair or Replace','Recycling Participation NEW',
      'Unauthorized Container Retrieval','SWM Escalation']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date)

    new_services_list.each{|sr|
      # binding.pry
    sr.tally = 1
    sr.save}
    new_services_list_values = Sr.
    where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date, end_date).
      where(status: ['Closed','Open'],
        department: 'SWM Solid Waste Management',
        sr_type: ['New Move In Service','Add A Can CANCELLATION',
          'Add A Cart','Add A Cart CANCELLATION','Container Problem',
          'New Resident Container','Recycle Bin/Cart Retrieve',
          'Recycling Cart Repair or Replace','Recycling Participation NEW',
          'Unauthorized Container Retrieval','SWM Escalation']).
          pluck(:id, :case_number, :sr_location, :county, :district,
            :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day,
            :heavy_trash_day, :recycle_day, :key_map, :management_district,
            :department, :division, :sr_type, :queue, :sla, :status,
            :sr_create_date, :due_date, :date_closed, :overdue, :title,
            :x, :y, :latitude, :longitude, :channel_type, :created_at,
            :updated_at, :field1, :field2, :client, :garbage_route,
            :heavy_trash_quad, :sr_owner, :sr_creator, :resolve_days,
            :street_num, :client_street, :city, :state, :zip, :phone_number,
            :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
            :recycle_route, :resolution_time, :expression, :ne_overdue,
            :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
            :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
            :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status, :tally)
    headers = %w[id case_number sr_location county district neighborhood
       tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
        key_map management_district department division sr_type queue sla
         status sr_create_date due_date date_closed overdue title x y
          latitude longitude channel_type created_at updated_at field1
           field2 client garbage_route heavy_trash_quad sr_owner sr_creator
            resolve_days street_num client_street city state zip phone_number
             email_address garbage_day1 garbage_quad recycle_day1
              recycle_route resolution_time expression ne_overdue
               ne_not_overdue ne_sr_total nw_overdue nw_not_overdue
                nw_sr_total se_overdue se_not_overdue se_sr_total sw_overdue
                 sw_not_overdue sw_sr_total quad_status tally]
    CSV.open("../searchwarranty/cans_related_list_fy19.csv", "wb",
       write_headers: true, headers: headers) do |csv|
         new_services_list_values.each do |row|
           csv << row
         end
       end
       # sales2 = Daru::DataFrame.from_csv '../searchwarranty/cans_related_list_fy19.csv'
       # list2 = sales2.pivot_table(index:['sr_type'],
       #   values:'tally',
       #   vectors:['trash_quad'],  agg:  :sum)
       # File.open('../searchwarranty/app/views/srs/cans_related_list_fy19.csv.html.erb',
       #   'w+'){|f| f << list2.to_html}
       # File.open('../searchwarranty/app/views/srs/cans_related_list_fy19.csv.html',
       #   'w+'){|f| f << list2.to_html}
end
def self.cans_related_list_FY2018
  start_date = Date.parse('2017-07-01')
  end_date= Date.parse('2018-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['New Move In Service','Add A Can CANCELLATION',
      'Add A Cart','Add A Cart CANCELLATION','Container Problem',
      'New Resident Container','Recycle Bin/Cart Retrieve',
      'Recycling Cart Repair or Replace','Recycling Participation NEW',
      'Unauthorized Container Retrieval','SWM Escalation']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date)

    new_services_list.each{|sr|
      # binding.pry
    sr.tally = 1
    sr.save}
    new_services_list_values = Sr.
    where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date, end_date).
      where(status: ['Closed','Open'],
        department: 'SWM Solid Waste Management',
        sr_type: ['New Move In Service','Add A Can CANCELLATION',
          'Add A Cart','Add A Cart CANCELLATION','Container Problem',
          'New Resident Container','Recycle Bin/Cart Retrieve',
          'Recycling Cart Repair or Replace','Recycling Participation NEW',
          'Unauthorized Container Retrieval','SWM Escalation']).
          pluck(:id, :case_number, :sr_location, :county, :district,
            :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day,
            :heavy_trash_day, :recycle_day, :key_map, :management_district,
            :department, :division, :sr_type, :queue, :sla, :status,
            :sr_create_date, :due_date, :date_closed, :overdue, :title,
            :x, :y, :latitude, :longitude, :channel_type, :created_at,
            :updated_at, :field1, :field2, :client, :garbage_route,
            :heavy_trash_quad, :sr_owner, :sr_creator, :resolve_days,
            :street_num, :client_street, :city, :state, :zip, :phone_number,
            :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
            :recycle_route, :resolution_time, :expression, :ne_overdue,
            :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
            :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
            :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status, :tally)
    headers = %w[id case_number sr_location county district neighborhood
       tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
        key_map management_district department division sr_type queue sla
         status sr_create_date due_date date_closed overdue title x y
          latitude longitude channel_type created_at updated_at field1
           field2 client garbage_route heavy_trash_quad sr_owner sr_creator
            resolve_days street_num client_street city state zip phone_number
             email_address garbage_day1 garbage_quad recycle_day1
              recycle_route resolution_time expression ne_overdue
               ne_not_overdue ne_sr_total nw_overdue nw_not_overdue
                nw_sr_total se_overdue se_not_overdue se_sr_total sw_overdue
                 sw_not_overdue sw_sr_total quad_status tally]
    CSV.open("../searchwarranty/cans_related_list_fy18.csv", "wb",
       write_headers: true, headers: headers) do |csv|
         new_services_list_values.each do |row|
           csv << row
         end
       end
       # sales2 = Daru::DataFrame.from_csv '../searchwarranty/cans_related_list_fy18.csv'
       # list2 = sales2.pivot_table(index:['sr_type'],
       #   values:'tally',
       #   vectors:['trash_quad'],  agg:  :sum)
       # File.open('../searchwarranty/app/views/srs/cans_related_list_fy18.csv.html.erb',
       #   'w+'){|f| f << list2.to_html}
       # File.open('../searchwarranty/app/views/srs/cans_related_list_fy18.csv.html',
       #   'w+'){|f| f << list2.to_html}
end
def self.cans_related_list_FY2017
  start_date = Date.parse('2016-07-01')
  end_date= Date.parse('2017-06-30')
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['New Move In Service','Add A Can CANCELLATION',
      'Add A Cart','Add A Cart CANCELLATION','Container Problem',
      'New Resident Container','Recycle Bin/Cart Retrieve',
      'Recycling Cart Repair or Replace','Recycling Participation NEW',
      'Unauthorized Container Retrieval','SWM Escalation']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date)

    new_services_list.each{|sr|
      # binding.pry
    sr.tally = 1
    sr.save}
    new_services_list_values = Sr.
    where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date, end_date).
      where(status: ['Closed','Open'],
        department: 'SWM Solid Waste Management',
        sr_type: ['New Move In Service','Add A Can CANCELLATION',
          'Add A Cart','Add A Cart CANCELLATION','Container Problem',
          'New Resident Container','Recycle Bin/Cart Retrieve',
          'Recycling Cart Repair or Replace','Recycling Participation NEW',
          'Unauthorized Container Retrieval','SWM Escalation']).
          pluck(:id, :case_number, :sr_location, :county, :district,
            :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day,
            :heavy_trash_day, :recycle_day, :key_map, :management_district,
            :department, :division, :sr_type, :queue, :sla, :status,
            :sr_create_date, :due_date, :date_closed, :overdue, :title,
            :x, :y, :latitude, :longitude, :channel_type, :created_at,
            :updated_at, :field1, :field2, :client, :garbage_route,
            :heavy_trash_quad, :sr_owner, :sr_creator, :resolve_days,
            :street_num, :client_street, :city, :state, :zip, :phone_number,
            :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
            :recycle_route, :resolution_time, :expression, :ne_overdue,
            :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
            :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
            :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status, :tally)
    headers = %w[id case_number sr_location county district neighborhood
       tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
        key_map management_district department division sr_type queue sla
         status sr_create_date due_date date_closed overdue title x y
          latitude longitude channel_type created_at updated_at field1
           field2 client garbage_route heavy_trash_quad sr_owner sr_creator
            resolve_days street_num client_street city state zip phone_number
             email_address garbage_day1 garbage_quad recycle_day1
              recycle_route resolution_time expression ne_overdue
               ne_not_overdue ne_sr_total nw_overdue nw_not_overdue
                nw_sr_total se_overdue se_not_overdue se_sr_total sw_overdue
                 sw_not_overdue sw_sr_total quad_status tally]
    CSV.open("../searchwarranty/cans_related_list_fy17.csv", "wb",
       write_headers: true, headers: headers) do |csv|
         new_services_list_values.each do |row|
           csv << row
         end
       end
       # sales2 = Daru::DataFrame.from_csv '../searchwarranty/cans_related_list_fy17.csv'
       # list2 = sales2.pivot_table(index:['sr_type'],
       #   values:'tally',
       #   vectors:['trash_quad'],  agg:  :sum)
       # File.open('../searchwarranty/app/views/srs/cans_related_list_fy17.csv.html.erb',
       #   'w+'){|f| f << list2.to_html}
       # File.open('../searchwarranty/app/views/srs/cans_related_list_fy17.csv.html',
       #   'w+'){|f| f << list2.to_html}
end
def self.new_services_list_2020
  start_date = Date.parse('2019-07-01')
  end_date= Time.now
  new_services_list = Sr.where(status: ['Closed','Open'],
    department: 'SWM Solid Waste Management',
    sr_type: ['New Move In Service',
    'New Resident Container','Recycling Participation NEW',
    'New Resident in Private Development','Add A Can',
    'Non Residential Collection Service NEW']).
    where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date)

    new_services_list.each{|sr|
      # binding.pry
    sr.tally = 1
    sr.save}

    new_services_list_values = Sr.
    where("sr_create_date >= ? AND sr_create_date <= ?",
      start_date, end_date).
      where(status: ['Closed','Open'],
        department: 'SWM Solid Waste Management',
        sr_type: ['New Move In Service',
          'New Resident Container', 'Recycling Participation NEW',
          'New Resident in Private Development','Add A Can',
          'Non Residential Collection Service NEW']).
          pluck(:id, :case_number, :sr_location, :county, :district,
            :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day,
            :heavy_trash_day, :recycle_day, :key_map, :management_district,
            :department, :division, :sr_type, :queue, :sla, :status,
            :sr_create_date, :due_date, :date_closed, :overdue, :title,
            :x, :y, :latitude, :longitude, :channel_type, :created_at,
            :updated_at, :field1, :field2, :client, :garbage_route,
            :heavy_trash_quad, :sr_owner, :sr_creator, :resolve_days,
            :street_num, :client_street, :city, :state, :zip, :phone_number,
            :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
            :recycle_route, :resolution_time, :expression, :ne_overdue,
            :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
            :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
            :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status, :tally)

    headers = %w[id case_number sr_location county district neighborhood
       tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
        key_map management_district department division sr_type queue sla
         status sr_create_date due_date date_closed overdue title x y
          latitude longitude channel_type created_at updated_at field1
           field2 client garbage_route heavy_trash_quad sr_owner sr_creator
            resolve_days street_num client_street city state zip phone_number
             email_address garbage_day1 garbage_quad recycle_day1
              recycle_route resolution_time expression ne_overdue
               ne_not_overdue ne_sr_total nw_overdue nw_not_overdue
                nw_sr_total se_overdue se_not_overdue se_sr_total sw_overdue
                 sw_not_overdue sw_sr_total quad_status tally]
    CSV.open("../searchwarranty/new_services_list_2020.csv", "wb",
       write_headers: true, headers: headers) do |csv|
         new_services_list_values.each do |row|
           csv << row
         end
       end
       sales2 = Daru::DataFrame.from_csv '../searchwarranty/new_services_list_2020.csv'
       list2 = sales2.pivot_table(index:['sr_type','status'],
         values:'tally',
         vectors:['trash_quad'],  agg:  :sum)
       File.open('../searchwarranty/app/views/srs/new_svc_list_2020.html.erb',
         'w+'){|f| f << list2.to_html}
       File.open('../searchwarranty/app/views/srs/new_svc_list_2020.html',
         'w+'){|f| f << list2.to_html}
       #august-aug_2019_end_date
  end
  def self.new_services_list_2019
    start_date = Date.parse('2018-07-01')
    end_date= Date.parse('2019-06-30')
    new_services_list = Sr.where(status: ['Closed','Open'],
      department: 'SWM Solid Waste Management',
      sr_type: ['New Move In Service',
      'New Resident Container','Recycling Participation NEW',
      'New Resident in Private Development','Add A Can',
      'Non Residential Collection Service NEW']).
      where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date)

      new_services_list.each{|sr|
        # binding.pry
      sr.tally = 1
      sr.save}
      new_services_list_values = Sr.
      where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date, end_date).
        where(status: ['Closed','Open'],
          department: 'SWM Solid Waste Management',
          sr_type: ['New Move In Service',
            'New Resident Container', 'Recycling Participation NEW',
            'New Resident in Private Development','Add A Can',
            'Non Residential Collection Service NEW']).
            pluck(:id, :case_number, :sr_location, :county, :district,
              :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day,
              :heavy_trash_day, :recycle_day, :key_map, :management_district,
              :department, :division, :sr_type, :queue, :sla, :status,
              :sr_create_date, :due_date, :date_closed, :overdue, :title,
              :x, :y, :latitude, :longitude, :channel_type, :created_at,
              :updated_at, :field1, :field2, :client, :garbage_route,
              :heavy_trash_quad, :sr_owner, :sr_creator, :resolve_days,
              :street_num, :client_street, :city, :state, :zip, :phone_number,
              :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
              :recycle_route, :resolution_time, :expression, :ne_overdue,
              :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
              :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
              :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status, :tally)
      headers = %w[id case_number sr_location county district neighborhood
         tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
          key_map management_district department division sr_type queue sla
           status sr_create_date due_date date_closed overdue title x y
            latitude longitude channel_type created_at updated_at field1
             field2 client garbage_route heavy_trash_quad sr_owner sr_creator
              resolve_days street_num client_street city state zip phone_number
               email_address garbage_day1 garbage_quad recycle_day1
                recycle_route resolution_time expression ne_overdue
                 ne_not_overdue ne_sr_total nw_overdue nw_not_overdue
                  nw_sr_total se_overdue se_not_overdue se_sr_total sw_overdue
                   sw_not_overdue sw_sr_total quad_status tally]
      CSV.open("../searchwarranty/new_services_list_2019.csv", "wb",
         write_headers: true, headers: headers) do |csv|
           new_services_list_values.each do |row|
             csv << row
           end
         end
         sales2 = Daru::DataFrame.from_csv '../searchwarranty/new_services_list_2019.csv'
         list2 = sales2.pivot_table(index:['sr_type'],
           values:'tally',
           vectors:['trash_quad'],  agg:  :sum)
         File.open('../searchwarranty/app/views/srs/new_svc_list_2019.html.erb',
           'w+'){|f| f << list2.to_html}
         File.open('../searchwarranty/app/views/srs/new_svc_list_2019.html',
           'w+'){|f| f << list2.to_html}
  end

  def self.new_services_list_2018
    start_date = Date.parse('2017-07-01')
    end_date= Date.parse('2018-06-30')
    new_services_list = Sr.where(sr_type: ['New Move In Service',
      'New Resident Container','Recycling Participation NEW',
      'New Resident in Private Development','Add A Can',
      'Non Residential Collection Service NEW']).
      where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date)

      new_services_list.each{|sr|
        # binding.pry
      sr.tally = 1
      sr.save}

      new_services_list_values = Sr.
      where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date, end_date).
        where(status: ['Closed'],
          department: 'SWM Solid Waste Management',
          sr_type: ['New Move In Service',
            'New Resident Container', 'Recycling Participation NEW',
            'New Resident in Private Development','Add A Can',
            'Non Residential Collection Service NEW']).
            pluck(:id, :case_number, :sr_location, :county, :district,
              :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day,
              :heavy_trash_day, :recycle_day, :key_map, :management_district,
              :department, :division, :sr_type, :queue, :sla, :status,
              :sr_create_date, :due_date, :date_closed, :overdue, :title,
              :x, :y, :latitude, :longitude, :channel_type, :created_at,
              :updated_at, :field1, :field2, :client, :garbage_route,
              :heavy_trash_quad, :sr_owner, :sr_creator, :resolve_days,
              :street_num, :client_street, :city, :state, :zip, :phone_number,
              :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
              :recycle_route, :resolution_time, :expression, :ne_overdue,
              :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
              :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
              :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status, :tally)
      headers = %w[id case_number sr_location county district neighborhood
         tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
          key_map management_district department division sr_type queue sla
           status sr_create_date due_date date_closed overdue title x y
            latitude longitude channel_type created_at updated_at field1
             field2 client garbage_route heavy_trash_quad sr_owner sr_creator
              resolve_days street_num client_street city state zip phone_number
               email_address garbage_day1 garbage_quad recycle_day1
                recycle_route resolution_time expression ne_overdue
                 ne_not_overdue ne_sr_total nw_overdue nw_not_overdue
                  nw_sr_total se_overdue se_not_overdue se_sr_total sw_overdue
                   sw_not_overdue sw_sr_total quad_status tally]
      CSV.open("../searchwarranty/new_services_list_2018.csv", "wb",
         write_headers: true, headers: headers) do |csv|
           new_services_list_values.each do |row|
             csv << row
           end
         end
     sales2 = Daru::DataFrame.from_csv '../searchwarranty/new_services_list_2018.csv'
     list2 = sales2.pivot_table(index:['sr_type'],
           values:'tally',
           vectors:['trash_quad'],  agg:  :sum)
     File.open('../searchwarranty/app/views/srs/new_svc_list_2018.html.erb',
           'w+'){|f| f << list2.to_html}
     File.open('../searchwarranty/app/views/srs/new_svc_list_2018.html',
           'w+'){|f| f << list2.to_html}
  end

  def self.new_services_list_2017
    start_date = Date.parse('2016-07-01')
    end_date= Date.parse('2017-06-30')
    new_services_list = Sr.where(sr_type: ['New Move In Service',
      'New Resident Container','Recycling Participation NEW',
      'New Resident in Private Development','Add A Can',
      'Non Residential Collection Service NEW']).
      where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date)

      new_services_list.each{|sr|
        # binding.pry
      sr.tally = 1
      sr.save}
      new_services_list_values = Sr.
      where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date, end_date).
        where(status: ['Closed'],
          department: 'SWM Solid Waste Management',
          sr_type: ['New Move In Service',
            'New Resident Container', 'Recycling Participation NEW',
            'New Resident in Private Development','Add A Can',
            'Non Residential Collection Service NEW']).
      pluck(:id, :case_number, :sr_location, :county, :district, :neighborhood,
         :tax_id, :trash_quad, :recycle_quad, :trash_day, :heavy_trash_day,
          :recycle_day, :key_map, :management_district, :department,
           :division, :sr_type, :queue, :sla, :status, :sr_create_date,
            :due_date, :date_closed, :overdue, :title, :x, :y, :latitude,
             :longitude, :channel_type, :created_at, :updated_at, :field1,
              :field2, :client, :garbage_route, :heavy_trash_quad, :sr_owner,
               :sr_creator, :resolve_days, :street_num, :client_street, :city,
                :state, :zip, :phone_number, :email_address, :garbage_day1,
                 :garbage_quad, :recycle_day1, :recycle_route, :resolution_time,
                  :expression, :ne_overdue, :ne_not_overdue, :ne_sr_total,
                   :nw_overdue, :nw_not_overdue, :nw_sr_total, :se_overdue,
                    :se_not_overdue, :se_sr_total, :sw_overdue, :sw_not_overdue,
                     :sw_sr_total, :quad_status, :tally)
      headers = %w[id case_number sr_location county district neighborhood
         tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
          key_map management_district department division sr_type queue sla
           status sr_create_date due_date date_closed overdue title x y
            latitude longitude channel_type created_at updated_at field1
             field2 client garbage_route heavy_trash_quad sr_owner sr_creator
              resolve_days street_num client_street city state zip phone_number
               email_address garbage_day1 garbage_quad recycle_day1
                recycle_route resolution_time expression ne_overdue
                 ne_not_overdue ne_sr_total nw_overdue nw_not_overdue
                  nw_sr_total se_overdue se_not_overdue se_sr_total sw_overdue
                   sw_not_overdue sw_sr_total quad_status tally]
      CSV.open("../searchwarranty/new_services_list_2017.csv", "wb",
         write_headers: true, headers: headers) do |csv|
           new_services_list_values.each do |row|
             csv << row
           end
         end
      sales2 = Daru::DataFrame.from_csv '../searchwarranty/new_services_list_2017.csv'
      list2 = sales2.pivot_table(index:['sr_type'],
           values:'tally',
           vectors:['trash_quad'],  agg:  :sum)
      File.open('../searchwarranty/app/views/srs/new_svc_list_2017.html.erb',
           'w+'){|f| f << list2.to_html}
      File.open('../searchwarranty/app/views/srs/new_svc_list_2017.html',
           'w+'){|f| f << list2.to_html}
  end

  def self.new_services_list_2016
    start_date = Date.parse('2015-07-01')
    end_date= Date.parse('2016-06-30')
    new_services_list = Sr.where(sr_type: ['New Move In Service',
      'New Resident Container','Recycling Participation NEW',
      'New Resident in Private Development','Add A Can',
      'Non Residential Collection Service NEW']).
      where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date)

      new_services_list.each{|sr|
        # binding.pry
      sr.tally = 1
      sr.save}
      new_services_list_values = Sr.
      where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date, end_date).
        where(status: ['Closed'],
          department: 'SWM Solid Waste Management',
          sr_type: ['New Move In Service',
            'New Resident Container', 'Recycling Participation NEW',
            'New Resident in Private Development','Add A Can',
            'Non Residential Collection Service NEW']).
      pluck(:id, :case_number, :sr_location, :county, :district, :neighborhood,
         :tax_id, :trash_quad, :recycle_quad, :trash_day, :heavy_trash_day,
          :recycle_day, :key_map, :management_district, :department,
           :division, :sr_type, :queue, :sla, :status, :sr_create_date,
            :due_date, :date_closed, :overdue, :title, :x, :y, :latitude,
             :longitude, :channel_type, :created_at, :updated_at, :field1,
              :field2, :client, :garbage_route, :heavy_trash_quad, :sr_owner,
               :sr_creator, :resolve_days, :street_num, :client_street, :city,
                :state, :zip, :phone_number, :email_address, :garbage_day1,
                 :garbage_quad, :recycle_day1, :recycle_route, :resolution_time,
                  :expression, :ne_overdue, :ne_not_overdue, :ne_sr_total,
                   :nw_overdue, :nw_not_overdue, :nw_sr_total, :se_overdue,
                    :se_not_overdue, :se_sr_total, :sw_overdue, :sw_not_overdue,
                     :sw_sr_total, :quad_status, :tally)
      headers = %w[id case_number sr_location county district neighborhood
         tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
          key_map management_district department division sr_type queue sla
           status sr_create_date due_date date_closed overdue title x y
            latitude longitude channel_type created_at updated_at field1
             field2 client garbage_route heavy_trash_quad sr_owner sr_creator
              resolve_days street_num client_street city state zip phone_number
               email_address garbage_day1 garbage_quad recycle_day1
                recycle_route resolution_time expression ne_overdue
                 ne_not_overdue ne_sr_total nw_overdue nw_not_overdue
                  nw_sr_total se_overdue se_not_overdue se_sr_total sw_overdue
                   sw_not_overdue sw_sr_total quad_status tally]
      CSV.open("../searchwarranty/new_services_list_2016.csv", "wb",
         write_headers: true, headers: headers) do |csv|
           new_services_list_values.each do |row|
             csv << row
           end
         end

      sales2 = Daru::DataFrame.from_csv '../searchwarranty/new_services_list_2016.csv'
      list2 = sales2.pivot_table(index:['sr_type'],
           values:'tally',
           vectors:['trash_quad'],  agg:  :sum)
     File.open('../searchwarranty/app/views/srs/new_svc_list_2016.html.erb',
           'w+'){|f| f << list2.to_html}
      File.open('../searchwarranty/app/views/srs/new_svc_list_2016.html',
           'w+'){|f| f << list2.to_html}
  end

  def self.new_services_list_2015
    start_date = Date.parse('2014-07-01')
    end_date= Date.parse('2015-06-30')
    new_services_list = Sr.where(sr_type: ['New Move In Service',
      'New Resident Container','Recycling Participation NEW',
      'New Resident in Private Development','Add A Can',
      'Non Residential Collection Service NEW']).
      where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date)

      new_services_list.each{|sr|
        # binding.pry
      sr.tally = 1
      sr.save}
      new_services_list_values = Sr.
      where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date, end_date).
        where(status: ['Closed'],
          department: 'SWM Solid Waste Management',
          sr_type: ['New Move In Service',
            'New Resident Container', 'Recycling Participation NEW',
            'New Resident in Private Development','Add A Can',
            'Non Residential Collection Service NEW']).
      pluck(:id, :case_number, :sr_location, :county, :district, :neighborhood,
         :tax_id, :trash_quad, :recycle_quad, :trash_day, :heavy_trash_day,
          :recycle_day, :key_map, :management_district, :department,
           :division, :sr_type, :queue, :sla, :status, :sr_create_date,
            :due_date, :date_closed, :overdue, :title, :x, :y, :latitude,
             :longitude, :channel_type, :created_at, :updated_at, :field1,
              :field2, :client, :garbage_route, :heavy_trash_quad, :sr_owner,
               :sr_creator, :resolve_days, :street_num, :client_street, :city,
                :state, :zip, :phone_number, :email_address, :garbage_day1,
                 :garbage_quad, :recycle_day1, :recycle_route, :resolution_time,
                  :expression, :ne_overdue, :ne_not_overdue, :ne_sr_total,
                   :nw_overdue, :nw_not_overdue, :nw_sr_total, :se_overdue,
                    :se_not_overdue, :se_sr_total, :sw_overdue, :sw_not_overdue,
                     :sw_sr_total, :quad_status, :tally)
      headers = %w[id case_number sr_location county district neighborhood
         tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
          key_map management_district department division sr_type queue sla
           status sr_create_date due_date date_closed overdue title x y
            latitude longitude channel_type created_at updated_at field1
             field2 client garbage_route heavy_trash_quad sr_owner sr_creator
              resolve_days street_num client_street city state zip phone_number
               email_address garbage_day1 garbage_quad recycle_day1
                recycle_route resolution_time expression ne_overdue
                 ne_not_overdue ne_sr_total nw_overdue nw_not_overdue
                  nw_sr_total se_overdue se_not_overdue se_sr_total sw_overdue
                   sw_not_overdue sw_sr_total quad_status tally]
      CSV.open("../searchwarranty/new_services_list_2015.csv", "wb",
         write_headers: true, headers: headers) do |csv|
           new_services_list_values.each do |row|
             csv << row
           end
         end
      sales2 = Daru::DataFrame.from_csv '../searchwarranty/new_services_list_2015.csv'
      list2 = sales2.pivot_table(index:['sr_type'],
           values:'tally',
           vectors:['trash_quad'],  agg:  :sum)
      File.open('../searchwarranty/app/views/srs/new_svc_list_2015.html.erb',
           'w+'){|f| f << list2.to_html}
      File.open('../searchwarranty/app/views/srs/new_svc_list_2015.html',
           'w+'){|f| f << list2.to_html}
  end

  def self.new_services_list_2014
      start_date = Date.parse('2013-07-01')
      end_date= Date.parse('2014-06-30')
      new_services_list = Sr.where(sr_type: ['New Move In Service',
        'New Resident Container','Recycling Participation NEW',
        'New Resident in Private Development','Add A Can',
        'Non Residential Collection Service NEW']).
        where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date)

        new_services_list.each{|sr|
          # binding.pry
        sr.tally = 1
        sr.save}
        new_services_list_values = Sr.
        where("sr_create_date >= ? AND sr_create_date <= ?",
          start_date, end_date).
          where(status: ['Closed'],
            department: 'SWM Solid Waste Management',
            sr_type: ['New Move In Service',
              'New Resident Container', 'Recycling Participation NEW',
              'New Resident in Private Development','Add A Can',
              'Non Residential Collection Service NEW']).
        pluck(:id, :case_number, :sr_location, :county, :district, :neighborhood,
           :tax_id, :trash_quad, :recycle_quad, :trash_day, :heavy_trash_day,
            :recycle_day, :key_map, :management_district, :department,
             :division, :sr_type, :queue, :sla, :status, :sr_create_date,
              :due_date, :date_closed, :overdue, :title, :x, :y, :latitude,
               :longitude, :channel_type, :created_at, :updated_at, :field1,
                :field2, :client, :garbage_route, :heavy_trash_quad, :sr_owner,
                 :sr_creator, :resolve_days, :street_num, :client_street, :city,
                  :state, :zip, :phone_number, :email_address, :garbage_day1,
                   :garbage_quad, :recycle_day1, :recycle_route, :resolution_time,
                    :expression, :ne_overdue, :ne_not_overdue, :ne_sr_total,
                     :nw_overdue, :nw_not_overdue, :nw_sr_total, :se_overdue,
                      :se_not_overdue, :se_sr_total, :sw_overdue, :sw_not_overdue,
                       :sw_sr_total, :quad_status, :tally)
        headers = %w[id case_number sr_location county district neighborhood
           tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
            key_map management_district department division sr_type queue sla
             status sr_create_date due_date date_closed overdue title x y
              latitude longitude channel_type created_at updated_at field1
               field2 client garbage_route heavy_trash_quad sr_owner sr_creator
                resolve_days street_num client_street city state zip phone_number
                 email_address garbage_day1 garbage_quad recycle_day1
                  recycle_route resolution_time expression ne_overdue
                   ne_not_overdue ne_sr_total nw_overdue nw_not_overdue
                    nw_sr_total se_overdue se_not_overdue se_sr_total sw_overdue
                     sw_not_overdue sw_sr_total quad_status tally]
        CSV.open("../searchwarranty/new_services_list_2014.csv", "wb",
           write_headers: true, headers: headers) do |csv|
             new_services_list_values.each do |row|
               csv << row
             end
           end

      sales2 = Daru::DataFrame.from_csv '../searchwarranty/new_services_list_2014.csv'
      list2 = sales2.pivot_table(index:['sr_type'],
             values:'tally',
             vectors:['trash_quad'],  agg:  :sum)
      File.open('../searchwarranty/app/views/srs/new_svc_list_2014.html.erb',
             'w+'){|f| f << list2.to_html}
      File.open('../searchwarranty/app/views/srs/new_svc_list_2014.html',
             'w+'){|f| f << list2.to_html}
  end

  def self.new_services_list_2013
      start_date = Date.parse('2012-07-01')
      end_date= Date.parse('2013-06-30')
      new_services_list = Sr.where(sr_type: ['New Move In Service',
        'New Resident Container','Recycling Participation NEW',
        'New Resident in Private Development','Add A Can',
        'Non Residential Collection Service NEW']).
        where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date)

        new_services_list.each{|sr|
          # binding.pry
        sr.tally = 1
        sr.save}
        new_services_list_values = Sr.
        where("sr_create_date >= ? AND sr_create_date <= ?",
          start_date, end_date).
          where(status: ['Closed'],
            department: 'SWM Solid Waste Management',
            sr_type: ['New Move In Service',
              'New Resident Container', 'Recycling Participation NEW',
              'New Resident in Private Development','Add A Can',
              'Non Residential Collection Service NEW']).
        pluck(:id, :case_number, :sr_location, :county, :district, :neighborhood,
           :tax_id, :trash_quad, :recycle_quad, :trash_day, :heavy_trash_day,
            :recycle_day, :key_map, :management_district, :department,
             :division, :sr_type, :queue, :sla, :status, :sr_create_date,
              :due_date, :date_closed, :overdue, :title, :x, :y, :latitude,
               :longitude, :channel_type, :created_at, :updated_at, :field1,
                :field2, :client, :garbage_route, :heavy_trash_quad, :sr_owner,
                 :sr_creator, :resolve_days, :street_num, :client_street, :city,
                  :state, :zip, :phone_number, :email_address, :garbage_day1,
                   :garbage_quad, :recycle_day1, :recycle_route, :resolution_time,
                    :expression, :ne_overdue, :ne_not_overdue, :ne_sr_total,
                     :nw_overdue, :nw_not_overdue, :nw_sr_total, :se_overdue,
                      :se_not_overdue, :se_sr_total, :sw_overdue, :sw_not_overdue,
                       :sw_sr_total, :quad_status, :tally)
        headers = %w[id case_number sr_location county district neighborhood
           tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
            key_map management_district department division sr_type queue sla
             status sr_create_date due_date date_closed overdue title x y
              latitude longitude channel_type created_at updated_at field1
               field2 client garbage_route heavy_trash_quad sr_owner sr_creator
                resolve_days street_num client_street city state zip phone_number
                 email_address garbage_day1 garbage_quad recycle_day1
                  recycle_route resolution_time expression ne_overdue
                   ne_not_overdue ne_sr_total nw_overdue nw_not_overdue
                    nw_sr_total se_overdue se_not_overdue se_sr_total sw_overdue
                     sw_not_overdue sw_sr_total quad_status tally]
        CSV.open("../searchwarranty/new_services_list_2013.csv", "wb",
           write_headers: true, headers: headers) do |csv|
             new_services_list_values.each do |row|
               csv << row
             end
           end
        sales2 = Daru::DataFrame.from_csv '../searchwarranty/new_services_list_2013.csv'
        list2 = sales2.pivot_table(index:['sr_type'],
             values:'tally',
             vectors:['trash_quad'],  agg:  :sum)
        File.open('../searchwarranty/app/views/srs/new_svc_list_2013.html.erb',
             'w+'){|f| f << list2.to_html}
        File.open('../searchwarranty/app/views/srs/new_svc_list_2013.html',
             'w+'){|f| f << list2.to_html}
  end


  def self.new_services_list_2012
        start_date = Date.parse('2011-07-01')
        end_date= Date.parse('2012-06-30')
        new_services_list = Sr.where(sr_type: ['New Move In Service',
          'New Resident Container','Recycling Participation NEW',
          'New Resident in Private Development','Add A Can',
          'Non Residential Collection Service NEW']).
          where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date)

          new_services_list.each{|sr|
            # binding.pry
          sr.tally = 1
          sr.save}
          new_services_list_values = Sr.
          where("sr_create_date >= ? AND sr_create_date <= ?",
            start_date, end_date).
            where(status: ['Closed'],
              department: 'SWM Solid Waste Management',
              sr_type: ['New Move In Service',
                'New Resident Container', 'Recycling Participation NEW',
                'New Resident in Private Development','Add A Can',
                'Non Residential Collection Service NEW']).
          pluck(:id, :case_number, :sr_location, :county, :district, :neighborhood,
             :tax_id, :trash_quad, :recycle_quad, :trash_day, :heavy_trash_day,
              :recycle_day, :key_map, :management_district, :department,
               :division, :sr_type, :queue, :sla, :status, :sr_create_date,
                :due_date, :date_closed, :overdue, :title, :x, :y, :latitude,
                 :longitude, :channel_type, :created_at, :updated_at, :field1,
                  :field2, :client, :garbage_route, :heavy_trash_quad, :sr_owner,
                   :sr_creator, :resolve_days, :street_num, :client_street, :city,
                    :state, :zip, :phone_number, :email_address, :garbage_day1,
                     :garbage_quad, :recycle_day1, :recycle_route, :resolution_time,
                      :expression, :ne_overdue, :ne_not_overdue, :ne_sr_total,
                       :nw_overdue, :nw_not_overdue, :nw_sr_total, :se_overdue,
                        :se_not_overdue, :se_sr_total, :sw_overdue, :sw_not_overdue,
                         :sw_sr_total, :quad_status, :tally)
          headers = %w[id case_number sr_location county district neighborhood
             tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
              key_map management_district department division sr_type queue sla
               status sr_create_date due_date date_closed overdue title x y
                latitude longitude channel_type created_at updated_at field1
                 field2 client garbage_route heavy_trash_quad sr_owner sr_creator
                  resolve_days street_num client_street city state zip phone_number
                   email_address garbage_day1 garbage_quad recycle_day1
                    recycle_route resolution_time expression ne_overdue
                     ne_not_overdue ne_sr_total nw_overdue nw_not_overdue
                      nw_sr_total se_overdue se_not_overdue se_sr_total sw_overdue
                       sw_not_overdue sw_sr_total quad_status tally]
          CSV.open("../searchwarranty/new_services_list_2012.csv", "wb",
             write_headers: true, headers: headers) do |csv|
               new_services_list_values.each do |row|
                 csv << row
               end
          end

      sales2 = Daru::DataFrame.from_csv '../searchwarranty/new_services_list_2012.csv'
      list2 = sales2.pivot_table(index:['sr_type'],
            values:'tally',
            vectors:['trash_quad'],  agg:  :sum)
      File.open('../searchwarranty/app/views/srs/new_svc_list_2012.html.erb',
            'w+'){|f| f << list2.to_html}
      File.open('../searchwarranty/app/views/srs/new_svc_list_2012.html',
            'w+'){|f| f << list2.to_html}
    end

    def self.new_services_list_2011
          start_date = Date.parse('2010-07-01')
          end_date= Date.parse('2011-06-30')
          new_services_list = Sr.where(sr_type: ['New Move In Service',
            'New Resident Container','Recycling Participation NEW',
            'New Resident in Private Development','Add A Can',
            'Non Residential Collection Service NEW']).
            where("sr_create_date >= ? AND sr_create_date <= ?",start_date, end_date)

            new_services_list.each{|sr|
              # binding.pry
            sr.tally = 1
            sr.save}
            new_services_list_values = Sr.
            where("sr_create_date >= ? AND sr_create_date <= ?",
              start_date, end_date).
              where(status: ['Closed'],
                department: 'SWM Solid Waste Management',
                sr_type: ['New Move In Service',
                  'New Resident Container', 'Recycling Participation NEW',
                  'New Resident in Private Development','Add A Can',
                  'Non Residential Collection Service NEW']).
            pluck(:id, :case_number, :sr_location, :county, :district, :neighborhood,
               :tax_id, :trash_quad, :recycle_quad, :trash_day, :heavy_trash_day,
                :recycle_day, :key_map, :management_district, :department,
                 :division, :sr_type, :queue, :sla, :status, :sr_create_date,
                  :due_date, :date_closed, :overdue, :title, :x, :y, :latitude,
                   :longitude, :channel_type, :created_at, :updated_at, :field1,
                    :field2, :client, :garbage_route, :heavy_trash_quad, :sr_owner,
                     :sr_creator, :resolve_days, :street_num, :client_street, :city,
                      :state, :zip, :phone_number, :email_address, :garbage_day1,
                       :garbage_quad, :recycle_day1, :recycle_route, :resolution_time,
                        :expression, :ne_overdue, :ne_not_overdue, :ne_sr_total,
                         :nw_overdue, :nw_not_overdue, :nw_sr_total, :se_overdue,
                          :se_not_overdue, :se_sr_total, :sw_overdue, :sw_not_overdue,
                           :sw_sr_total, :quad_status, :tally)
            headers = %w[id case_number sr_location county district neighborhood
               tax_id trash_quad recycle_quad trash_day heavy_trash_day recycle_day
                key_map management_district department division sr_type queue sla
                 status sr_create_date due_date date_closed overdue title x y
                  latitude longitude channel_type created_at updated_at field1
                   field2 client garbage_route heavy_trash_quad sr_owner sr_creator
                    resolve_days street_num client_street city state zip phone_number
                     email_address garbage_day1 garbage_quad recycle_day1
                      recycle_route resolution_time expression ne_overdue
                       ne_not_overdue ne_sr_total nw_overdue nw_not_overdue
                        nw_sr_total se_overdue se_not_overdue se_sr_total sw_overdue
                         sw_not_overdue sw_sr_total quad_status tally]
            CSV.open("../searchwarranty/new_services_list_2012.csv", "wb",
               write_headers: true, headers: headers) do |csv|
                 new_services_list_values.each do |row|
                   csv << row
                 end
            end

        sales2 = Daru::DataFrame.from_csv '../searchwarranty/new_services_list_2012.csv'
        list2 = sales2.pivot_table(index:['sr_type'],
              values:'tally',
              vectors:['trash_quad'],  agg:  :sum)
        File.open('../searchwarranty/app/views/srs/new_svc_list_2012.html.erb',
              'w+'){|f| f << list2.to_html}
        File.open('../searchwarranty/app/views/srs/new_svc_list_2012.html',
              'w+'){|f| f << list2.to_html}
      end

  def self.updated_nil_trash_quad_in_monthly_grade
    Spatial.delete_all
    Spatial.seed2
    start_date = Date.parse('2019-08-01')
    last_date = Time.now
    tally_list = Sr.where(trash_quad: [nil, ""],
      department: 'SWM Solid Waste Management',
      status: 'Closed').
    where("sr_create_date >= ? AND sr_create_date <= ?", start_date,  last_date)
    tally_list.each{|sr| quad = Spatial.where(id:"#{sr.id}").pluck(:quad)
      sr.trash_quad = quad [0]
      sr.garbage_quad = quad [0]
      sr.save
    }
    updated_list = Sr.where(trash_quad: [nil, ""],
      department: 'SWM Solid Waste Management',
      status: 'Closed').
      where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date,  last_date).count
    updated_list_values =
    Sr.where(trash_quad: [nil, ""],
      department: 'SWM Solid Waste Management',
      status: 'Closed').
      where("sr_create_date >= ? AND sr_create_date <= ?",
        start_date,  last_date).
        pluck(:id, :case_number, :sr_location, :county, :district,
          :neighborhood, :tax_id, :trash_quad, :recycle_quad, :trash_day,
          :heavy_trash_day, :recycle_day, :key_map, :management_district,
          :department, :division, :sr_type, :queue, :sla, :status,
          :sr_create_date, :due_date, :date_closed, :overdue, :title,
          :x, :y, :latitude, :longitude, :channel_type, :created_at,
          :updated_at, :field1, :field2, :client, :garbage_route,
          :heavy_trash_quad, :sr_owner, :sr_creator, :resolve_days,
          :street_num, :client_street, :city, :state, :zip, :phone_number,
          :email_address, :garbage_day1, :garbage_quad, :recycle_day1,
          :recycle_route, :resolution_time, :expression, :ne_overdue,
          :ne_not_overdue, :ne_sr_total, :nw_overdue, :nw_not_overdue,
          :nw_sr_total, :se_overdue, :se_not_overdue, :se_sr_total,
          :sw_overdue, :sw_not_overdue, :sw_sr_total, :quad_status,
          :tally)
  end
  def self.import_existing_gis_cases
    csv_text = File.read('"C:\Users\e128289\Downloads\Customer_Points_swd.csv"')
  end

#   def self.sent_chain(methods)
#     methods.inject(self, :send)
#   end
#   # 2.6.3 :013 > date2 = Date.parse('2019-12-01')
#   #  => Sun, 01 Dec 2019
#   # 2.6.3 :014 > date = Date.parse('2019-12-01')
#   #  => Sun, 01 Dec 2019
#   # 2.6.3 :015 > date2 = Date.parse('2019-12-31')
#   #  => Tue, 31 Dec 2019
#   # 2.6.3 :016 > Sr.where(sr_create_date: date..date2).count
#   #    (119.8ms)  SELECT COUNT(*) FROM "srs" WHERE "srs"."sr_create_date" BETWEEN $1 AND $2  [["sr_create_date", "2019-12-01"], ["sr_create_date", "2019-12-31"]]
#   #  => 25581
#   # https://ryanbigg.com/2016/03/working-with-date-ranges-in-active-record
#   scope :created_between, lambda {|start_date, end_date| where("created_at >= ? AND created_at <= ?", start_date, end_date )}
#   # Then to query created between:
#   # @comment.created_between(1.year.ago, Time.now)
#   scope :between_fields, -> (value, initial_date, final_date) {
#   where "('#{value}' BETWEEN #{initial_date} AND #{final_date})"
#  }
# #  @clients = Client.between_fields(params[:date], :start_date, :final_date)
# # # SELECT * FROM clients WHERE ('2017-02-16 00:00:00' BETWEEN start_date AND final_date)
#   scope :OpenOverdue, ->{(where(:overdue => 1..300, :department => "SWM Solid Waste Management", :status => "Open").count)}
#   scope :SESDumpsterPermitTotal,  ->{(where(:department => "SWM Solid Waste Management", :status => "Open", :trash_quad => "SE", :sr_type => "Dumpster Permit").count)}

end

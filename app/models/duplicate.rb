class Duplicate < ApplicationRecord
  def self.sr_daily_case_number_csv_download
   services_list_values = Duplicate.select('distinct case_number').
     where(
       expression: ['Overdue', 'Not Overdue'],
       sr_type: [
         'Missed Heavy Trash Pickup',
           'Container Problem','New Resident Container',
           'Recycling Participation NEW' ,
           'Recycling Cart Repair or Replace',
           'SWM Escalation','Missed Garbage Pickup',
           'Trash Dumping or Illegal Dumpsite',
            'Add A Can', 'Storm Debris Collection',
             'Dead Animal Collection', 'Add A Can CANCELLATION',
              'Missed Recycling Pickup', 'Personnel or Vehicle Complaint',
              'Physically Challenged Pickup']).
   pluck(:id, :case_number, :sr_type, :trash_quad, :overdue, :expression)
   headers = %w[id case_number sr_type trash_quad overdue expression]
   #file = "#{Rails.root}/duplicates_open_services_daily.csv"
   CSV.open("duplicates_open_services_daily.csv", "wb",
     write_headers: true, headers: headers) do |csv|
        services_list_values.each do |row|
          csv << row
        end
      end

   sales2 =
   Daru::DataFrame.from_csv '../searchwarrant/duplicates_open_services_daily.csv'

   list2 = sales2.pivot_table(index:['sr_type'], values:'case_number',vectors:['trash_quad','expression'],  agg:  :count)

   File.open('../searchwarrant/app/views/srs/duplicates_open_services_daily.html.erb',
              'w+'){|f| f << list2.to_html}

   File.open('../searchwarrant/app/views/srs/duplicates_open_services_daily.html',
              'w+'){|f| f << list2.to_html}
  end
end

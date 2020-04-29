class Resident < ApplicationRecord
  def self.unique
    Resident.distinct.pluck(:unique)
  end
  def self.services_type
    tally_list = Resident.all.map {|resident|
      # binding.pry
      resident.tally = 1
      resident.save
    }
    tally_list_values= Resident.all.
    pluck(:unique, :sr_type, :case_number)

    headers = %w[id unique sr_type case_number]

    CSV.open("../searchwarranty/unique_sr_type.csv",
       "wb", write_headers: true,headers: headers) do
         |csv| tally_list_values.each do |row|
        csv << row
      end
    end

    demand =
    Daru::DataFrame.from_csv'../searchwarranty/unique_sr_type.csv'

    list = demand.pivot_table(index:['unique'],
    values: 'tally',
    vector: ['sr_type'], agg: :sum)

    File.open('../searchwarranty/app/views/srs/demand.html.erb',
    'w+'){|f| f << list.to_html}

    File.open('../searchwarranty/app/views/srs/demand.html',
      'w+'){|f| f << list.to_html}
  end
end

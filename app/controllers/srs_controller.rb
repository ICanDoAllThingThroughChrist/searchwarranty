class SrsController < ApplicationController
  def load_csv
    @data_frame = Daru::DataFrame.from_csv 'C:/Users/e128289/Downloads/data-1583248669665.csv'
    @data_frame2 = @data_frame.pivot_table(index:['sr_type'],values:'tally', vectors:['quad_status'],  agg:  :sum)
  end
  def result
      load_csv
      #binding.pry
  end
  def test
      redirect_to "C:/Users/e128289/searchwarranty/app/views/srs/test.html"
  end

end

class SrsController < ApplicationController
  def load_csv
      @data_frame = Daru::DataFrame.from_csv('C:/Users/e128289/Documents/Summary-1-15.csv')
      #binding.pry
  end

  def result
    #binding.pry
    load_csv
  end

end

class PublicController < ApplicationController
  def first_monday_OverdueHvy
    render "/public/1st-monday-OverdueHvy"
  end
  def second_thurs_OverdueHvy
    render "/public/2nd-thurs-OverdueHvy"
  end
end

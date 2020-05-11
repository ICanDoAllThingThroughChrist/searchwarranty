Rails.application.routes.draw do
  get 'srs/DistrictASrs'
  get 'srs/monthly_requests_summary'
  # get '../maps/1st-Monday-OverdueHvy.js'
  # get '../maps/leaf-demo.js'
  get 'public/first_monday_OverdueHvy'
  get 'srs/cans_requests_FY20'
  get 'map/index'
  get 'map/map_data', :defaults => { :format => 'json'}
  get 'open_srs/over_30_days_srs'
  get 'open_srs/cans_related_requests'
  get 'open_srs/daily_update'
  get 'srs/misc_summary'
  get 'open_srs/monthly_quality_grade'
  get 'open_srs/march_2020'
  get 'open_srs/february_2020'
  get 'open_srs/january_2020'
  get 'open_srs/december_2019'
  get 'open_srs/november_2019'
  get 'open_srs/october_2019'
  get 'open_srs/september_2019'
  get 'open_srs/august_2019'
  get 'open_srs/map'
  get 'open_srs/summary1'
  get 'open_srs/test89'
  get 'open_srs/test88'
  get 'open_srs/test87'
  get 'open_srs/test86'
  get 'open_srs/test85'
  get 'open_srs/test84'
  get 'open_srs/test83'
  get 'open_srs/test82'
  get 'open_srs/test81'
  get 'open_srs/test80'
  get 'open_srs/test79'
  get 'open_srs/test78'
  get 'open_srs/test77'
  get 'open_srs/test76'
  get 'open_srs/test75'
  get 'open_srs/test74'
  get 'open_srs/test73'
  get 'open_srs/test72'
  get 'open_srs/test71'
  get 'open_srs/test70'
  get 'open_srs/test69'
  get 'open_srs/test68'
  get 'open_srs/test67'
  get 'open_srs/test66'
  get 'open_srs/test65'
  get 'open_srs/test64'
  get 'open_srs/test63'
  get 'open_srs/test62'
  get 'open_srs/test61'
  get 'open_srs/test60'
  get 'open_srs/test59'
  get 'open_srs/test58'
  get 'open_srs/test57'
  get 'open_srs/test56'
  get 'open_srs/test55'
  get 'open_srs/test54'
  get 'open_srs/test53'
  get 'open_srs/test52'
  get 'open_srs/test51'
  get 'open_srs/test50'
  get 'open_srs/test49'
  get 'open_srs/test48'
  get 'open_srs/test47'
  get 'open_srs/test46'
  get 'open_srs/test45'
  get 'open_srs/test44'
  get 'open_srs/test43'
  get 'open_srs/test42'
  get 'open_srs/test41'
  get 'open_srs/test40'
  get 'open_srs/test39'
  get 'open_srs/test38'
  get 'open_srs/test37'
  get 'open_srs/test36'
  get 'open_srs/test35'
  get 'open_srs/test34'
  get 'open_srs/test33'
  get 'open_srs/test32'
  get 'open_srs/test31'
  get 'open_srs/test30'
  get 'open_srs/test29'
  get 'open_srs/test28'
  get 'open_srs/test27'
  get 'open_srs/test26'
  get 'open_srs/test25'
  get 'open_srs/test24'
  get 'open_srs/test23'
  get 'open_srs/test22'
  get 'open_srs/Overdue'
  get 'open_srs/test21'
  get 'open_srs/test20'
  get 'open_srs/test19'
  get 'open_srs/test18'
  get 'open_srs/test17'
  get 'open_srs/test16'
  get 'open_srs/test15'
  get 'open_srs/test14'
  get 'open_srs/test13'
  get 'open_srs/test12'
  get 'open_srs/test11'
  get 'open_srs/test10'
  resources :carts, only: [:new, :create]
  get 'srs/result', to: 'srs#result'
  get 'srs/test', to: 'srs#test'
  get 'open_srs/test', to: 'open_srs#test'
  get 'open_srs/test2', to: 'open_srs#test2'
  get 'open_srs/test3', to: 'open_srs#test3'
  get 'open_srs/test4', to: 'open_srs#test4'
  get 'open_srs/test5', to: 'open_srs#test5'
  get 'open_srs/test6', to: 'open_srs#test6'
  get 'open_srs/test7', to: 'open_srs#test7'
  get 'open_srs/test8', to: 'open_srs#test8'
  get 'open_srs/test9', to: 'open_srs#test9'
  get 'open_srs/test10', to: 'open_srs#test10'
  get 'open_srs/test11', to: 'open_srs#test11'
  get 'open_srs/Overdue', to: 'open_srs#overdue'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

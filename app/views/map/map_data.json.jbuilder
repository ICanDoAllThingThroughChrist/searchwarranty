json.type "FeatureCollection"
json.feature @stations  do |station|
    json.type "Feature"
    json.properties do
      json.set! "marker-color", "#9932CC"
      json.set! "market-symbol", "circle"
      json.set! "market-size", "small"
      json.title "#{station['station_Customer_ID']} (#{station['LIFT_COUNT']})"
    end
    json.geometry do
      json.type "Point"
      json.coordinates [station['LONG'], station['LAT']]
    end
  end
  

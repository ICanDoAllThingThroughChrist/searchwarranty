// See post: http://asmaloney.com/2015/06/code/clustering-markers-on-leaflet-maps

var map = L.map( 'map', {
  center: [29.749907, -95.358421],
  minZoom: 2,
  zoom: 10
});
map.setView([29.749907, -95.358421], 15);
map.locate({setView: true, maxZoom:15});
map.on('locationfound', onLocationFound);
function onLocationFound(e){
  //creates a marker at user latlong and add it to the marker
  L.marker(e.latlng).addTo(map)
}
L.tileLayer( 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
 attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
 subdomains: ['a','b','c']
}).addTo( map );


var myURL = jQuery( 'script[src$="leaf-demo.js"]' ).attr( 'src' ).replace( 'leaf-demo.js', '' );

var myIcon = L.icon({
  iconUrl: myURL + 'images/pin24.png',
  iconRetinaUrl: myURL + 'images/pin48.png',
  iconSize: [29, 24],
  iconAnchor: [9, 21],
  popupAnchor: [0, -14]
});

var markerClusters = L.markerClusterGroup();

for ( var i = 0; i < markers.length; ++i )
{
  var popup = markers[i].case_number +
              '<br/><b>Service Day:</b> ' + markers[i].service_da +
              '<br/><b>Section Name:</b> ' + markers[i].poly_id;

  var m = L.marker( [markers[i].latitude, markers[i].longitude], {icon: myIcon} )
                  .bindPopup( popup );

  markerClusters.addLayer( m );
}

map.addLayer( markerClusters );

var geocodeService = L.esri.Geocoding.geocodeService();

map.on('click', function (e) {
   geocodeService.reverse().latlng(e.latlng).run(function (error, result) {
     if (error) {
       return;
     }

     L.marker(result.latlng).addTo(map).bindPopup(result.address.Match_addr).openPopup();
   });
});

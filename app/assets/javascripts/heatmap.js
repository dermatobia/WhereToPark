var home_loc = new google.maps.LatLng(40.7833, -73.9667);

var marker1 = new google.maps.Marker({
position:home_loc,
});

var marker2 = new google.maps.Marker({
  position: {lat: 40.628151, lng: -73.972328}
});


function initialize() {
  var mapOptions = {
    center: home_loc,
    zoom: 10
  };
  
  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

  marker1.setMap(map);
  marker2.setMap(map);
}

google.maps.event.addDomListener(window, 'load', initialize);

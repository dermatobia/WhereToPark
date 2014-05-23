var homeLoc = new google.maps.LatLng(40.7833, -73.9667);
var locations = [];

function getLocations(map) {
	$.ajax({
		type: "GET",
		url: "/map_points",
		dataType: "json",
		success: function(dataPoints){
			locations = dataPoints;
			plotMarker(map);
		}
	});
};

function plotMarker(map){	
	for ( var i = 0; i < locations.length; i++ ){
		marker = new google.maps.Marker({
			position: {lat: locations[i][0], lng: locations[i][1]}
		});
		marker.setMap(map);
	};
};


function initialize() {
  
  var mapOptions = {
    center: homeLoc,
    zoom: 13
  };

  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);  
  getLocations(map);

}

google.maps.event.addDomListener(window, 'load', initialize);

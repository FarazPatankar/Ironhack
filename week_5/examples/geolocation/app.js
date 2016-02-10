$(document).on("ready", function(){

	if ("geolocation" in navigator) {
		//Browser has geolocation

		getUserLocation();
	}
	else {
		console.log("Browser sucks")
		//Browser does not have geolocation
	}

})

//--------------------------------------------------------------------------------------

function getUserLocation() {
	//Third parameter is an object of options
	navigator.geolocation.getCurrentPosition(success, error);
}

function success(position) {
	console.log("Success");
	console.log(position);

	$(".js-lat-value").text(position.coords.latitude);
	$(".js-long-value").text(position.coords.longitude);

	var latitude = position.coords.latitude
	var longitude = position.coords.longitude

	initMap(latitude, longitude);
}

function error(error) {
	console.log("Error", error);
}

function initMap(latitude, longitude) {
  // Create a map object and specify the DOM element for display.
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: latitude, lng: longitude},
    scrollwheel: false,
    zoom: 19,
    mapTypeId: google.maps.MapTypeId.SATELLITE
  });
}
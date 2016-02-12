$(document).on("ready", function() {
	$(".js-listen-btn").on("click", function(event) {
		event.preventDefault();
		var trackName = $(".js-track-name").val();
		trackName = encodeURIComponent(trackName.trim())
		getTracks(trackName);
	})

	$("#js-btn-play").on("click", function() {
		if ($("#js-btn-play").hasClass("playing")) {
			$(".js-player").trigger("pause");
			$("#js-btn-play").removeClass("playing");
		}
		else {
			$(".js-player").trigger("play");
			$("#js-btn-play").addClass("playing");
		}
	})

	$('.js-player').on('timeupdate', printTime);

	$(".js-artist").on("click", function() {
		var id = $(this).data("id")

		setArtistInfo(id);
	})
})

//-------------------------------------------------

function setArtistInfo(id) {
	$(".js-artist-name").empty();
	$(".js-artist-img").empty();
	$(".js-artist-followers").empty();
	$(".js-artist-popularity").empty();

	$.ajax({
		url: "https://api.spotify.com/v1/artists/" + id,
		success: function(response) {
			console.log(response);

			var artistName = response.name;
			var artistImg = response.images[0].url;
			var artistFollowers = response.followers.total;
			var artistPopularity = response.popularity;
			console.log(artistName)
			$(".js-artist-name").text(artistName);
			$(".js-artist-img").prop("src", artistImg);
			$(".js-artist-followers").text("Followers: " + artistFollowers);
			$(".js-artist-popularity").text("Popularity: " + artistPopularity);
			$('.js-modal').modal("show");

		},
		error: function() {
			console.log("Artist Info - Error");
		}
	})
}

function printTime() {
	var current = $(".js-player").prop("currentTime");
	$("progress").prop("value", current)
}

function getTracks(trackName) {
	$.ajax({
		url: `https://api.spotify.com/v1/search?q=${trackName}&type=track`,
		success: function(response) {
			var firstTrack = response.tracks.items[0];
			console.log("track", firstTrack);

			var songTitle = firstTrack.name;
			var artistName = firstTrack.artists[0].name;
			var coverImg = firstTrack.album.images[0].url;
			var trackPreview = firstTrack.preview_url;
			var artistId = firstTrack.artists[0].id

			$(".js-title").text(songTitle);
			$(".js-artist").text(artistName);
			$(".js-artist").data("id", artistId)
			$(".js-album-art").prop("src", coverImg);
			$(".js-player").prop("src", trackPreview);

			var html = `
				<button class="js-more-tracks">See more tracks</button>
			`;
			$(".js-widget").append(html);

		},
		error: function() {
			console.log("Error");
		}
	})
}
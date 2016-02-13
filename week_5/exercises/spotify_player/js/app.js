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

	$(".js-track-list").on("click", ".js-next-track", function() {
		var id = $(this).data("id");
		$(".js-tracks-modal").modal("hide");
		setNextTrack(id);
	})

	$(".js-artist-albums").on("click", function() {
		var id = $(this).data("id");
		$(".js-modal").modal("hide");
		listArtistAlbums(id);
	})
})

//-------------------------------------------------

function listArtistAlbums(id) {
	$(".js-album-list").empty();
	$.ajax({
		url: `https://api.spotify.com/v1/artists/${id}/albums`,
		success: function(response) {
			var albums = response.items

			albums.forEach(function(album) {
				var html = `
					<li>
					<span>${album.name}</span>
					<img class="img-responsive" src="${album.images[0].url}">
					</li>
				`;

				$(".js-album-list").append(html);
			})
			setTimeout(function() {
			    $(".js-albums-modal").modal("show");
			}, 500);
		},
		error: function() {
			console.log("listArtistAlbums is broken")
		}
	})
}

function setNextTrack(id) {
	$.ajax({
		url: `https://api.spotify.com/v1/tracks/${id}`,
		success: function(response) {
			var firstTrack = response;

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
		},
		error: function() {
			console.log("setNextTrack is broken")
		}
	})
}

function setArtistInfo(id) {
	$(".js-artist-name").empty();
	$(".js-artist-img").empty();
	$(".js-artist-followers").empty();
	$(".js-artist-popularity").empty();

	$.ajax({
		url: "https://api.spotify.com/v1/artists/" + id,
		success: function(response) {

			var artistName = response.name;
			var artistImg = response.images[0].url;
			var artistFollowers = response.followers.total;
			var artistPopularity = response.popularity;
			$(".js-artist-name").text(artistName);
			$(".js-artist-img").prop("src", artistImg);
			$(".js-artist-followers").text("Followers: " + artistFollowers);
			$(".js-artist-popularity").text("Popularity: " + artistPopularity);
			$(".js-artist-albums").text("See " + artistName + "'s albums");
			$(".js-artist-albums").data("id", response.id)

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
	$(".js-more").empty();
	$.ajax({
		url: `https://api.spotify.com/v1/search?q=${trackName}&type=track`,
		success: function(response) {
			var firstTrack = response.tracks.items[0];

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
				<button class="js-more-tracks">See more results</button>
			`;
			$(".js-more").append(html);

			//Begin writing code to list all tracks
			var allTracks = response.tracks.items;

			$(".js-more-tracks").on("click", function() {
				listAllTracks(allTracks);
			})
			//Stop writing code to list all tracks

		},
		error: function() {
			console.log("Error");
		}
	})
}

function listAllTracks(tracks) {
	console.log(tracks);
	$(".js-track-list").empty();
	tracks.forEach(function(track) {
		var html = `
			<li>
				<a href="#" data-id="${track.id}" class="js-next-track">${track.name}</a>
				<img class="img-responsive" src="${track.album.images[0].url}">
			</li>
		`;

		$(".js-track-list").append(html);
	})
	$(".js-tracks-modal").modal("show");
}
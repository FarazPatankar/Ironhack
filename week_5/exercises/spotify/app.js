$(document).on("ready", function() {
  $(".js-submit").on("click", function(event) {
    event.preventDefault();
    searchArtist();
  })

  $(".js-artist-list").on("click", ".js-artist-name", function() {
    var artistId = $(this).data("id");
    displayAlbums(artistId);
    $('#albumModal').modal('show');
  })

  $(".js-album-list").on("click", ".js-album-name", function() {
    var albumId = $(this).data("id");
    var albumImg = $(this).data("img");
    $(".js-album-img").prop("src", albumImg);
    displayTracks(albumId);
    $("#albumModal").modal("hide");
    setTimeout(function() {
      $("#tracksModal").modal("show");
    }, 500);
  })

  $(".js-back-to-modal").on("click", function() {
    $("#tracksModal").modal("hide");
    setTimeout(function() {
      $("#albumModal").modal("show");
    }, 500);
  })
})

//---------------------------------------------

function displayTracks(albumId) {
  $.ajax({
    url: `https://api.spotify.com/v1/albums/${albumId}/tracks`,
    success: function(response) {
      listTracks(response.items);
    },
    error: function() {
      alert("Error");
    }
  });
}

function listTracks(tracks) {
  $(".js-track-list").empty();
  tracks.forEach(function(track) {
    var html = `
      <li>
        <a target="_blank" href="${track.preview_url}">${track.name}</a>
      </li>
    `;

    $(".js-track-list").append(html);
  })
}

function displayAlbums(artistId) {
  $.ajax({
    url: `https://api.spotify.com/v1/artists/${artistId}/albums`,
    success: function(response) {
      var newList = setImage(response.items);
      listAlbums(newList);
    },
    error: function() {
      alert("Error");
    }
  });
}

function listAlbums(albums) {
  $(".js-album-list").empty();
  albums.forEach(function(album) {
    var html = `
      <li class="js-album-name" data-id="${album.id}" data-img="${album.images[1].url}">
        <img src="${album.images[1].url}">
        <a href="#">${album.name}</a>
        <br>
        <br>
      </li>
    `;

    $(".js-album-list").append(html);
  })
}

function setImage(albums) {
  var albums_with_images = [];
  albums.forEach(function(album) {
    if(album.images.length > 0) {
      albums_with_images.push(album);
    }
  })
  return albums_with_images;
}

function searchArtist() {
  var searchString = $(".js-artist").val();
  $.ajax({
    url: `https://api.spotify.com/v1/search?type=artist&query=${searchString}`,
    success: function (response) {
      var newList = hasImage(response.artists.items);
      displayResults(newList);
    },
    error: function () {
      alert("Error");
    }
  });
}

function displayResults(artists) {
  $(".js-artist-list").empty();
  artists.forEach(function(artist) {
    var html = `
        <li>
          <h3 data-id="${artist.id}" class="js-artist-name artist-name"><a href="#">${artist.name}</a></h3>
          <img class="artist-img"src=${artist.images[2].url}>
        </li>
    `;
      $(".js-artist-list").append(html);
  })
}

function hasImage(artists) {
  var artists_with_images = []
  artists.forEach(function(artist) {
    if(artist.images.length > 1) {
      artists_with_images.push(artist);
    }
  })
  return artists_with_images;
}
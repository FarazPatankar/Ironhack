function tournamentsIndex () {
  var request = $.get('/api/tournaments.json')
  request.fail(showError)
  request.done(showTournaments)

  var $tourneySection = $('.js-tourney-section')

  function showError (error) {
    console.error('Error fetching tournament list.', '\n' + error.responseText)
    var message = 'There was a problem fetching the list of tournaments.'
    $tourneySection.append(buildErrorHtml(message))
  }

  function showTournaments (tournaments) {
    var html

    if (tournaments.length === 0) {
      html = buildErrorHtml('Looks like there aren\'t any tournaments yet.')
    } else {
      html = buildTourneyListHtml(tournaments)
    }

    $tourneySection.append(html)

    $('[data-hook~=tourney-add]').removeClass('hidden')
  }
}

function deleteTournament(event) {
  var tournamentId = $(this).prop("value")
  var $button = $(this);
  console.log("Hi")
  event.preventDefault();
  var request = $.ajax({
      url: '/api/tournaments',
      type: 'DELETE',
      data: {id: tournamentId},
      success: function() {
        $button.parent().remove();
      },
      error: function() {
        console.log("cry");
      }
    });
}

function addPlayer(event) {
  event.preventDefault();
  var $form = $(event.currentTarget).next();
  $.ajax({
    url: "/api/players",
    success: function(response) {
      $form.toggleClass("hide");
      response.forEach(function(res) {
        var html = `
          <option class="js-option" value="${res.id}">
            ${res.name}
          </option>
        `;
        $form.children(".js-options").append(html);
      })

    },
    error: function() {
      console.log("keep crying")
    }
  })
}

function addToTournament(event) {
  event.preventDefault();
  var tournamentId = $(event.currentTarget).data("id")
  var playerId = $(this).siblings(".js-options").prop("value");
  var $button = $(this);


  $.ajax({
    url: `api/tournaments/${tournamentId}/players/${playerId}`,
    type: "POST",
    success: function(response) {
      console.log(response);
      response.players.forEach(function(player){
      var html = `
        <li>
          Participants: ${player.name}
        </li>
      `;

      $($button).parent().siblings(".js-participants").append(html);
      })

    },
    error: function() {
      console.log("cry some more");
    }
  })
}
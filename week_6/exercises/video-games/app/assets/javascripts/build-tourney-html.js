function buildTourneyHtml (tournament) {
  return '\
    <li>\
      <a href="/tournaments/' + tournament.id + '">' + tournament.name + '</a>\
      <button data-hook="tourney-delete" type="submit" name="tournament" value="'+  tournament.id + '">DELETE</button>\
      <button data-hook="add-player" type="submit" name="players" value="">PLAYERS</button>\
      <form class="js-form hide">\
      	<select class="js-options"></select>\
      	<button type="submit" data-id="'+ tournament.id +'"data-hook="add-player-to-tournament">Add</button>\
      </form>\
      <ul class="js-participants">\
      </ul>\
    </li>\
  '
}

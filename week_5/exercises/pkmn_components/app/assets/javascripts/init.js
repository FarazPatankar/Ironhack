if (window.PokemonApp === undefined) {
	window.PokemonApp = {};
}

PokemonApp.init = function() {
	console.log("Pokemon App Online!");
};

//------------------------------------

$(document).on("ready", function() {
	PokemonApp.init();
});
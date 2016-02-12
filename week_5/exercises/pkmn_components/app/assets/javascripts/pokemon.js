// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


PokemonApp.Pokemon = function(pokemonUri) {
	this.id = PokemonApp.Pokemon.idFromUri(pokemonUri);
};

//new component

PokemonApp.Pokemon.prototype.render = function() {

	//Set the object to equal self
	var self = this;

	$.ajax({
		url: "/api/pokemon/" + this.id,
		success: function(response) {
			self.info = response

			console.log("Pokemon info:");

			$(".js-pkmn-name").text(self.info.name);
			$(".js-pkmn-number").text(self.info.pkdx_id);
			$(".js-pkmn-height").text(self.info.height);
			$(".js-pkmn-weight").text(self.info.weight);
			$(".js-pkmn-hp").text(self.info.hp);
			$(".js-pkmn-atk").text(self.info.attack);
			$(".js-pkmn-def").text(self.info.defense);
			$(".js-pkmn-sp-atk").text(self.info.sp_atk);
			$(".js-pkmn-sp-def").text(self.info.sp_def);
			$(".js-pkmn-spd").text(self.info.speed);

			//Setup for loop in case the pokemon has multiple types
			var types = self.info.types;
			var pkmn_types = "";

			types.forEach(function(type) {
				pkmn_types += type.name + ", ";
			})

			pkmn_types = pkmn_types.slice(0, -2);
			pkmn_types += ".";

			$(".js-pkmn-type").text(pkmn_types);


			//Get resource_uri to set img
			var sprites = self.info.sprites[0].resource_uri;
			self.setImgForPkmn(sprites);

			//Get resource_uri array for descriptions
			var descriptions_array = self.info.descriptions

			//Get latest description
			var latest = 0;
			descriptions_array.forEach(function(description) {
				var badNum = description.resource_uri.slice(20);
				var goodNum = badNum.slice(0, -1);
				if (goodNum > latest) {
					latest = goodNum;
				}
			})

			//Append to turn number into uri again
			var description_uri = "/api/v1/description/" + latest +"/"

			//Set description
			self.setDescriptionForPkmn(description_uri);

			var pkmnId = self.info.name
			$(".js-evolution-btn").attr("data-id", pkmnId);

			var evolutionInfo = JSON.stringify(self.info.evolutions)
			$(".js-evolution-btn").attr("data-info", evolutionInfo)


			$(".js-pokemon-modal").modal("show");
		},
		error: function() {
			console.log("Error in first ajax request.");
		}
	})
};

PokemonApp.Pokemon.idFromUri = function(pokemonUri) {
	var uriSegments = pokemonUri.split("/");
	var secondLast = uriSegments.length -2;
	return uriSegments[secondLast];
};

PokemonApp.PokemonEvolutions = function(id, info) {
	this.id = id;
	this.info = info;
}

PokemonApp.PokemonEvolutions.prototype.render = function() {

	var identity = this.id
	var information = this.info

	if (information.length > 0) {
		information.forEach(function(info) {
			$.ajax({
				url: info.resource_uri,
				success: function(response) {
					console.log(response)
					$(".js-evolution-header").text(identity + " can evolve into:");
					var evolutionName = response.name;

					$.ajax({
						url: response.sprites[0].resource_uri,
						success: function(response) {
							var evoImg = response.image

							var html = `
								<li class="js-evolution-list">
									<span>${evolutionName}</span>
									<img src="http://pokeapi.co${evoImg}">
								</li>
							`;

							$(".js-possible-evolutions").append(html)
						},
						error: function() {
							console.log("NO");
						}
					})


				},
				error: function() {
					console.log("Time to cry");
				}
			})
		})

		$(".js-pokemon-modal").modal("hide");

		setTimeout(function() {
			$(".js-evolution-modal").modal("show");
	    }, 500);
	    $(".js-possible-evolutions").empty();
	}
	else if(information.length < 1) {
		alert("Do you even evolve, bro?");
	}
}

//-------------------------------------------------------


PokemonApp.Pokemon.prototype.setImgForPkmn = function(resource_uri) {
	$.ajax({
				url: resource_uri,
				success: function(response) {
					var img = response.image;
					$(".js-pkmn-img").prop("src", "http://pokeapi.co" + img);
				},
				error: function() {
					console.log("Error in second ajax request.")
				}
			})
}

PokemonApp.Pokemon.prototype.setDescriptionForPkmn = function(resource_uri) {
	$.ajax({
				url: resource_uri,
				success: function(response) {
					$(".js-pkmn-description").text(response.description);
				},
				error: function() {
					console.log("Error in second ajax request.")
				}
			})
}

$(document).on("ready", function() {
	$(".js-show-pokemon").on("click", function(event) {
		var $button = $(event.currentTarget);
		var pokemonUri = $button.data("pokemon-uri");

		var pokemon = new PokemonApp.Pokemon(pokemonUri);
		pokemon.render();
	})
	$(".js-evolution-btn").on("click", function() {
		//////////////WHY DO YOU BREAK?//////////////////////////
			var id = $(this).data("id");
			var info = $(this).data("info");
			var pkmnEvolutions = new PokemonApp.PokemonEvolutions(id, info);
			pkmnEvolutions.render();
	})
})
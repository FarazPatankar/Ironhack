$(document).on("ready", function() {
	$(".js-show-characters").on("click", function() {
		fetchCharacters();
	});

	$(".js-add-kylo").on("click", function() {
		publishPete();
	});

	$(".js-submit").on("click", function(event) {
		event.preventDefault();
		addCharacter();
	})
});

//----------------------------------

function fetchCharacters() {
	$.ajax({
	  url: 'https://ironhack-characters.herokuapp.com/characters',

	  success: function(response) {
	  	console.log("Everything went okay!");

	  	displayCharacters(response);
	  },

	  error: function() {
		console.log('error!')
	  },
	});
}

function displayCharacters(characters) {
	characters.forEach(function(char) {

		var html = `
			<li>
				<h2> ${char.name} </h2>
				<p> ${char.id} </p>
				<p>Occupation: ${char.occupation} </p>
				<p>Weapon: ${char.weapon} </p>
			</li>
		`;

		$(".js-characters-list").append(html);
	});
}

function publishPete() {
	var newCharacter = {
		name: "Pete",
		occupation: "Betraying friends",
		weapon: "Pistol"
	}

	$.ajax({
		type: "POST",

		url: "https://ironhack-characters.herokuapp.com/characters",

		data: newCharacter,

		success: function(response) {
			var html = `
				<li>
					<h2> ${newCharacter.name} </h2>
					<p> ${response.id} </p>
					<p>Occupation: ${newCharacter.occupation} </p>
					<p>Weapon: ${newCharacter.weapon} </p>
				</li>
			`;

			$(".js-characters-list").append(html);

			alert("Success");
		},

		error: function() {
			alert("Failure")
		}
	});
}

function addCharacter() {
	var charName = $(".js-name").val();
	var charOccupation = $(".js-occupation").val();
	var charWeapon = $(".js-weapon").val();


	var newCharacter = {
		name: charName,
		occupation: charOccupation,
		weapon: charWeapon
	}

	$.ajax({
		type: "POST",

		url: "https://ironhack-characters.herokuapp.com/characters",

		data: newCharacter,

		success: function(response) {
			var html = `
				<li>
					<h2> ${newCharacter.name} </h2>
					<p> ${response.id} </p>
					<p>Occupation: ${newCharacter.occupation} </p>
					<p>Weapon: ${newCharacter.weapon} </p>
				</li>
			`;

			$(".js-characters-list").append(html);

			alert("Success");
		},

		error: function() {
			alert("Failure");
		}
	});
}
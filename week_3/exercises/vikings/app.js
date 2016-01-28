var max_viking_health = 1000;
var min_viking_health = 100;

var max_saxon_health = max_viking_health / 2;
var min_saxon_health = min_viking_health / 2;

var max_viking_strength = 100;
var min_viking_strength = 10;

var max_saxon_strength = max_viking_strength / 2;
var min_saxon_strength = min_viking_strength / 2;

var max_turns = 8;
var min_turns = 5;

var vikings_name = ["Javi", "Josh", "Faraz", "Nizar", "Pete"];

var Viking = function(name) {
	this.name = name;
	this.health = Math.random() * (max_viking_health - min_viking_health) + min_viking_health;
	this.strength = Math.random() * (max_viking_strength - min_viking_strength) + min_viking_strength;
	this.warcry = "Shout";
}

var Saxon = function() {
	this.health = Math.random() * (max_saxon_health - min_saxon_health) + min_saxon_health;
	this.strength = Math.random() * (max_saxon_strength - min_saxon_strength) + min_saxon_strength;
}

function fight() {
	var viking_name = vikings_name[Math.floor(Math.random()*vikings_name.length)];
	var viking = new Viking(viking_name);
	var saxon = new Saxon();
	var turns = Math.random() * (max_turns - min_turns) + min_turns;
	var viking_wins;

	function fight_turn() {
		if (turns && viking.health > 0 && saxon.health > 0) {
			saxon.health -= viking.strength;
			viking.health -= saxon.strength;

			turns--;

			fight_turn();
		} else {
			if (viking.health > saxon.health) {
				console.log(viking.name + " wins! ( " + viking.health + " / " + saxon.health + " )");
				viking_wins = true;
			}
			else {
				console.log("Saxon wins! ( " + viking.health + " / " + saxon.health + " )");
				viking_wins = false;
			}
		}
	}

	fight_turn();

	return viking_wins;
};

var fights_number = 100;
var viking_wins = 0;

for(var i=fights_number; i; i--) {
	if (fight()) {
		viking_wins++;
	}
}

console.log("\nViking wins = " + viking_wins + "\n");
console.log("Percentage of Viking wins = " + (viking_wins/fights_number)*100 + "%\n");




var fs = require('fs');


function searchFor_episode(episodes, str) {
	return episodes.filter(function(e) {
		return e.description.indexOf(str) !== -1;
	});
}

function sort_episodes(episodes) {
	return episodes.sort(function(e1, e2) {
		return e1.episode_number-e2.episode_number;
	});
}

function filter_episodes(episodes, rating) {
	return episodes.filter(function(e) {
		return e.rating < rating;
	});
}

function print_rating(rating) {
    var s = '';

    for (var i=0; i<Math.round(rating); i++) {
    	s += "*";
    }

    return s;
}

function print_episode(episode) {
	var str = "";

	str += "Title: " + episode.title + " Episode #:" + episode.episode_number + "\n";
	str += episode.description + "\n";
	str += "Rating: " + episode.rating + " " + print_rating(episode.rating) + "\n";

	console.log(str);
}

function print_episodes(episodes) {
    episodes.forEach(function(episode){
    	print_episode(episode);
    });
}

function fileActions(err, file) { 
    if (err) {
        throw err;
    }

    var episodes = JSON.parse(file);

    console.log("SORTED EPISODES:");
    console.log("---------------");

    print_episodes(sort_episodes(episodes));

    console.log("FILTERED EPISODES (rating < 8.5):");
    console.log("---------------");

    print_episodes(filter_episodes(episodes, 8.5));

    var jon_snow = "Jon Snow";

    console.log(jon_snow + " EPISODES:");
    console.log("---------------");

    print_episodes(searchFor_episode(episodes, jon_snow));
}

fs.readFile("./GoTEpisodes.json", 'utf8', fileActions);

var phrases = [
	"Wow",
	"Not so wow",
	"Wow Wow Wow"
]


var phrase = phrases[Math.floor(Math.random()*phrases.length)];
$(".phrase").append(`<p>${phrase}</p>`);


$(".refresh-btn").on("click", function() {
	location.reload();
})

$("#target").on("submit", function (event) {
	event.preventDefault();

	new_phrase = $(".add-phrase").val();
	phrases.push(new_phrase);
})

$(".link").on("click", function() {
	if ($(".link").hasClass("hide-phrase") == true) {
		for(var i = 0; i < phrases.length; i++) {
			if(phrases[i] == phrase) {
				$(".link").after(`<div class="phrase-element"><span class="actual-phrase-${i}" style="color: red;">${phrases[i]}</span><button class="glyphicon glyphicon-remove-circle remove-btn"></button></div>`);
			}
			else {
				$(".link").after(`<div class="phrase-element"><span class="actual-phrase-$">${phrases[i]}</span><button class="glyphicon glyphicon-remove-circle remove-btn"></button></div>`);
			}
			$(".link").removeClass("hide-phrase");
		}

	$(".phrase-element").on("click", function() {
		var value = $(this).text();
		for(var j = 0; j < phrases.length; j++) {
			if(phrases[j] == value) {
				phrases.splice(j, 1);
			}
		}

		$(this).remove();
	})

	}
	else {
		$(".phrase-element").remove();
		$(".link").addClass("hide-phrase");
	}
})
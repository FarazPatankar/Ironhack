var phrases = [
	"Wow",
	"Not so wow",
	"Wow Wow Wow"
]


phrase = phrases[Math.floor(Math.random()*phrases.length)];
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
			$(".link").after(`<div class="phrase-element"><span>${phrases[i]}</span> <button class="glyphicon glyphicon-remove-circle remove-btn"></button></div>`);
			$(".link").removeClass("hide-phrase");
		}

	$(".phrase-element").on("click", function() {
		$(this).remove();
	})

	}
	else {
		$(".phrase-element").remove();
		$(".link").addClass("hide-phrase");
	}
})
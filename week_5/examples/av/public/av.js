$(".js-play").on("click", function() {
	$(".js-vid").trigger("play");
});

$(".js-pause").on("click", function() {
	$(".js-vid").trigger("pause");
});
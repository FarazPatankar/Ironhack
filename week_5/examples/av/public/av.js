$(".js-play").on("click", function() {
	$(".js-vid").trigger("play");
});

$(".js-pause").on("click", function() {
	$(".js-vid").trigger("pause");
});

$(".js-add-vid").on("click", function() {
	var prompt = window.prompt("Enter a link...");
	// jPrompt('Link goes here:', '', 'Add a video', function(prompt) {
    	if(prompt) {
    		var html = `
    			<video class="js-user-vid" src="${prompt}" controls></video>
    			<button class="js-user-play">Play</button>
    			<button class="js-user-pause">Pause</button>
    		`;

    		$(".js-user-vids").append(html);
    	}
    	else {
    		alert("What is wrong with you?!")
    	}
	// });
})

$(".js-user-vids").on("click", ".js-user-play", function(event) {

})
// app.js

console.log('APP JS START');


$(document).ready(function () {

  var html = `
  <p> this is the price</p>
  <p> this is another paragraph</p>`;

  console.log("JS APPEND TO ME", $('.js-append').length)

  $('.js-append').append(html);
});

$('.fade-stuff').on('click', function(){
  $(".whole-body :not('.fade-stuff')").fadeToggle(2000);
});

$(".unicorn-mode").on("click", function(){
	var classes = ["make-red", "make-blue", "make-green", "make-orange"];
		var j = 0;
	$(".whole-body *").each(function(i, el) {
		$(el).toggleClass(classes[j])
		if(j < 3) {
			j++;
		}
		else if (j === 3) {
			j = 0;
		}
	})
})
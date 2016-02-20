// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on("ready", function() {
	$(".js-create-item").on("click", function(event) {
		event.preventDefault();
		var id = $(this).data("id");
		var itemName = $("#item_name").val()
		addItemToBbq(id,itemName);
	})
})

function addItemToBbq(id, itemName) {
	$.ajax({
		url: `/api/barbecues/${id}/create`,
		type: "POST",
		data: {item:
			{ name: itemName }
		},
		success: function(response){
			var html = `
				<li>${response.name}</li>
			`;

			$(".js-item-list").append(html)
		},
		error: function(){
			console.log("addItemtoBbq is broken");
		}
	})
}
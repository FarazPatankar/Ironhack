$(document).on("ready", function() {
	$(".js-add-ingredient").on("click", function() {
		var ingredientId = $(this).data("id");
		var sandwichId = $(".js-sandwich-id").data("id");
		addIngredient(ingredientId, sandwichId);
	})
})

//---------------

function addIngredient(ingredientId, sandwichId) {
	$.ajax({
		url: `/api/sandwiches/${sandwichId}/ingredients/add`,
		type: "POST",
		data: {ingredient_id: ingredientId},
		success: function(response) {
			console.log(response);
			var ingredients = response.ingredients
			var ingredient_number = response.ingredients.length-1
			var html = `
				<li>
					Name: ${ingredients[ingredient_number].name}, Calories: ${ingredients[ingredient_number].calories}
				</li>
			`;
			$(".js-ingredients-list").append(html);

			var total_calories = response.total_calories

			$(".js-total-calories").text("Calories: " + total_calories)
		},
		error: function() {
			console.log("Add Ingredient is broken");
		}
	})
}
var exampleArray = [2, -5, 10, 5, 4, -10, 0];
function process(input) {
	var answers = [];
	for (var i = 0; i < input.length; i++) {
		for (var j = i; j < input.length; j++) {
			if (input[i] + input[j] === 0) {
				answers.push(i + "," + j);
			}
		}
	}
	return answers;
}

var answer = process(exampleArray);

console.log(answer);
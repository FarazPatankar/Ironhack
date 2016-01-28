function blastOff(number) {
	if (number !== 0) {
		function seconds() {
		console.log(number);
	}
		number = number - 1;
	}
	setTimeout(seconds, 1000);
	function blast() {
		console.log("Blast Off!");
	}
	setTimeout(blast, 5000);
}

blastOff(5)()();
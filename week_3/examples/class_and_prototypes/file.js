var Car = function(options) {
	this.model = options.model;
	this.noise = options.noise;
	this.wheels = 4;
	this.makeNoise = function() {
		console.log(this.model +" makes the noise: " + this.noise);
	}
};

var ford = new Car ({
	model: "ford",
	noise: "vroom"
});

var tesla = new Car ({
	model: "Tesla",
	noise: "zoom"
});

ford.makeNoise();
tesla.makeNoise();

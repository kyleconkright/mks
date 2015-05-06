$(document).ready(function(){
	$.ajax({
		url: "https://api.scalablepress.com/v2/products/american-apparel-50-50-t-shirt",
		type: "GET",
		dataType: "json",
		success: function(result) {
			$.each(result.colors, function(){
				console.log(this)
				$('<li><img src="'+this.images[0].url+'"></li>').appendTo('ul')
			})
		}
	})
});
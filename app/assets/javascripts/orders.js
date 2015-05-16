$(document).ready(function(){
	
	//ADD ADDRESS

	$('#address_form').on('submit', function(evt){
			evt.preventDefault();
			var street1 = $('#address_form input[name=street1]').val();
			var street2 = $('#address_form input[name=street2]').val();

	})


	//SUBMIT SIZE AND QUANTITY TO GET QUOTE
	$('#quote_form').on('submit', function(evt){
		evt.preventDefault();

		var size = $('#quote_form input[name=size]').val();
		var qty = $('#quote_form input[name=qty]').val();

		$.post("/getquote?" + "size="+size+"&qty="+qty, function(data){
			// console.log(data);
			if(data.statusCode === 400)
				return data
			else
				finalPurchase(data)
		});

	});


	//CONFIRM PURCHASE
	var finalPurchase = function(data){
		var orderToken = data.orderToken
		var purchase_form = $('#purchase_form');
		$('#quote_form').fadeOut(200,function(){purchase_form.fadeIn(200)});
		
		purchase_form.find('p.total').text(data.total)

		purchase_form.on('submit', function(evt){
			evt.preventDefault();
			console.log(orderToken)
			$.post("/confirm?" + "order_token="+orderToken, function(data){
				console.log(data);
				orderConfirmed(data);
			})
		})
	}


	//SUCCESS
	var orderConfirmed = function(data){
		$('#purchase_form').fadeOut(200, function(){$('#purchase_confirmed').fadeIn(200)})
	}

}); //ready


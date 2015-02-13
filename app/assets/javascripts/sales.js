// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var TILLR = {
	captureClicks: function() {
	   jQuery('.sale').click(function(event) {
	   	 event.preventDefault();
	     TILLR.saveTransaction($(this).attr('id'), $(this).attr('data-price') )
	    });
    },
    saveTransaction: function(item, price) {
    	var transaction = {};
    	transaction.timestamp = new Date().getTime();
    	transaction.item = item;
    	transaction.price = price;
    	localStorage.setItem( transaction.timestamp, transaction.item );
    	console.log(transaction.item+" saved at £"+transaction.price);
    	this.updateTotal();
    },
    pushTransactions: function() {
    	total = 0;
    	while (localStorage.length > 0) {
	    	for (var i = 0; i < localStorage.length; i++){
				var sale = { 'timestamp': localStorage.key(i), 'item': localStorage.getItem(localStorage.key(i))};
				localStorage.removeItem(sale.timestamp)
				console.log(sale.item+" sent")
				if ($('.save').attr('id') != "") { 
					sale.tab = $('.save').attr('id');
				}
				$.ajax({
				  type: "POST",
				  dataType: 'script',
				  url: '/sales',
				  data: sale,
				  success: function(data) { 
				  	console.log(sale.item+" stored") 
				  	$('#'+sale.item).css('background-color', '#98ff98');
				  	setTimeout (function() {
					   $('#'+sale.item).css('background-color', '#CCC');
					 }, 300);
				  },
				  error: function(data) {
				  	localStorage.setItem( sale.timestamp, sale.item );
				  	console.log(sale.item+" resaved") 
				  }
				});
				this.updateTotal();
			}
		}
    },
    updateTotal: function() {
		var total = 0;
		for (var i = 0; i < localStorage.length; i++){
			var sale = { 'timestamp': localStorage.key(i), 'item': localStorage.getItem(localStorage.key(i))};
			total = parseInt($('#'+sale.item).attr('data-price')) + total;
		}
    	$('.transaction').text("£"+total);
    }
}

$(document).ready( function () {
	 TILLR.captureClicks();
	 TILLR.updateTotal();
	 $('.pay').click( function(event) {
	 	event.preventDefault();
	 	TILLR.pushTransactions()
	 });
	 $('.save').click( function(event) {
	 	event.preventDefault();
	 	TILLR.pushTransactions();
	 });
})
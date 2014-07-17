// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var TILLR = {
	captureClicks: function() {
	   jQuery('.sale').click(function(event) {
	   	 event.preventDefault();
	     TILLR.saveTransaction($(this).attr('id'))
	    });
    },
    saveTransaction: function(item) {
    	var transaction = {};
    	transaction.timestamp = new Date().getTime();
    	transaction.item = item;
    	localStorage.setItem( transaction.timestamp, transaction.item );
    	console.log(transaction.item+" saved") 
    },
    pushTransactions: function() {
    	for (var i = 0; i < localStorage.length; i++){
    		// console.log(localStorage.key(i));
    		// console.log(localStorage.getItem(localStorage.key(i)));
			var sale = { 'timestamp': localStorage.key(i), 'item': localStorage.getItem(localStorage.key(i))};
			localStorage.removeItem(sale.timestamp)
			console.log(sale.item+" sent") 
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
		}
    }
}

$(document).ready( function () {
	 TILLR.captureClicks();
	 setInterval( function() {
	 	TILLR.pushTransactions()
	 }, 1000);
})
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
    	var transaction = {timestamp: 1, item:item, price:price};
    	var transactions = this.getTransactions();
    	console.log(transaction);
    	transactions.push(transaction);
    	this.saveTransactions(transactions);
    	this.updateTotal();
    },
    getTransactions: function() {
    	var transactions_json = localStorage.getItem('sales');
    	var transactions =  $.parseJSON(transactions_json);
    	return(transactions);
    },
    saveTransactions: function(transactions) {
    	var transactions_json = JSON.stringify(transactions);
    	localStorage.setItem( 'sales', transactions_json );
    },
    pushTransactions: function() {
    	total = 0;
   		transactions = this.getTransactions(); 
   		while(transactions.length > 0) {
	    	for (var i = 0; i < transactions.length; i++){
				var transaction = transactions.pop();
				console.log(transaction);
				if ($('.save').attr('id') != "") { 
					transaction.tab = $('.save').attr('id');
					$('h3').remove();
				}
				$.ajax({
				  type: "POST",
				  dataType: 'script',
				  url: '/sales',
				  data: transaction,
				  success: function(data) { 
				  	console.log(transaction.item+" stored") 
				  	$('body').css('background-color', '#98ff98');
				  	setTimeout (function() {
					   $('body').css('background-color', '#FFF');
					 }, 300);
				  },
				  error: function(data) {
				  }
				});
			}
			this.saveTransactions(transactions);
			this.updateTotal();
		}
    },
    updateTotal: function() {
		var total = 0;
		transactions = this.getTransactions(); 
		for (var i = 0; i < transactions.length; i++){
			transaction = transactions[i]
			total = parseInt(transaction.price) + total;
		}
    	$('.transaction').text("£"+total);
    }
}

$(document).ready( function () {
	transactions = new Array();
	localStorage.setItem( "sales", JSON.stringify(transactions));
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
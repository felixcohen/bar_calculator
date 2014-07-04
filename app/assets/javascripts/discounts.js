// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
	setTimeout(function() {
	  $(".alert").slideUp();
	}, 2500);
	$('.close').click(function() {
	  $(".alert").slideUp();
	})
})
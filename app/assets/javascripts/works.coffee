# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->

	$('#filter-button').click ->
		$('.filter .wrap').slideToggle('slow');


	$('a.fancybox-image').fancybox()

	input1 = document.getElementById('search-new');

	autocomplete1 = new google.maps.places.Autocomplete(input1);

	input2 = document.getElementById('search-edit');

	autocomplete2 = new google.maps.places.Autocomplete(input2);
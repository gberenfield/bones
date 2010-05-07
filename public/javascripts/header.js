$(document).ready(function(){
	
	$('.mydatepicker').datepicker({
		showButtonPanel: true,
		dateFormat: "yy-mm-dd"
	});

	$('.rte').rte({
		controls_rte: rte_toolbar,
		controls_html: html_toolbar
	});
});
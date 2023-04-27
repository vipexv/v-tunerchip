
$(document).ready(function() {
	// alert($('#ex1').val())
	console.log("UI Was Re-Written by vipex#2027");
	alert (colorCodes.back);
	window.addEventListener("message", function(event) {
		// var data = event.data;
		if (event.data.type == "enableui") {
		console.log("testeeee");
		// if (data.show) {
		// 	alert(data.valueHandling)
		// }
		}
	
	});
  
});


// With JQuery
$('#ex1').slider({
	formatter: function(value) {
		return 'Current value: ' + value;
	}
});
// With JQuery
$('#ex2').slider({
	formatter: function(value) {
		return 'Current value: ' + value;
	}
});
// With JQuery
$('#ex3').slider({
	formatter: function(value) {
		return 'Current value: ' + value;
	}
});
// With JQuery
$('#ex4').slider({
	formatter: function(value) {
		return 'Current value: ' + value;
	}
});
// With JQuery
$('#ex5').slider({
	formatter: function(value) {
		return 'Current value: ' + value;
	}
});


$(".but1").on("click", ":button", function() {

	alert($('#ex1').val())
	// $.post(
	// 	"http://tab/carst",
	// 	JSON.stringify({})
	//   );
});

function myFunction() {
	// alert($('#ex1').val());

	$.post(
		"https://tab/carst",
		JSON.stringify({model: $('#ex1').val(),ex4: $('#ex4').val() } )
	  );
	  
  }




        // When the document is ready
        var ex1 = 0;
        var ex2 = 0;
        var ex3 = 0;
        var ex4 = 0;
        var ex5 = 0;

        var ex1Aux = 0;
        var ex2Aux = 0;
        var ex3Aux = 0;
        var ex4Aux = 0;
        var ex5Aux = 0;
        
        var colorCodes = {

            back  : "#fff",
            front : "#888",
            side  : "#369"
          
          };
        $(document).ready(function () {
            var iframe = $("#iframe")[0];
            var $tabContainer = $("#tab-container");
            toastr.options = 
            {
              "closeButton": false,
              "debug": false,
              "newestOnTop": false, 
              "progressBar": true, 
              "positionClass": "toast-container",
              "preventDuplicates": false, 
              "onclick": null,
              "showDuration": "300", 
              "hideDuration": "1000", 
              "timeOut": "1000", 
              "extendedTimeOut": "1000",
              "showEasing": "swing",
              "hideEasing": "linear",
              "showMethod": "fadeIn",
              "hideMethod": "fadeOut",
          }

           
            // Show or hide the page
            function SHOW_HIDE(bool) {
                if (bool) {
                    $tabContainer.show();
                } else {
                    $tabContainer.hide();
                    window.blur() // unfocus the window
                }
            }

            SHOW_HIDE(false); // hide the tablet initial

        
            // Listens for NUI messages from Lua 
            window.addEventListener('message', function (event) {
                $('#myAlert').hide()
                
                if(event.data.show) {
                    valHand = event.data.valueHandling
                    ex1 = event.data.ex1
                    ex2 = event.data.ex2
                    ex3 = event.data.ex3
                    ex4 = event.data.ex4
                    ex5 = event.data.ex5
                    
                    // $('#ex3').val(10)
                    // $("#ex3").attr('data-slider-value', 8);
                    // alert(maxSliderValue)

                    $("#ex1").slider('setAttribute', 'max', ex1 + 10);
                    $("#ex1").slider('setAttribute', 'min', ex1 - 10);

                    $("#ex2").slider('setAttribute', 'max', ex2 + 0.8);
                    $("#ex2").slider('setAttribute', 'min', ex2 - 0.8);

                    $("#ex3").slider('setAttribute', 'max', ex3 + 4);
                    $("#ex3").slider('setAttribute', 'min', ex3 - 4);

                    $('#ex1').slider('setValue', ex1);
                    $('#ex2').slider('setValue', ex2);
                    $('#ex3').slider('setValue', ex3);
                    $('#ex4').slider('setValue', ex4);
                    $('#ex5').slider('setValue', ex5);
                }
                
                var item = event.data;
                if (item.showtab) {
                    SHOW_HIDE(true)
                } // lua requested show
                else if (item.hidetab) {
                    SHOW_HIDE()
                } // lua requested hide
            });

            const vipex = document.getElementById('but3');

            vipex.addEventListener('click', () => {
                SHOW_HIDE();
                $.post("https://v-tuner/tablet-bus", JSON.stringify({
                    hide: true
                })
                )});

            // When pressed ESC dispatch escape request
            document.addEventListener('keyup', function (data) {
                if (data.which == 27) {
                    SHOW_HIDE(); // hide ui
                    $.post("https://v-tuner/tablet-bus", JSON.stringify({
                        hide: true
                    })) // tell lua to unfocus
                }
            });

            // When clicked the dot
            $('.tab-wrap .dot').click(function () {
                if (iframe.src == 'about:blank') {
                    SHOW_HIDE(); // hide ui
                    $.post("https://v-tuner/tablet-bus", JSON.stringify({
                        hide: true
                    })) // tell lua to unfocus
                } else {
                    iframe.src = 'about:blank'; // trigger HandleLocationChange
                }
            });

            // Handle icon click
            $('a.nav-myframe').click(function (event) {
                event.preventDefault();
                event.stopPropagation();
                var self = this;
                var icon = $(self).find("img, .myicon");
                icon.addClass("jump")
                // bounce dat ass
                setTimeout(function () {
                    iframe.src = self.href || "about:blank"; // trigger HandleLocationChange
                    icon.removeClass("jump");    
                }, 600)

                return false;
            });

            // Tell lua the nui loaded
            $.post("https://v-tuner/tablet-bus", JSON.stringify({
                load: true
            }))
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
	// 	"https://tab/carst",
	// 	JSON.stringify({})
	//   );
});

function myFunction() {
    // alert($('#ex1').val());
    ex1Aux = $('#ex1').val();
    ex2Aux = $('#ex2').val();
    ex3Aux = $('#ex3').val();
    ex4Aux = $('#ex4').val();
    ex5Aux = $('#ex5').val();

	$.post(
		"https://v-tuner/carst",
		JSON.stringify({ex1: $('#ex1').val(),ex2: $('#ex2').val(),ex3: $('#ex3').val(),ex4: $('#ex4').val(),ex5: $('#ex5').val() } )
      );
      // Display a success toast, with a title
      toastr.success('Your settings are now saved!', 'Tuner Chip', {
        iconClass: 'toast-pink',
       
      });
  }

  

function DefaultSettings() {
    // alert($('#ex1').val());
    $('#ex1').slider('setValue', ex1);
                    
    // $("#ex1").slider('setAttribute', 'max', ex1 + 30);
    // $("#ex1").slider('setAttribute', 'min', ex1 - 30);
    $('#ex2').slider('setValue', ex2);
    $('#ex3').slider('setValue', ex3);
    $('#ex4').slider('setValue', ex4);
    $('#ex5').slider('setValue', ex5);

	$.post(
		"https://v-tuner/carst",
		JSON.stringify({ex1: $('#ex1').val(),ex2: $('#ex2').val(),ex3: $('#ex3').val(),ex4: $('#ex4').val(),ex5: $('#ex5').val() } )
      );
     // Display a success toast, with a title

    //  toastr.success('Have fun storming the castle!', 'Miracle Max Says')
     toastr.success('Your settings are now default!', 'Tuner Chip', {
        iconClass: 'toast-pink',
       
      });

     
// toastr.success('Have fun storming the castle!', 'Miracle Max Says',{"iconClass": 'customer-info'})
}


function Slow() {
    var minSliderValue = $("#ex1").data("slider-min");
    var maxSliderValue = $("#ex1").data("slider-max");
    $('#ex1').slider('setValue', ex1 - 5);
    $('#ex2').slider('setValue', ex2 - 0.2);
    $('#ex3').slider('setValue', ex3 - 2);
    $('#ex4').slider('setValue', ex4 - 0.5);
    $('#ex5').slider('setValue', ex5 - 0.03);

	$.post(
		"https://v-tuner/carst",
		JSON.stringify({ex1: $('#ex1').val(),ex2: $('#ex2').val(),ex3: $('#ex3').val(),ex4: $('#ex4').val(),ex5: $('#ex5').val() } )
      );
     // Display a success toast, with a title

    //  toastr.success('Have fun storming the castle!', 'Miracle Max Says')
     toastr.success('Your settings are now default!', 'Tuner Chip', {
        iconClass: 'toast-pink',
       
      });

     
// toastr.success('Have fun storming the castle!', 'Miracle Max Says',{"iconClass": 'customer-info'})
}

function Drift() {
    // alert($("#ex1").slider('getAttribute', 'max', ex1 + 10));
    // $("#ex1").slider('setAttribute', 'min', ex1 - 10);
    // var minSliderValue = $("#ex1").data("slider-min");
    // var maxSliderValue = $("#ex1").data("slider-max");
    // // alert(maxSliderValue)
    // // alert($('#ex1').val())
    // var teste = $("#ex1").slider('getAttribute', 'max', ex1 + 10) / 2;
    // alert(teste)
    
    $('#ex1').slider('setValue', ex1 + 8);
    $('#ex2').slider('setValue', ex2 + 0.6);
    $('#ex3').slider('setValue', ex3 + 1);
    $('#ex4').slider('setValue', 0.4);
    $('#ex5').slider('setValue', 0.6);

	$.post(
		"https://v-tuner/carst",
		JSON.stringify({ex1: $('#ex1').val(),ex2: $('#ex2').val(),ex3: $('#ex3').val(),ex4: $('#ex4').val(),ex5: $('#ex5').val() } )
      );
     // Display a success toast, with a title

    //  toastr.success('Have fun storming the castle!', 'Miracle Max Says')
     toastr.success('Your settings are now default!', 'Tuner Chip', {
        iconClass: 'toast-pink',
       
      });

     
// toastr.success('Have fun storming the castle!', 'Miracle Max Says',{"iconClass": 'customer-info'})
}

function Sport() {
    // alert($("#ex1").slider('getAttribute', 'max', ex1 + 10));
    // $("#ex1").slider('setAttribute', 'min', ex1 - 10);
    // var minSliderValue = $("#ex1").data("slider-min");
    // var maxSliderValue = $("#ex1").data("slider-max");
    // // alert(maxSliderValue)
    // // alert($('#ex1').val())
    // var teste = $("#ex1").slider('getAttribute', 'max', ex1 + 10) / 2;
    // alert(teste)
    
    $('#ex1').slider('setValue', ex1 + 10);
    $('#ex2').slider('setValue', ex2 + 0.8);
    $('#ex3').slider('setValue', ex3 + 3);
    $('#ex4').slider('setValue', 0.3);
    $('#ex5').slider('setValue', 0.3);

	$.post(
		"https://v-tuner/carst",
		JSON.stringify({ex1: $('#ex1').val(),ex2: $('#ex2').val(),ex3: $('#ex3').val(),ex4: $('#ex4').val(),ex5: $('#ex5').val() } )
      );
     // Display a success toast, with a title

    //  toastr.success('Have fun storming the castle!', 'Miracle Max Says')
     toastr.success('Your settings are now default!', 'Tuner Chip', {
        iconClass: 'toast-pink',
       
      });

     
// toastr.success('Have fun storming the castle!', 'Miracle Max Says',{"iconClass": 'customer-info'})
}

// function LoadLast() {
//     // alert($('#ex1').val());
//     $('#ex1').slider('setValue', ex1Aux);
//     $('#ex2').slider('setValue', ex2Aux);
//     $('#ex3').slider('setValue', ex3Aux);
//     $('#ex4').slider('setValue', ex4Aux);
//     $('#ex5').slider('setValue', ex5Aux);

	
    
//      toastr.success('Your settings are now default!', 'Tuner Chip', {
//         iconClass: 'toast-pink',
       
//       });
// }

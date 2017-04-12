//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require ./cable
//= require underscore
//= require moment
//= require bootstrap-datetimepicker
//= require pickers
//= require gmaps/google


$(".alert" ).slideUp(3000);
$(".notice" ).slideUp(1000);

$(document).ready(function(){
  if ($('#validation-sign-up').hasClass('validation-failed')) {
    $('#mySignUpModal').modal('show');
  }
  $(function(){
    $(".tab").on("click", function(e){
          // Change active tab
          $(".tab").removeClass("active");
          $(this).addClass("active");


          var content = $(this).data("target");
          $(".tab-content").addClass("hidden");
          $(content).removeClass("hidden");

          var tabSelector = $(this).data("target");
          $(tabSelector).removeClass("hidden");
        });
  });

  var scroll_start = 0;
  var startchange = $('.navbar-wagon');
  var offset = startchange.offset();
  $(document).scroll(function() {
    scroll_start = $(this).scrollTop();
    if(scroll_start > offset.top) {
      $('.navbar-wagon').css('background-color', 'rgba(255,255,255,0.9)');
    } else {
      $('.navbar-wagon').css('background-color', 'transparent');
    }
  });
});




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
        $(".tab-content").addClass('hidden');
        $(".tab").on("click", function(e){
          // Change active tab
          var content = $(this).data("target");
          $(".tab-content").addClass("hidden");
          $(content).removeClass("hidden");

          var tabSelector = $(this).data("target");
          $(tabSelector).removeClass("hidden");
        });
      });
})




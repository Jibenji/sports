//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require ./cable
//= require underscore
//= require moment
//= require bootstrap-datetimepicker
//= require pickers
//= require gmaps/google
//= require btndown


$(".alert" ).slideUp(3000);
$(".notice" ).slideUp(1000);

$(document).ready(function(){
  if ($('#validation-sign-up').hasClass('validation-failed')) {
    $('#mySignUpModal').modal('show');
  }

  //home-page-sports-tabs responsivness
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


  //training-page-tabs responsivness
  $(function(){
    $(".training-tab").on("click", function(e){
          // Change active training-tab
          $(".training-tab").removeClass("active");
          $(this).addClass("active");


          var content = $(this).data("target");
          $(".training-tab-contents").addClass("hidden");
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
      $('.navbar-wagon').css('background-color', 'rgb(255,255,255)');
    } else {
      $('.navbar-wagon').css('background-color', 'transparent');
    }
  });
});

$("#search_query_date").on('click', function() {
  $('.datetimepicker button').click()
})





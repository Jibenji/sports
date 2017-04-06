//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require ./cable
//= require underscore
//= require gmaps/google


$(".alert" ).slideUp(3000);
$(".notice" ).slideUp(1000);

$(document).ready(function(){
  if ($('#validation-sign-up').hasClass('validation-failed')) {
  $('#mySignUpModal').modal('show');
  }
})

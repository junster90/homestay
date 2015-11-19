// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-datepicker
//= require bootstrap-sprockets


$(document).on('page:change', function() {
  $('.myCarousel').carousel({interval: 2000});

  $('.input-daterange').datepicker({
    format: "yyyy/mm/dd",
    autoclose: true,
    startDate: '+1d'});

  $('#booking_check_in').datepicker({
    format: "yyyy/mm/dd",
    autoclose: true,
    datesDisabled: $('.disabled_dates').data('dates'),
    startDate: '+1d'});
  $('#booking_check_out').datepicker({
  format: "yyyy/mm/dd",
  datesDisabled: $('.disabled_dates').data('dates'),
  startDate: '+2d'});
});




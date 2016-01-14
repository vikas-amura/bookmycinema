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

//= require jquery
//= require semantic_ui/semantic_ui
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require bootstrap-sprockets
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require dataTables/jquery.dataTables
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  $('.form-validatable').validate();

  $(function() {
  $("#movies th a, #movies .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#movies_search input").keyup(function() {
    $.get($("#movies_search").attr("action"), $("#movies_search").serialize(), null, "script");
    return false;
  });
});
 });
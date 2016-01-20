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
//= require turbolinks
//= require jquery-star-rating


  (function(a){a.fn.webwidget_rating_simple=function(p){var p=p||{};var b=p&&p.rating_star_length?p.rating_star_length:"5";var c=p&&p.rating_function_name?p.rating_function_name:"";var e=p&&p.rating_initial_value?p.rating_initial_value:"";var d=p&&p.directory?p.directory:"images ";var f="";var g=a(this);b=parseInt(b);init();g.next("ul").children("li").hover(function(){$(this).parent().children("li").css('background-image','url('+d+'/empty.png)');var a=$(this).parent().children("li").index($(this));$(this).parent().children("li").slice(0,a+1).css('background-image','url('+d+'/star_icon.png)')},function(){});g.next("ul").children("li").click(function(){var a=$(this).parent().children("li").index($(this));f=a+1;g.val(f);$(".starcount").html(f);if(c!=""){eval(c+"("+g.val()+")")}});g.next("ul").hover(function(){},function(){if(f==""){$(this).children("li").css('background-image','url('+d+'/empty.png)')}else{$(this).children("li").css('background-image','url('+d+'/empty.png)');$(this).children("li").slice(0,f).css('background-image','url('+d+'/star_icon.png)')}});function init(){$('<div style="clear:both;"></div>').insertAfter(g);g.css("float","left");var a=$("<ul>");a.attr("class","webwidget_rating_simple");for(var i=1;i<=b;i++){a.append('<li style="background-image:url('+d+'/empty.png)"><span>'+i+'</span></li>')}a.insertAfter(g);if(e!=""){f=e;g.val(e);$(".starcount").html(e);g.next("ul").children("li").slice(0,f).css('background-image','url('+d+'/star_icon.png)')}}}})(jQuery);
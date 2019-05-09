// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require_tree .
//= require jquery3
//= require jquery
//= require raty-js
//= require popper
//= require bootstrap-sprockets

$(function () {
  $('[data-toggle="popover"]').popover(), 
  $('.raty-form').raty({
    score: 0,
    starType: 'i',
    half: true,
    numberMax: 5,
    precision: true,
    target: undefined,
    targetKeep: true,
  })
  $('.raty-read').raty({
    score: 3.5,
    starType: 'i', 
    half: true, 
    readOnly: true,
  })
  var scroll = new SmoothScroll('a[href^="#"], [data-scroll]',{
    offset: 50
  });
})

$(function(){
$('a[href^="#"]').click(function() {
var speed = 400;
var href= $(this).attr("href");
var target = $(href == "#" || href == "" ? 'html' : href);
var position = target.offset().top;
$('body,html').animate({scrollTop:position}, speed, 'swing');
return false;
});
});
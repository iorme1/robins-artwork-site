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
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

function displayHandler(btn) {
  if ( !$('.paint-index').hasClass("hidden") ) {
    $('.paint-index').addClass("hidden");
  }
  if ( !$('.photo-index').hasClass("hidden") ) {
    $('.photo-index').addClass("hidden");
  }
  if ( !$('.sculp-index').hasClass("hidden") ) {
    $('.sculp-index').addClass("hidden");
  }

  switch(btn) {
    case "Sculptures":
      $('.sculp-index').toggleClass("hidden")
      break;
    case "Paintings":
      $('.paint-index').toggleClass("hidden")
      break;
    case "Photography":
      $('.photo-index').toggleClass("hidden")
      break;
  }

  var currGall = document.getElementById('curr-gal');
  currGall.innerHTML = btn;
}

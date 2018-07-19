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
//= require imagesloaded
//= require_tree .

$(document).on("turbolinks:load", function() {
   window.background = document.querySelector('.dropdownBackground');
   window.nav = document.querySelector('.top');
});


function handleEnter() {
  var liTrigger = this;

  this.classList.add('trigger-enter');
  setTimeout(function() {
     liTrigger.classList.contains('trigger-enter') && liTrigger.classList.add('trigger-enter-active');
   },150);

  background.classList.add('open');
  var dropdown = this.querySelector('.dropdown');
  var dropdownCoords = dropdown.getBoundingClientRect();
  var navCoords = nav.getBoundingClientRect();
  var coords = {
    height: dropdownCoords.height,
    width: dropdownCoords.width,
    top: dropdownCoords.top - navCoords.top,
    left: dropdownCoords.left - navCoords.left
  };

  background.style.setProperty('width', coords.width + "px");
  background.style.setProperty('height', coords.height + "px");
  background.style.setProperty('transform', 'translate(' + coords.left + 'px, ' + coords.top + 'px)');
}


function handleLeave() {
  this.classList.remove('trigger-enter', 'trigger-enter-active');
  background.classList.remove('open');
}


function displayHandler(gallery) {
  // display loading icon
  $('.loader').removeClass('hidden');

  // hide every image that isnt currently hidden
  if ( !$('.paint-index').hasClass("hidden") ) {
    $('.paint-index').addClass("hidden");
  }
  if ( !$('.photo-index').hasClass("hidden") ) {
    $('.photo-index').addClass("hidden");
  }
  if ( !$('.sculp-index').hasClass("hidden") ) {
    $('.sculp-index').addClass("hidden");
  }

  // images loaded gem to detect when all images have been loaded 
  $('.container').imagesLoaded( function() {
      $('.loader').addClass('hidden');

      switch(gallery) {
        case "Sculptures":
          $('.sculp-index').toggleClass("hidden")
          break;
        case "Paintings/Drawings":
          $('.paint-index').toggleClass("hidden")
          break;
        case "Photography":
          $('.photo-index').toggleClass("hidden")
          break;
      }

      var currGall = document.getElementById('curr-gal');
      currGall.innerHTML = gallery;
  });

}

$(document).on('mouseenter', '.li-trigger', handleEnter)
$(document).on('mouseleave', '.li-trigger', handleLeave)

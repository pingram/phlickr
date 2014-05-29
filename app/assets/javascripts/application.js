// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.sortable
//= require jquery.ui.widget
//= require tmpl
//= require dropzone
//= require underscore
//= require serialize_json
//= require notify.min
//= require backbone
//= require bootstrap
//= require phlickr
//= require jquery-fileupload/basic
//= require_tree ../templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers
//= require_tree .

var installHandlers = function () {
  $('img[data-photo-id]').on('click', function (event) {
    var photoId = $(event.currentTarget).data('photo-id')
    Backbone.history.navigate('photos/' + photoId, true)
  })
};

// $(document).ready(function () {
//   var $coverPhoto = $('#cover-photo');
//   if ($coverPhoto !== []) {
//     $coverPhoto.width(window.outerWidth);
//   }
// })


// $(window).load(function () {
//   var $coverPhoto = $('#cover-photo');
//   if ($coverPhoto !== []) {
//     $('div#cover-photo').css('background-size', window.outerWidth + 'px auto');
//   }
// })
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
//= require shepherd.min
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

$(document).ready(function () {
  var shepherd;

    shepherd = new Shepherd.Tour({
      defaults: {
        classes: 'shepherd-element shepherd-open shepherd-theme-arrows',
        showCancelLink: true
      }
    });

    Shepherd.mediator.on('photostreamRendered', shepherd.next);
    Shepherd.mediator.on('albumIndexRendered', shepherd.next);
    Shepherd.mediator.on('photoUploadRendered', shepherd.next);
    Shepherd.mediator.on('albumNewRendered', shepherd.next);
    Shepherd.mediator.on('photoFavoritesRendered', shepherd.next);
    Shepherd.mediator.on('photoExploreRendered', shepherd.next);

    shepherd.addStep('welcome', {
      title: 'Welcome',
      text: ['Click next for a tour of the application or exit to play around on your own.'],
      // attachTo: '.hero-welcome bottom',
      classes: 'shepherd shepherd-open shepherd-theme-arrows shepherd-transparent-text',
      buttons: [
        {
          text: 'Exit',
          classes: 'shepherd-button-secondary',
          action: shepherd.cancel
        }, {
          text: 'Next',
          action: function() {
            Backbone.history.navigate('#upload', { trigger: true });
          },
          classes: 'shepherd-button-example-primary'
        }
      ]
    });
    shepherd.addStep('uploading', {
      title: 'Uploading',
      text: 'From the upload page you can drag and drop photos. If you ' +
        'prefer, you can just click in the dropzone and a file upload dialog ' +
        'will pop up',
      attachTo: '#upload-nav-link bottom',
      buttons: [
        {
          text: 'Back',
          classes: 'shepherd-button-secondary',
          action: shepherd.back
        }, {
          text: 'Next',
          action: function () {
            Backbone.history.navigate('#profile', { trigger: true });
          }
        }
      ]
    });
    shepherd.addStep('photostream', {
      title: 'Photostream',
      text: 'Photos that you uploaded will appear in your Photostream',
      attachTo: '#photostream-low-nav-link bottom',//'#photostream-low-nav-link bottom',
      buttons: [
        {
          text: 'Back',
          classes: 'shepherd-button-secondary',
          action: shepherd.back
        }, {
          text: 'Next',
          action: function () {
            Backbone.history.navigate('#photos/favorites', { trigger: true });
          }
        }
      ]
    });

    shepherd.addStep('favorites', {
      title: 'Favorites',
      text: 'Your favorites is a collection of all photos that you have ' +
        'starred.',
      attachTo: '#favorites-low-nav-link bottom',
      buttons: [
        {
          text: 'Back',
          classes: 'shepherd-button-secondary',
          action: shepherd.back
        }, {
          text: 'Next',
          action: function () {
            Backbone.history.navigate('#albums', { trigger: true });
          }
        }
      ]
    });

    shepherd.addStep('albums', {
      title: 'Albums',
      text: 'You can organize your photos into albums, which will be displayed here',
      attachTo: '#albums-low-nav-link bottom',
      buttons: [
        {
          text: 'Back',
          classes: 'shepherd-button-secondary',
          action: shepherd.back
        }, {
          text: 'Next',
          action: function () {
            Backbone.history.navigate('#albums/new', { trigger: true });
          }
        }
      ]
    });

    shepherd.addStep('newAlbums', {
      title: 'New Albums',
      text: 'To create new albums, simply drag and drop your photos listed ' +
        'below into the center pane.',
      attachTo: '#instruction-text-2 bottom',
      buttons: [
        {
          text: 'Back',
          classes: 'shepherd-button-secondary',
          action: shepherd.back
        }, {
          text: 'Next',
          action: function () {
            Backbone.history.navigate('#photos/explore', { trigger: true });
          }
        }
      ]
    });

    shepherd.addStep('explorePhotos', {
      title: 'Explore Photos',
      text: 'You can scroll through this page of photos, which is populated ' +
        'with the most popular photos on Flickr. Try scrolling to the bottom,' +
        'see if you can!',
      attachTo: '#instruction-text-2 bottom',
      buttons: [
        {
          text: 'Back',
          classes: 'shepherd-button-secondary',
          action: shepherd.back
        }, {
          text: 'Done',
          classes: 'shepherd-button-secondary',
          action: shepherd.cancel
        }
      ]
    });

    shepherd.start();

  // tour = new Shepherd.Tour({
  //   defaults: {
  //     classes: 'shepherd-theme-arrows',
  //     scrollTo: true
  //   }
  // }) 

  // tour.addStep('example-step', {
  //   text: 'This step is attached to the bottom of the <code>#cover-photo</code> element.',
  //   classes: 'example-step-extra-class',
  //   buttons: [ {text: 'Next'}, {action: tour.next} ]
  // })

  // tour.start()
})
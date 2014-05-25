Phlickr.Views.AlbumNew = Backbone.View.extend({
  className: 'body-padded new-album-view-container',
  template: JST['albums/new'],

  initialize: function (options) {
    this.userPhotos = options.collection;
    this.albumPhotos = new Phlickr.Collections.Photos()

    this.listenTo(this.userPhotos, "sync", this.render);
  },

  events: {
    'click .cancel': 'cancel',
    'click .save': 'save'
  },

  render: function () {
    var renderedContent = this.template({
      userPhotos: this.userPhotos,
      albumPhotos: this.albumPhotos
    });
    this.$el.html(renderedContent);

    $( "#sortable1, #sortable2" ).sortable({
      connectWith: ".connected-sortable",
      items: "li"
    }).disableSelection();

    return this;
  },

  cancel: function (event) {
    event.preventDefault();
    Backbone.history.history.back();
  },

  save: function (event) {
    var imageArray = [];
    event.preventDefault();
    $imgs = this.$el.find('#sortable2 img')
    _($imgs).each(function (image) {
      var $image = $(image);
      imageArray.push($image.data('id'));
    });

    var params = this.$el.find('form').serializeJSON()["album"];
    params['photo_ids'] = imageArray
    var newAlbum = new Phlickr.Models.Album(params);

    newAlbum.save([], {
      success: function() {
        Backbone.history.navigate('albums', { trigger: true });
      },
      error: function() {
        // TODO: add validation errors
        Backbone.history.navigate('albums/new', { trigger: true });
      }
    });
  }
})
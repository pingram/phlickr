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
    event.preventDefault();
    debugger
  }
})
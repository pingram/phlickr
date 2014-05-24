Phlickr.Views.AlbumNew = Backbone.View.extend({
  className: 'body-padded new-album-view-container',
  template: JST['albums/new'],

  initialize: function (options) {
    this.userPhotos = options.collection;
    this.albumPhotos = new Phlickr.Collections.Photos()

    this.listenTo(this.userPhotos, "sync", this.render);
  },

  render: function () {
    var renderedContent = this.template({
      userPhotos: this.userPhotos,
      albumPhotos: this.albumPhotos
    });
    this.$el.html(renderedContent);
    return this;
  }
})
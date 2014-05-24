Phlickr.Views.AlbumIndex = Backbone.View.extend({
  className: 'body-padded',
  template: JST['albums/index'],

  initialize: function (options) {
    this.collection = options.collection;
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function () {
    // TODO: break out cover_photo url from album to avoid security risk
    var renderedContent = this.template({
      albums: this.collection
    });
    this.$el.html(renderedContent);
    return this;
  }
})
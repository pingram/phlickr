Phlickr.Views.AlbumShow = Backbone.View.extend({
  className: 'body-padded',
  template: JST['albums/show'],

  initialize: function (options) {
    this.model = options.model;
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var renderedContent = this.template({
      album: this.model,
      photos: this.model.get('photos')
    })
    this.$el.html(renderedContent);
    return this;
  }
})
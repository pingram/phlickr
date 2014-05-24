Phlickr.Views.AlbumNew = Backbone.View.extend({
  className: 'body-padded',
  template: JST['albums/new'],

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  }
})
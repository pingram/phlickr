Phlickr.Views.PhotoExplore = Backbone.CompositeView.extend({
  template: JST['photos/explore'],

  initialize: function (options) {
    this.collection = options.collection;
  },

  render: function () {
    var renderedContent = this.template({
      photos: this.collection
    });
    this.$el.html(renderedContent);
    return this;
  }
})
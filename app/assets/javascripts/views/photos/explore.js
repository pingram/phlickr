Phlickr.Views.PhotoExplore = Backbone.CompositeView.extend({
  className: "body-padded",
  template: JST['photos/explore'],

  initialize: function (options) {
    this.collection = options.collection;
  },

  events: {
    'click .more': 'more'
  },

  render: function () {
    var renderedContent = this.template({
      photos: this.collection
    });
    this.$el.html(renderedContent);
    return this;
  },

  more: function () {
    this.$('.more').html('loading...').attr('disabled', 'disabled');
    Phlickr.Routers.app_router.photoExplore();
  }
})
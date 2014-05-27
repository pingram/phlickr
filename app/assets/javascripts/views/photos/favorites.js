Phlickr.Views.PhotoFavorites = Backbone.CompositeView.extend({
  template: JST['photos/favorites'],

  initialize: function (options) {
    this.user = options.user;
    this.collection = options.collection

    this.listenTo(this.collection, 'sync', this.render);

    var userProfileView = new Phlickr.Views.UserProfile({
      model: this.user
    })
    this.addSubview('.user-profile', userProfileView);
  },

  render: function () {
    var renderedContent = this.template({
      photos: this.collection
    })

    this.$el.html(renderedContent);
    this.renderSubviews();
    return this;
  }
})
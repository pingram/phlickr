Phlickr.Views.Photostream = Backbone.CompositeView.extend({
  template: JST['users/photostream'],

  initialize: function (options) {
    this.collection = options.collection;
    this.user = options.user;
    this.listenTo(this.collection, 'sync', this.render);

    var userProfileView = new Phlickr.Views.UserProfile({
      model: this.user
    })
    this.addSubview('.user-profile', userProfileView);
  },

  render: function () {
    // TODO: break out cover_photo url from album to avoid security risk
    var renderedContent = this.template({
      photos: this.collection
    });
    this.$el.html(renderedContent);
    this.renderSubviews();

    // for working with shepherd.js
    if (this.collection.length > 0) {
      Shepherd.mediator.trigger('photoStreamRendered');
    }

    return this;
  }
})
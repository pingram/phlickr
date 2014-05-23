Phlickr.Views.UserProfile = Backbone.View.extend({
  initialize: function (options) {
    this.model = options.model
  },

  template: JST['users/profile'],

  // TODO: refactor this later so that photos are actual Phlickr photos
  render: function() {
    console.log('render users/profile')
    var renderedContent = this.template({
      user: this.model,
      profilePhoto: this.model.get('profile_photo'),
      photos: this.model.get('photos')
    });
    this.$el.html(renderedContent);
    return this;
  }
});
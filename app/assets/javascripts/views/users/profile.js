Phlickr.Views.UserProfile = Backbone.View.extend({
  initialize: function (options) {
    this.model = options.user
  },

  template: JST['users/profile'],

  // TODO: refactor this later so that photos are actual Phlickr photos
  render: function() {
    console.log('render users/profile')
    var renderedContent = this.template({
      user: this.model,
      profilePhoto: this.model.get('profile_photo')
    });
    this.$el.html(renderedContent);
    return this;
  }
});
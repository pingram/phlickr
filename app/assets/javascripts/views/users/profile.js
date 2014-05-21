Phlickr.Views.UserProfile = Backbone.View.extend({
  initialize: function (options) {
    this.model = options.model
  },

  template: JST['users/profile'],

  render: function() {
    console.log('render users/profile')
    var renderedContent = this.template({
      user: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
});
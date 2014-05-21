Phlickr.Views.UserProfile = Backbone.View.extend({
  template: JST['users/profile'],

  render: function() {
    console.log('render users/profile')
    var renderedContent = this.template({

    });
    this.$el.html(renderedContent);
    return this;
  }
});
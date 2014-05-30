Phlickr.Views.UserProfile = Backbone.View.extend({
  initialize: function (options) {
    this.model = options.model
  },

  template: JST['users/profile'],

  render: function() {
    var renderedContent = this.template({
      user: this.model,
      profilePhoto: this.model.get('profile_photo')
    });
    this.$el.html(renderedContent);
    this.setWidth();
    
    return this;
  },

  setWidth: function () {
    var $coverPhoto = this.$el.find('div#cover-photo');
    if ($coverPhoto !== []) {
      $coverPhoto.css('background-size', window.outerWidth + 'px auto');
    } else {
      alert('no cover photo')
    }
  }
});
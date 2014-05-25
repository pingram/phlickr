Phlickr.Views.AlbumShow = Backbone.CompositeView.extend({
  template: JST['albums/show'],

  initialize: function (options) {
    this.model = options.model;
    this.user = new Phlickr.Models.User({
      fname: this.model.get('name'),
      profile_photo: this.model.get('photos')[0]
    })
    
    var userProfileView = new Phlickr.Views.UserProfile({
      model: this.user
    })
    this.addSubview('.user-profile', userProfileView);
  },

  render: function () {
    var renderedContent = this.template({
      album: this.model,
      photos: this.model.get('photos')
    })

    this.$el.html(renderedContent);
    this.renderSubviews();
    return this;
  }
})
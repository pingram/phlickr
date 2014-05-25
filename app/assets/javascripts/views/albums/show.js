Phlickr.Views.AlbumShow = Backbone.CompositeView.extend({
  template: JST['albums/show'],

  initialize: function (options) {
    this.model = options.model;
    this.user = options.user;

    this.listenTo(this.model, 'sync', this.render);

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
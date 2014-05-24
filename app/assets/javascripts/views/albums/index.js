Phlickr.Views.AlbumIndex = Backbone.CompositeView.extend({
  template: JST['albums/index'],

  initialize: function (options) {
    this.collection = options.collection;
    this.user = options.user;
    this.listenTo(this.collection, 'sync', this.render);

    var userProfileView = new Phlickr.Views.UserProfile({
      model: this.user
    })
    this.addSubview('.user-profile', userProfileView);
  },

  events: {
    'click .albums-new-album': 'newAlbum'
  },

  render: function () {
    // TODO: break out cover_photo url from album to avoid security risk
    var renderedContent = this.template({
      albums: this.collection
    });
    this.$el.html(renderedContent);
    this.renderSubviews();
    return this;
  },

  newAlbum: function () {
    Backbone.history.navigate('albums/new', { trigger: true });
  }
})
Phlickr.Routers.AppRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl
    this.history = [];
  },

  routes: {
    '': 'photostream', // for some reason this wasn't working with back requests
    'profile': 'photostream',
    'photostream': 'photostream',
    'photos/:id': 'photoShow',
    'upload': 'photoUpload',
    'albums': 'albumIndex',
    'albums/:id': 'albumShow'
  },

  albumIndex: function () {
    var router = this;
    var albums = new Phlickr.Collections.Albums();
    albums.fetch();
    // TODO: change this to a class method 2
    Phlickr.Models.User.prototype.getCurrentUser(function(userModel) {
      console.log('route to albumIndex');
      var view = new Phlickr.Views.AlbumIndex({
        user: userModel,
        collection: albums
      });
      router._swapView(view);
    });
  },

  albumShow: function (id) {
    var album = new Phlickr.Models.Album({id: id});
    album.fetch();
    console.log('route to album show');
    var view = new Phlickr.Views.AlbumShow({
      model: album
    });
    this._swapView(view);
  },

  photostream: function () {
    var router = this;
    // TODO: change this to a class method 2
    Phlickr.Models.User.prototype.getCurrentUser(function(userModel) {
      console.log('route to user profile');
      var photos = new Phlickr.Collections.PhotostreamPhotos([], {
        userId: userModel.id
      });
      photos.fetch();
      var view = new Phlickr.Views.Photostream({
        user: userModel,
        collection: photos
      });
      router._swapView(view);
    });
  },

  // userProfile: function () {
  //   // TODO: change this to a class method
  //   var router = this;
  //   Phlickr.Models.User.prototype.getCurrentUser(function(model) {
  //     console.log('route to user profile');
  //     var view = new Phlickr.Views.UserProfile({
  //       model: model
  //     });
  //     router._swapView(view);
  //   });
  // },

  photoShow: function (id) {
    var photo = new Phlickr.Models.Photo({ id: id });
    var user = new Phlickr.Models.User();
    photo.fetch();
    console.log('route to user profile');
    var view = new Phlickr.Views.PhotoShow({
      model: photo
    });
    this._swapView(view);
  },

  photoUpload: function () {
    console.log('route to photo upload');
    var view = new Phlickr.Views.PhotoUpload();
    this._swapView(view);
  },

  _swapView: function (view) {
    if (this._currentView) {
      this._currentView.remove();
    }
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
    installHandlers();
  }
});
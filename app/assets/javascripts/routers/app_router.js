Phlickr.Routers.AppRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl
    this.history = [];
  },

  routes: {
    '': 'userProfile', // for some reason this wasn't working with back requests
    'profile': 'userProfile',
    'photos/:id': 'photoShow',
    'upload': 'photoUpload',
    'albums/:id': 'albumShow'
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

  userProfile: function () {
    // TODO: change this to a class method
    var router = this;
    Phlickr.Models.User.prototype.getCurrentUser(function(model) {
      console.log('route to user profile');
      var view = new Phlickr.Views.UserProfile({
        model: model
      });
      router._swapView(view);
    });
  },

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
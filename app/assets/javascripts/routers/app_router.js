Phlickr.Routers.AppRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl
    this.history = [];
  },

  routes: {
    '': 'photoExplore',
    'profile': 'photostream',
    'photostream': 'photostream',
    'photos/explore': 'photoExplore',
    'photos/favorites': 'photoFavorites',
    'photos/:id': 'photoShow',
    'upload': 'photoUpload',
    'albums': 'albumIndex',
    'albums/new': 'albumNew',
    'albums/:id': 'albumShow',
  },

  photoFavorites: function () {
    var router = this;
    var photos = new Phlickr.Collections.Photos();
    photos.fetch({
      url: 'api/photos/favorites'
    });
    // TODO: change this to a class method 2
    Phlickr.Models.User.prototype.getCurrentUser(function(userModel) {
      console.log('route to favorite photos');
      var view = new Phlickr.Views.PhotoFavorites({
        user: userModel,
        collection: photos
      });
      router._swapView(view);
    });
  },

  photoExplore: function () {
    console.log("route to photo explore");

    var router = this;

    if(!Phlickr.Collections.explorePhotos){
      Phlickr.Collections.explorePhotos = new Phlickr.Collections.ExplorePhotos;
      Phlickr.Collections.explorePhotos.page = 1;
      Phlickr.Collections.explorePhotos.isLoading = false;
    }
    else {
      // increment the page
      Phlickr.Collections.explorePhotos.page++;
    }

    Phlickr.Collections.explorePhotos.url =
      'api/photos/explore/' + Phlickr.Collections.explorePhotos.page;

    Phlickr.Collections.explorePhotos.pageWidth = $(document).width();

    Phlickr.Collections.explorePhotos.fetch({
      data: {
        page_width: Phlickr.Collections.explorePhotos.pageWidth
      },
      remove: false,
      success: function() {
        if (!Phlickr.Views.photoExplore) {
          Phlickr.Views.photoExplore = new Phlickr.Views.PhotoExplore({
            collection: Phlickr.Collections.explorePhotos
          });
          router._swapView(Phlickr.Views.photoExplore);

          // TODO: isLoading should really update when the photos load
          Phlickr.Collections.explorePhotos.isLoading = false;
        }
        else {
          Phlickr.Collections.explorePhotos.isLoading = false;
        }
      },
      error: function() {
        new Error({ message: "Error loading documents." });
      }
    });
  },

  albumNew: function () {
    console.log('route to albumNew');
    var router = this;

    Phlickr.Models.User.prototype.getCurrentUser(function(userModel) {
      var userPhotos = new Phlickr.Collections.UserPhotos([], {
        user_id: userModel.id
      });
      userPhotos.fetch();

      var view = new Phlickr.Views.AlbumNew({
        collection: userPhotos
      });
      router._swapView(view);
    });
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
    console.log('route to album show');
    var router = this;
    var album = new Phlickr.Models.Album({ id: id });
    album.fetch({
      success: function (album) {
        var view = new Phlickr.Views.AlbumShow({
          model: album
        });
        router._swapView(view);
      }
    })
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
    this.cleanupExplore(view);
    if (this._currentView) {
      this._currentView.remove();
    }
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
    installHandlers();
  },

  cleanupExplore: function (view) {
    if (Phlickr.Views.photoExplore && view !== Phlickr.Views.photoExplore) {
      Phlickr.Views.photoExplore.remove();
      delete Phlickr.Views['photoExplore'];
      delete Phlickr.Collections['explorePhotos'];
    }
  }
});
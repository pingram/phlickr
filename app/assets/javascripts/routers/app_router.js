Phlickr.Routers.AppRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl
    this.history = [];
  },

  routes: {
    '': 'userProfile', // for some reason this wasn't working with back requests
    'profile': 'userProfile',
    'photos/:id': 'photoShow'
  },

  userProfile: function () {
    // TODO: change this to a class method
    var router = this;
    Phlickr.Models.User.prototype.getCurrentUser(function(model) {
      // debugger
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

  _swapView: function (view) {
    if (this._currentView) {
      this._currentView.remove();
    }
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
    installHandlers();
  }
});
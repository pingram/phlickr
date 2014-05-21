Phlickr.Routers.AppRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl
  },

  routes: {
    '': 'userProfile',
    'profile': 'userProfile'
  },

  userProfile: function() {
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


  _swapView: function(view) {
    if (this._currentView) {
      this._currentView.remove();
    }
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
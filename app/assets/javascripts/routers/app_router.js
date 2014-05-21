Phlickr.Routers.AppRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl
  },

  routes: {
    'profile': 'userProfile'
  },

  userProfile: function() {
    console.log('route to user profile');
    var view = new Phlickr.Views.UserProfile({

    });
    this._swapView(view);
  },


  _swapView: function(view) {
    if (this._currentView) {
      this._currentView.remove();
    }
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
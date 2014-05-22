Phlickr.Models.User = Backbone.Model.extend({
  urlRoot: 'api/users',

  getCurrentUser: function (callback) {
    // TODO: add memoization
    $.ajax({
      url: 'api/users/profile.json',
      success: function(resp) {
        var cur_user = new Phlickr.Models.User(resp);
        callback(cur_user);
      }
    });
  }
});
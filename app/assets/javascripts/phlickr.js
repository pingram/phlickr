window.Phlickr = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    // alert('Hello from Backbone!');
    new Phlickr.Routers.AppRouter({
      $rootEl: $('#content')
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Phlickr.initialize();
});

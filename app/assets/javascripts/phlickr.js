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
    Backbone.history.start({ })//pushState: true });
  }
};

$(document).ready(function(){
  Phlickr.initialize();
});
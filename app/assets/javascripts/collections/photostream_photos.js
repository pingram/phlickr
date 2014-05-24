Phlickr.Collections.PhotostreamPhotos = Backbone.Collection.extend({
  model: Phlickr.Models.Photo,
  
  url: function() {
    return 'api/users/' + this.userId + '/photos'
  },
  
  initialize: function (models, options) {
    this.userId = options.userId;
  }
})
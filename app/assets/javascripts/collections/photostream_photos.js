Phlickr.Collections.PhotostreamPhotos = Backbone.Collection.extend({
  model: Phlickr.Models.Photo,
  
  url: function() {
    return 'api/users/' + this.user_id + '/photos'
  },
  
  initialize: function (models, options) {
    this.user_id = options.user_id;
  }
})
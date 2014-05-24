Phlickr.Collections.AlbumPhotos = Backbone.Collection.extend({
  model: Phlickr.Models.Photo,
  url: function() {
    return 'api/albums/' + this.album_id + '/photos'
  },
  
  initialize: function (models, options) {
    this.album_id = options.album_id;
  }
})